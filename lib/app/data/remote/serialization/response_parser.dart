import 'package:koperasi_sekar_kartini_mobile_app/app/data/remote/base_response/base_response.dart';

class ResponseParser {
  static BaseResponse<T> parse<T>(
    dynamic raw,
    T Function(dynamic dataObj)? mapper,
  ) {
    if (raw is! Map<String, dynamic>) {
      throw Exception("Invalid API response format: $raw");
    }

    final data = raw['data'];

    dynamic parsed;

    if (data == null) {
      parsed = null;
    } else {
      if (mapper != null) {
        parsed = mapper(data);
      } else {
        if (T == int ||
            T == double ||
            T == String ||
            T == bool ||
            T == List ||
            T == Map) {
          parsed = data as T;
        } else {
          throw Exception(
            "Mapper function must be provided for non-primitive type $T",
          );
        }
      }
    }

    return BaseResponse<T>(
      success: raw['success'] ?? true,
      message: raw['message'],
      data: parsed,
      token: raw['token'],
    );
  }
}
