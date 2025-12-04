import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/remote/serialization/model_registry.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/remote/api_client/api_client.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/remote/serialization/response_parser.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> json);

class ApiHelper {
  static Future<T> fetch<T>({
    required Future<dynamic> Function(ApiClient api) request,
    Map<String, dynamic> headers = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
  }) async {
    try {
      final apiClient = await ApiClient.create(
        headers: headers,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
      );

      if (apiClient == null) throw Exception('API Client is null');

      final raw = await request(apiClient);

      final response = ResponseParser.parse<T>(raw, (dataObj) {
        return ModelRegistry.fromJson<T>(dataObj);
      });

      if (response.success == false) {
        throw Exception("API returned false");
      }

      if (response.data == null) {
        throw Exception("API returned null data for type $T");
      }

      if (response.token != null) {
        AuthController.find.tokenManager.setToken(response.token);
      }

      return response.data as T;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<T>> fetchList<T>({
    required Future<dynamic> Function(ApiClient api) request,
    Map<String, dynamic> headers = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
  }) async {
    try {
      final apiClient = await ApiClient.create(
        headers: headers,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
      );

      if (apiClient == null) throw Exception('API Client is null');

      final raw = await request(apiClient);

      final response = ResponseParser.parse<List<T>>(raw, (dataObj) {
        return dataObj
                .map((e) => ModelRegistry.fromJson<T>(e))
                .toList()
                .cast<T>()
            as List<T>;
      });

      if (response.success == false) {
        throw Exception("API returned false");
      }

      if (response.data == null) {
        throw Exception("API returned null data for type $T");
      }

      if (response.token != null) {
        AuthController.find.tokenManager.setToken(response.token);
      }

      return response.data as List<T>;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> fetchNonReturnable({
    required Future<dynamic> Function(ApiClient api) request,
    Map<String, dynamic> headers = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
  }) async {
    try {
      final apiClient = await ApiClient.create(
        headers: headers,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
      );

      if (apiClient == null) throw Exception('API Client is null');

      final raw = await request(apiClient);

      if (raw is Map<String, dynamic> && raw['success'] == false) {
        throw Exception("API returned false");
      }

      if (raw is Map<String, dynamic> && raw['token'] != null) {
        AuthController.find.tokenManager.setToken(raw['token']);
      }
    } catch (e) {
      rethrow;
    }
  }
}
