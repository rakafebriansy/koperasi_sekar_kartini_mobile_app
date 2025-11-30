import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
@freezed
class BaseResponse<T> with _$BaseResponse<T> {
  const factory BaseResponse({
    required bool success,
    String? message,
    String? token,
    T? data,
  }) = _BaseResponse<T>;

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT, // <-- ini argumen tambahan
  ) {
    final rawData = json['data'];
    return BaseResponse<T>(
      success: json['success'] as bool,
      message: json['message'] as String?,
      token: json['token'] as String?,
      data: rawData != null ? fromJsonT(rawData) : null,
    );
  }
}
