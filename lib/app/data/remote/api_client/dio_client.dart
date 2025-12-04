import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class DioClient {
  static Map<String, dynamic> baseHeaders = {
    'Accept': 'application/json',
  };

  static Future<Dio> create({
    Map<String, dynamic> headers = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
  }) async {
    final dio = Dio(
      BaseOptions(
        connectTimeout: Duration(milliseconds: connectTimeout),
        receiveTimeout: Duration(milliseconds: receiveTimeout),
      ),
    );

    dio.options.headers.addAll(baseHeaders);
    dio.options.headers.addAll(headers);
  
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        enabled: !kReleaseMode,
        filter: (options, args) => !([].contains(options.path) || options.responseType == ResponseType.bytes),
      ),
    );

    return dio;
  }
}
