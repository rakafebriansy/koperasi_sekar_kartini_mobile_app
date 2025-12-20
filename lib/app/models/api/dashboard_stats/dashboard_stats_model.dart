import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_stats_model.freezed.dart';
part 'dashboard_stats_model.g.dart';

@freezed
class DashboardStatsModel with _$DashboardStatsModel {
  const factory DashboardStatsModel({
    required DashboardMeta meta,
    required MemberStats member,
    required SavingsStats savings,
    required LoanStats loan,
  }) = _DashboardStatsModel;

  factory DashboardStatsModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardStatsModelFromJson(json);
}

@freezed
class DashboardMeta with _$DashboardMeta {
  const factory DashboardMeta({required int year, required int quarter}) =
      _DashboardMeta;

  factory DashboardMeta.fromJson(Map<String, dynamic> json) =>
      _$DashboardMetaFromJson(json);
}

@freezed
class MemberStats with _$MemberStats {
  const factory MemberStats({
    @JsonKey(name: 'joined_this_quarter') required int joinedThisQuarter,

    @JsonKey(name: 'joined_percentage') required double joinedPercentage,

    @JsonKey(name: 'left_this_quarter') required int leftThisQuarter,

    @JsonKey(name: 'left_percentage') required double leftPercentage,

    @JsonKey(name: 'total_active_members') required int totalActiveMembers,

    @JsonKey(name: 'total_inactive_members') required int totalInactiveMembers,
  }) = _MemberStats;

  factory MemberStats.fromJson(Map<String, dynamic> json) =>
      _$MemberStatsFromJson(json);
}

@freezed
class SavingsStats with _$SavingsStats {
  const factory SavingsStats({
    @JsonKey(name: 'users_not_saved_this_month')
    required int usersNotSavedThisQuarter,

    @JsonKey(name: 'total_savings_this_month')
    required int totalSavingsThisQuarter,

    @JsonKey(name: 'saving_percentage') required double savingPercentage,
  }) = _SavingsStats;

  factory SavingsStats.fromJson(Map<String, dynamic> json) =>
      _$SavingsStatsFromJson(json);
}

@freezed
class LoanStats with _$LoanStats {
  const factory LoanStats({
    @JsonKey(name: 'users_unpaid_loan_this_month')
    required int usersUnpaidLoanThisQuarter,

    @JsonKey(name: 'total_unpaid_loan_this_month')
    required int totalUnpaidLoanThisQuarter,

    @JsonKey(name: 'loan_percentage') required double loanPercentage,
  }) = _LoanStats;

  factory LoanStats.fromJson(Map<String, dynamic> json) =>
      _$LoanStatsFromJson(json);
}
