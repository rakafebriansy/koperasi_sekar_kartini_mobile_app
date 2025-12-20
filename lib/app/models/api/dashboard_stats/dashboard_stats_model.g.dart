// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardStatsModelImpl _$$DashboardStatsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardStatsModelImpl(
      meta: DashboardMeta.fromJson(json['meta'] as Map<String, dynamic>),
      member: MemberStats.fromJson(json['member'] as Map<String, dynamic>),
      savings: SavingsStats.fromJson(json['savings'] as Map<String, dynamic>),
      loan: LoanStats.fromJson(json['loan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DashboardStatsModelImplToJson(
        _$DashboardStatsModelImpl instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'member': instance.member,
      'savings': instance.savings,
      'loan': instance.loan,
    };

_$DashboardMetaImpl _$$DashboardMetaImplFromJson(Map<String, dynamic> json) =>
    _$DashboardMetaImpl(
      year: (json['year'] as num).toInt(),
      quarter: (json['quarter'] as num).toInt(),
    );

Map<String, dynamic> _$$DashboardMetaImplToJson(_$DashboardMetaImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'quarter': instance.quarter,
    };

_$MemberStatsImpl _$$MemberStatsImplFromJson(Map<String, dynamic> json) =>
    _$MemberStatsImpl(
      joinedThisQuarter: (json['joined_this_quarter'] as num).toInt(),
      joinedPercentage: (json['joined_percentage'] as num).toDouble(),
      leftThisQuarter: (json['left_this_quarter'] as num).toInt(),
      leftPercentage: (json['left_percentage'] as num).toDouble(),
      totalActiveMembers: (json['total_active_members'] as num).toInt(),
      totalInactiveMembers: (json['total_inactive_members'] as num).toInt(),
    );

Map<String, dynamic> _$$MemberStatsImplToJson(_$MemberStatsImpl instance) =>
    <String, dynamic>{
      'joined_this_quarter': instance.joinedThisQuarter,
      'joined_percentage': instance.joinedPercentage,
      'left_this_quarter': instance.leftThisQuarter,
      'left_percentage': instance.leftPercentage,
      'total_active_members': instance.totalActiveMembers,
      'total_inactive_members': instance.totalInactiveMembers,
    };

_$SavingsStatsImpl _$$SavingsStatsImplFromJson(Map<String, dynamic> json) =>
    _$SavingsStatsImpl(
      usersNotSavedThisQuarter:
          (json['users_not_saved_this_month'] as num).toInt(),
      totalSavingsThisQuarter:
          (json['total_savings_this_month'] as num).toInt(),
      savingPercentage: (json['saving_percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$$SavingsStatsImplToJson(_$SavingsStatsImpl instance) =>
    <String, dynamic>{
      'users_not_saved_this_month': instance.usersNotSavedThisQuarter,
      'total_savings_this_month': instance.totalSavingsThisQuarter,
      'saving_percentage': instance.savingPercentage,
    };

_$LoanStatsImpl _$$LoanStatsImplFromJson(Map<String, dynamic> json) =>
    _$LoanStatsImpl(
      usersUnpaidLoanThisQuarter:
          (json['users_unpaid_loan_this_month'] as num).toInt(),
      totalUnpaidLoanThisQuarter:
          (json['total_unpaid_loan_this_month'] as num).toInt(),
      loanPercentage: (json['loan_percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$$LoanStatsImplToJson(_$LoanStatsImpl instance) =>
    <String, dynamic>{
      'users_unpaid_loan_this_month': instance.usersUnpaidLoanThisQuarter,
      'total_unpaid_loan_this_month': instance.totalUnpaidLoanThisQuarter,
      'loan_percentage': instance.loanPercentage,
    };
