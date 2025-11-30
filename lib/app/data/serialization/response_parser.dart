import 'package:koperasi_sekar_kartini_mobile_app/app/data/remote/base_response/base_response.dart';

class ResponseParser {
  static BaseResponse<T> parse<T>(
      dynamic raw, T Function(Map<String, dynamic>) fromJson) {
    if (raw is Map<String, dynamic>) {
      return BaseResponse<T>.fromJson(raw, (obj) {
        if (obj is Map<String, dynamic>) {
          return fromJson(obj);
        } else {
          throw Exception("Data is not a JSON object");
        }
      });
    } else {
      throw Exception("Response is not a valid JSON object");
    }
  }
}
