import 'package:dio/dio.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/local/secure_storage/token_manager.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/remote/dio_client.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_environment.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/connectivity_helper.dart';
import 'download_client_impl.dart';

abstract class DownloadClient {
  final Dio dio;
  final String baseUrl;

  DownloadClient(this.dio, {required this.baseUrl});

  Future<String?> downloadFile(String path);

  static Future<DownloadClient?> create({
    Map<String, dynamic> headers = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
  }) async {
    if (!ConnectivityHelper.ensureOnlineConnection()) return null;

    final Map<String, dynamic> newHeaders = {...headers};

    String? token = await TokenManager().getToken();

    if (token?.isNotEmpty ?? false) {
      newHeaders['Authorization'] = 'Bearer $token';
    }

    final dio = await DioClient.create(
      headers: newHeaders,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );

    return DownloadClientImpl(
      dio,
      baseUrl: Environments.apiUrl,
    );
  }
}
