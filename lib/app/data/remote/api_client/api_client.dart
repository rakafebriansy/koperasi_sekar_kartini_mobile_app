import 'dart:io';

import 'package:dio/dio.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/local/secure_storage/token_manager.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/remote/api_requests/login/login_request.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/remote/dio_client.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_constant.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_environment.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/connectivity_helper.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: DEVELOPMENT_BASE_URL)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl, ParseErrorLogger errorLogger}) =
      _ApiClient;

  static Future<ApiClient?> create({
    Map<String, dynamic> headers = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
  }) async {
    if (!ConnectivityHelper.ensureOnlineConnection()) return null;

    final Map<String, dynamic> newHeaders = {};

    newHeaders.addAll(headers);

    String? token = await TokenManager().getToken();

    if (token?.isNotEmpty ?? false) {
      newHeaders.addAll({'Authorization': 'Bearer $token'});
    }

    return ApiClient(
      await DioClient.create(
        headers: newHeaders,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
      ),
      baseUrl: Environments.apiUrl,
    );
  }

  @POST("/login")
  Future<dynamic> login(@Body() LoginRequest body);

  @POST("/register")
  @MultiPart()
  Future<dynamic> register({
    @Part(name: "identity_number") required String identityNumber,
    @Part(name: "member_number") required String memberNumber,
    @Part(name: "name") required String name,
    @Part(name: "birth_date") required String birthDate,
    @Part(name: "phone_number") required String phoneNumber,
    @Part(name: "address") required String address,
    @Part(name: "occupation") required String occupation,
    @Part(name: "password") required String password,
    @Part(name: "work_area_id") required int workAreaId,
    @Part(name: "identity_card_photo") required File identityCardPhoto,
    @Part(name: "self_photo") required File selfPhoto,
  });
}
