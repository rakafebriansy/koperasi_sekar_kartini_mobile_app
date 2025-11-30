import 'package:koperasi_sekar_kartini_mobile_app/app/data/serialization/model_registry.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/remote/api_client/api_client.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/serialization/response_parser.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> json);

class ApiHelper {
  // static Future<T?> fetch<T>({
  //   required Future<dynamic> Function(ApiClient apiClient) request,
  //   required FromJson<T> fromJson,
  //   Map<String, dynamic> headers = const {},
  //   int connectTimeout = 30000,
  //   int receiveTimeout = 30000,
  // }) async {
  //   final apiClient = await ApiClient.create(
  //     headers: headers,
  //     connectTimeout: connectTimeout,
  //     receiveTimeout: receiveTimeout,
  //   );
  //   if (apiClient == null) return null;

  //   final raw = await request(apiClient);

  //   final resp = ResponseParser.parse<T>(raw, fromJson);

  //   if (!resp.success) {
  //     throw Exception(resp.message ?? 'API request failed');
  //   }

  //   return resp.data;
  // }

  static Future<T?> fetch<T>({
    required Future<dynamic> Function(ApiClient api) request,
    Map<String, dynamic> headers = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
  }) async {
    final apiClient = await ApiClient.create(
      headers: headers,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );
    if (apiClient == null) return null;

    final raw = await request(apiClient);

    final resp = ResponseParser.parse<T>(raw, (json) {
      try {
        return ModelRegistry.fromJson<T>(json);
      } catch (e) {
        throw Exception(
          'Model of type $T is not registered in ModelRegistry. Did you forget to register it?',
        );
      }
    });

    if (!resp.success) {
      throw Exception(resp.message ?? 'API request failed');
    }

    return resp.data;
  }
}
