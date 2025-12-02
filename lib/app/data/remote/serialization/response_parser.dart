import 'package:koperasi_sekar_kartini_mobile_app/app/data/remote/base_response/base_response.dart';

class ResponseParser {
  /// [raw] adalah response asli dari API, biasanya Map<String, dynamic>
  /// [mapper] adalah fungsi yang mengubah item dari raw['data'] menjadi model
  static BaseResponse<T> parse<T>(
    dynamic raw,
    T Function(dynamic dataObj) mapper,
  ) {
    if (raw is! Map<String, dynamic>) {
      throw Exception("Invalid API response format: $raw");
    }

    final data = raw['data'];

    // parsed akan menampung data setelah diproses mapper
    dynamic parsed;

    if (data == null) {
      parsed = null;
    } else {
      // Mapper akan menangani sendiri apakah data adalah List atau Map
      parsed = mapper(data);
    }

    return BaseResponse<T>(
      success: raw['success'] ?? true,
      message: raw['message'],
      data: parsed,
      token: raw['token'],
    );
  }
}
