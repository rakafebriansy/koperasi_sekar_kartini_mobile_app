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

  @POST("/change-password")
  Future<dynamic> changePassword({
    @Field("_method") String method = "PATCH",

    @Field('password') required String password,
    @Field('new_password') required String newPassword,
  });

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

  @GET("/unlisted-members")
  Future<dynamic> getUnlistedMembers({
    @Query('search') String? search,
    @Query('work_area_id') int? workAreaId,
  });

  @GET("/inactive-members")
  Future<dynamic> getInactiveMembers({@Query('search') String? search});

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

  @POST("/users/{id}/activate")
  Future<dynamic> activateMember({
    @Path('id') required int id,

    @Field("_method") String method = "PATCH",

    @Field("is_active") bool? isActive,
  });

  @POST("/users/{id}")
  Future<dynamic> deleteUser({
    @Field("_method") String method = "DELETE",

    @Path('id') required int id,
  });

  @POST("/users/{id}/groups/{group_id}")
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
    @Field("_method") String method = "DELETE",

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

  @POST("/groups/{id}/update-fund-amount")
  Future<dynamic> updateFundAmount({
    @Path('id') required int id,

    @Field("_method") String method = "PATCH",

    @Field("fund_type") String? fundType,
    @Field("fund_amount") int? fundAmount,
  });

  // MEETING
  @GET("/meetings")
  Future<dynamic> getMeetings({
    @Query('search') String? search,
    @Query('group_id') int? groupId,
    @Query('limit') int? limit,
  });

  @GET("/meetings/upcoming")
  Future<dynamic> getUpcomingMeeting();

  @GET("/meetings/{id}")
  Future<dynamic> getMeeting({@Path('id') required int id});

  @POST("/meetings")
  @MultiPart()
  Future<dynamic> createMeeting({
    @Part(name: "name") String? name,
    @Part(name: "type") String? type,
    @Part(name: "datetime") String? datetime,
    @Part(name: "location") String? location,
    @Part(name: "description") String? description,
    @Part(name: "photo") File? photo,
    @Part(name: "group_id") int? groupId,
    @Part(name: "user_id") int? userId,
  });

  @POST("/meetings/{id}")
  @MultiPart()
  Future<dynamic> updateMeeting({
    @Path('id') required int id,

    @Part(name: "_method") String method = "PUT",

    @Part(name: "name") String? name,
    @Part(name: "type") String? type,
    @Part(name: "datetime") String? datetime,
    @Part(name: "location") String? location,
    @Part(name: "description") String? description,
    @Part(name: "photo") File? photo,
    @Part(name: "group_id") int? groupId,
    @Part(name: "user_id") int? userId,
  });

  @POST("/meetings/{id}")
  Future<dynamic> deleteMeeting({
    @Field("_method") String method = "DELETE",

    @Path('id') required int id,
  });

  // LOAN
  @GET("/loans")
  Future<dynamic> getLoans({
    @Query('search') String? search,
    @Query('member_id') int? memberId,
  });

  @GET("/loans/{id}")
  Future<dynamic> getLoan({@Path('id') required int id});

  @GET("/loans/sum-by-month")
  Future<dynamic> getLoanSumByMonth({
    @Field('month') required int month,
    @Field('year') required int year,
  });

  @POST("/loans")
  Future<dynamic> createLoan({
    @Field("type") String? type,
    @Field("nominal") int? nominal,
    @Field("year") int? year,
    @Field("month") int? month,
    @Field("user_id") int? userId,
  });

  @POST("/loans/{id}")
  Future<dynamic> updateLoan({
    @Path('id') required int id,

    @Field("_method") String method = "PUT",

    @Field("status") String? status,
    @Field("type") String? type,
    @Field("nominal") int? nominal,
    @Field("year") int? year,
    @Field("month") int? month,
    @Field("user_id") int? userId,
  });

  @POST("/loans/{id}")
  Future<dynamic> deleteLoan({
    @Field("_method") String method = "DELETE",

    @Path('id') required int id,
  });

  // SAVINGS
  @GET("/savings")
  Future<dynamic> getSavings({
    @Query('search') String? search,
    @Query('member_id') int? memberId,
  });

  @GET("/savings/{id}")
  Future<dynamic> getSingleSavings({@Path('id') required int id});

  @GET("/savings/sum-by-month")
  Future<dynamic> getSavingsSumByMonth({
    @Field('month') required int month,
    @Field('year') required int year,
  });

  @POST("/savings")
  Future<dynamic> createSavings({
    @Field("type") String? type,
    @Field("nominal") int? nominal,
    @Field("year") int? year,
    @Field("month") int? month,
    @Field("user_id") int? userId,
  });

  @POST("/savings/{id}")
  Future<dynamic> updateSavings({
    @Path('id') required int id,

    @Field("_method") String method = "PUT",

    @Field("type") String? type,
    @Field("nominal") int? nominal,
    @Field("year") int? year,
    @Field("month") int? month,
    @Field("user_id") int? userId,
  });

  @POST("/savings/{id}")
  Future<dynamic> deleteSavings({
    @Field("_method") String method = "DELETE",

    @Path('id') required int id,
  });

  // REPORT
  @GET("/groups/{group_id}/reports")
  Future<dynamic> getReports({
    @Path('group_id') required int groupId,

    @Query('search') String? search,
  });

  @POST('/groups/{group_id}/reports')
  Future<dynamic> createReport({
    @Path('group_id') required int groupId,

    @Field() required int quarter,
    @Field() required int year,
    @Field('member_growth_in') required int memberGrowthIn,
    @Field('member_growth_in_percentage') int? memberGrowthInPercentage,
    @Field('member_growth_out') required int memberGrowthOut,
    @Field('member_growth_out_percentage') int? memberGrowthOutPercentage,
    @Field('group_member_total') int? groupMemberTotal,
    @Field('group_member_total_percentage') int? groupMemberTotalPercentage,
    @Field('administrative_compliance_percentage')
    required int administrativeCompliancePercentage,
    @Field('deposit_compliance_percentage')
    required int depositCompliancePercentage,
    @Field('attendance_percentage') required int attendancePercentage,
    @Field('organization_final_score_percentage')
    required int organizationFinalScorePercentage,
    @Field('loan_participation_pb') required int loanParticipationPb,
    @Field('loan_participation_bbm') required int loanParticipationBbm,
    @Field('loan_participation_store') required int loanParticipationStore,
    @Field('cash_participation') required int cashParticipation,
    @Field('cash_participation_percentage')
    required int cashParticipationPercentage,
    @Field('savings_participation') required int savingsParticipation,
    @Field('savings_participation_percentage')
    required int savingsParticipationPercentage,
    @Field('meeting_deposit_percentage') required int meetingDepositPercentage,
    @Field('loan_balance_pb') required int loanBalancePb,
    @Field('loan_balance_bbm') required int loanBalanceBbm,
    @Field('loan_balance_store') required int loanBalanceStore,
    @Field('receivable_score') required int receivableScore,
    @Field('financial_final_score_percentage')
    required int financialFinalScorePercentage,
    @Field('combined_final_score_percentage')
    required int combinedFinalScorePercentage,
    @Field('criteria') required String criteria,
  });

  @POST('/groups/{group_id}/reports/{id}')
  Future<dynamic> updateReport({
    @Path('id') required int id,
    @Path('group_id') required int groupId,

    @Field("_method") String method = "PUT",

    @Field('member_growth_in') int? memberGrowthIn,
    @Field('member_growth_in_percentage') int? memberGrowthInPercentage,
    @Field('member_growth_out') int? memberGrowthOut,
    @Field('member_growth_out_percentage') int? memberGrowthOutPercentage,
    @Field('group_member_total') int? groupMemberTotal,
    @Field('group_member_total_percentage') int? groupMemberTotalPercentage,
    @Field('administrative_compliance_percentage')
    int? administrativeCompliancePercentage,
    @Field('deposit_compliance_percentage') int? depositCompliancePercentage,
    @Field('attendance_percentage') int? attendancePercentage,
    @Field('organization_final_score_percentage')
    int? organizationFinalScorePercentage,
    @Field('loan_participation_pb') int? loanParticipationPb,
    @Field('loan_participation_bbm') int? loanParticipationBbm,
    @Field('loan_participation_store') int? loanParticipationStore,
    @Field('cash_participation') int? cashParticipation,
    @Field('cash_participation_percentage') int? cashParticipationPercentage,
    @Field('savings_participation') int? savingsParticipation,
    @Field('savings_participation_percentage')
    int? savingsParticipationPercentage,
    @Field('meeting_deposit_percentage') int? meetingDepositPercentage,
    @Field('loan_balance_pb') int? loanBalancePb,
    @Field('loan_balance_bbm') int? loanBalanceBbm,
    @Field('loan_balance_store') int? loanBalanceStore,
    @Field('receivable_score') required int receivableScore,
    @Field('financial_final_score_percentage')
    int? financialFinalScorePercentage,
    @Field('combined_final_score_percentage') int? combinedFinalScorePercentage,
    @Field('criteria') String? criteria,
  });

  @POST("/groups/{group_id}/reports/{id}")
  Future<dynamic> deleteReport({
    @Path('id') required int id,
    @Path('group_id') required int groupId,

    @Field("_method") String method = "DELETE",
  });

  @GET("/member-growth")
  Future<dynamic> getMemberGrowth();
}
