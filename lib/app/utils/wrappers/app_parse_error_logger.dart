import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

class AppParseErrorLogger extends ParseErrorLogger {
  void logError(
    Object error,
    StackTrace stackTrace,
    RequestOptions requestOptions, [
    Response? response,
  ]) {
    print('Error: $error');
    print('Request: ${requestOptions.path}');
    if (response != null) print('Response: ${response.data}');
  }
}
