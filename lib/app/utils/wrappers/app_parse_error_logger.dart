import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

class AppParseErrorLogger extends ParseErrorLogger {
  @override
  void logError(
    Object error,
    StackTrace stackTrace,
    RequestOptions requestOptions, [
    Response? response,
  ]) {
    debugPrint('Error: $error');
    debugPrint('Request: ${requestOptions.path}');
    if (response != null) debugPrint('Response: ${response.data}');
  }
}
