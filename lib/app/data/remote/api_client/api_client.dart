import 'dart:io';

import 'package:dio/dio.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/local/secure_storage/token_manager.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/remote/api_requests/login/login_request.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/remote/api_client/dio_client.dart';
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

  // AUTH
  @POST("/login")
  Future<dynamic> login(@Body() LoginRequest body);

  @POST("/register")
  @MultiPart()
  Future<dynamic> register({
    @Part(name: "identity_number") String? identityNumber,
    @Part(name: "name") String? name,
    @Part(name: "birth_date") String? birthDate,
    @Part(name: "phone_number") String? phoneNumber,
    @Part(name: "address") String? address,
    @Part(name: "occupation") String? occupation,
    @Part(name: "password") String? password,
    @Part(name: "work_area_id") int? workAreaId,
    @Part(name: "identity_card_photo") File? identityCardPhoto,
    @Part(name: "self_photo") File? selfPhoto,
  });

  @GET("/refresh")
  Future<dynamic> refreshToken();

  @POST("/logout")
  Future<dynamic> logout();

  // EMPLOYEE
  @GET("/employees")
  Future<dynamic> getEmployees({@Query('search') String? search});

  @POST("/employees")
  @MultiPart()
  Future<dynamic> createEmployee({
    @Part(name: "identity_number") String? identityNumber,
    @Part(name: "member_number") String? memberNumber,
    @Part(name: "name") String? name,
    @Part(name: "birth_date") String? birthDate,
    @Part(name: "phone_number") String? phoneNumber,
    @Part(name: "address") String? address,
    @Part(name: "occupation") String? occupation,
    @Part(name: "password") String? password,
    @Part(name: "identity_card_photo") File? identityCardPhoto,
    @Part(name: "self_photo") File? selfPhoto,
  });

  @POST("/employees/{id}")
  @MultiPart()
  Future<dynamic> updateEmployee({
    @Path('id') required int id,

    @Part(name: "_method") String method = "PUT",

    @Part(name: "identity_number") String? identityNumber,
    @Part(name: "member_number") String? memberNumber,
    @Part(name: "name") String? name,
    @Part(name: "birth_date") String? birthDate,
    @Part(name: "phone_number") String? phoneNumber,
    @Part(name: "address") String? address,
    @Part(name: "occupation") String? occupation,
    @Part(name: "password") String? password,
    @Part(name: "identity_card_photo") File? identityCardPhoto,
    @Part(name: "self_photo") File? selfPhoto,
  });

  @DELETE("/employees")
  Future<dynamic> deleteEmployee({@Path('id') required int id});
}
