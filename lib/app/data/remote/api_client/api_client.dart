import 'dart:io';

import 'package:dio/dio.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/local/secure_storage/token_manager.dart';
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

  // AUTH
  @POST("/login")
  Future<dynamic> login({
    @Field('phone_number') required String phoneNumber,
    @Field('password') required String password,
  });

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

  // WORK AREA

  @GET("/work-areas")
  Future<dynamic> getWorkAreas({@Query('search') String? search});

  @POST("/work-areas")
  Future<dynamic> createWorkArea({@Field("name") String? name});

  @POST("/work-areas/{id}")
  Future<dynamic> updateWorkArea({
    @Path('id') required int id,

    @Field("_method") String method = "PUT",

    @Field("name") String? name,
  });

  @POST("/work-areas/{id}")
  Future<dynamic> deleteWorkArea({
    @Path('id') required int id,

    @Field("_method") String method = "DELETE",
  });

  // USER
  @GET("/users")
  Future<dynamic> getUsers({
    @Query('search') String? search,
    @Query('group_id') int? groupId,
    @Query('role') String? role,
  });

  @GET("/unlisted-users")
  Future<dynamic> getUnlistedUsers({@Query('search') String? search});

  @POST("/users")
  @MultiPart()
  Future<dynamic> createUser({
    @Part(name: "identity_number") String? identityNumber,
    @Part(name: "member_number") String? memberNumber,
    @Part(name: "name") String? name,
    @Part(name: "birth_date") String? birthDate,
    @Part(name: "phone_number") String? phoneNumber,
    @Part(name: "address") String? address,
    @Part(name: "occupation") String? occupation,
    @Part(name: "password") String? password,
    @Part(name: "role") String? role,
    @Part(name: "identity_card_photo") File? identityCardPhoto,
    @Part(name: "self_photo") File? selfPhoto,
    @Part(name: "member_card_photo") File? memberCardPhoto,
  });

  
  @POST("/users/{id}")
  @MultiPart()
  Future<dynamic> updateUser({
    @Path("id") required int id,

    @Part(name: "_method") String method = "PUT",

    @Part(name: "identity_number") String? identityNumber,
    @Part(name: "name") String? name,
    @Part(name: "birth_date") String? birthDate,
    @Part(name: "member_number") String? memberNumber,
    @Part(name: "phone_number") String? phoneNumber,
    @Part(name: "address") String? address,
    @Part(name: "occupation") String? occupation,
    @Part(name: "role") String? role,
    @Part(name: "password") String? password,
    @Part(name: "work_area_id") int? workAreaId,
    @Part(name: "identity_card_photo") File? identityCardPhoto,
    @Part(name: "self_photo") File? selfPhoto,
    @Part(name: "member_card_photo") File? memberCardPhoto,
  });

  
  @POST("/users/{id}")
  Future<dynamic> deleteUser({
    @Part(name: "_method") String method = "DELETE",

    @Path('id') required int id,
  });

  @POST("/users/{id}/group/{group_id}")
  Future<dynamic> addGroupMember({
    @Path('id') required int id,
    @Path('group_id') required int groupId,

    @Field("_method") String method = "PATCH",
  });

  // GROUP
  @GET("/groups")
  Future<dynamic> getGroups({
    @Query('search') String? search,
    @Query('work_area_id') int? workAreaId,
  });

  @GET("/groups/{id}")
  Future<dynamic> getGroup({@Path('id') required int id});

  @POST("/groups")
  Future<dynamic> createGroup({
    @Field("number") int? number,
    @Field("description") String? description,
    @Field("work_area_id") int? workAreaId,
    @Field("chairman_id") int? chairmanId,
    @Field("facilitator_id") int? facilitatorId,
  });

  @POST("/groups/{id}")
  Future<dynamic> updateGroup({
    @Path('id') required int id,

    @Field("_method") String method = "PUT",

    @Field("number") int? number,
    @Field("description") String? description,
    @Field("work_area_id") int? workAreaId,
    @Field("chairman_id") int? chairmanId,
    @Field("facilitator_id") int? facilitatorId,
  });

  @POST("/groups/{id}")
  Future<dynamic> deleteGroup({
    @Part(name: "_method") String method = "DELETE",

    @Path('id') required int id,
  });

  @POST("/groups/{id}/chairman/{user_id}")
  Future<dynamic> updateGroupChairman({
    @Path('id') required int id,
    @Path('user_id') required int userId,

    @Field("_method") String method = "PATCH",
  });

  @POST("/groups/{id}/facilitator/{user_id}")
  Future<dynamic> updateGroupFacilitator({
    @Path('id') required int id,
    @Path('user_id') required int userId,

    @Field("_method") String method = "PATCH",
  });
}
