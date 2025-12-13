// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportModelImpl _$$ReportModelImplFromJson(Map<String, dynamic> json) =>
    _$ReportModelImpl(
      id: (json['id'] as num).toInt(),
      quarter: $enumDecode(_$QuarterEnumMap, json['quarter']),
      year: (json['year'] as num).toInt(),
      memberGrowthIn: (json['member_growth_in'] as num).toInt(),
      memberGrowthInPercentage:
          (json['member_growth_in_percentage'] as num).toInt(),
      memberGrowthOut: (json['member_growth_out'] as num).toInt(),
      memberGrowthOutPercentage:
          (json['member_growth_out_percentage'] as num).toInt(),
      groupMemberTotal: (json['group_member_total'] as num).toInt(),
      groupMemberTotalPercentage:
          (json['group_member_total_percentage'] as num).toInt(),
      administrativeCompliancePercentage:
          (json['administrative_compliance_percentage'] as num).toInt(),
      depositCompliancePercentage:
          (json['deposit_compliance_percentage'] as num).toInt(),
      attendancePercentage: (json['attendance_percentage'] as num).toInt(),
      organizationFinalScorePercentage:
          (json['organization_final_score_percentage'] as num).toInt(),
      loanParticipationPb: (json['loan_participation_pb'] as num).toInt(),
      loanParticipationBbm: (json['loan_participation_bbm'] as num).toInt(),
      loanParticipationStore: (json['loan_participation_store'] as num).toInt(),
      cashParticipation: (json['cash_participation'] as num).toInt(),
      cashParticipationPercentage:
          (json['cash_participation_percentage'] as num).toInt(),
      savingsParticipation: (json['savings_participation'] as num).toInt(),
      savingsParticipationPercentage:
          (json['savings_participation_percentage'] as num).toInt(),
      meetingDepositPercentage:
          (json['meeting_deposit_percentage'] as num).toInt(),
      loanBalancePb: (json['loan_balance_pb'] as num).toInt(),
      loanBalanceBbm: (json['loan_balance_bbm'] as num).toInt(),
      loanBalanceStore: (json['loan_balance_store'] as num).toInt(),
      receivableScore: (json['receivable_score'] as num).toInt(),
      financialFinalScorePercentage:
          (json['financial_final_score_percentage'] as num).toInt(),
      combinedFinalScorePercentage:
          (json['combined_final_score_percentage'] as num).toInt(),
      criteria: $enumDecode(_$ReportCriteriaEnumMap, json['criteria']),
      groupId: (json['group_id'] as num).toInt(),
    );

Map<String, dynamic> _$$ReportModelImplToJson(_$ReportModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quarter': _$QuarterEnumMap[instance.quarter]!,
      'year': instance.year,
      'member_growth_in': instance.memberGrowthIn,
      'member_growth_in_percentage': instance.memberGrowthInPercentage,
      'member_growth_out': instance.memberGrowthOut,
      'member_growth_out_percentage': instance.memberGrowthOutPercentage,
      'group_member_total': instance.groupMemberTotal,
      'group_member_total_percentage': instance.groupMemberTotalPercentage,
      'administrative_compliance_percentage':
          instance.administrativeCompliancePercentage,
      'deposit_compliance_percentage': instance.depositCompliancePercentage,
      'attendance_percentage': instance.attendancePercentage,
      'organization_final_score_percentage':
          instance.organizationFinalScorePercentage,
      'loan_participation_pb': instance.loanParticipationPb,
      'loan_participation_bbm': instance.loanParticipationBbm,
      'loan_participation_store': instance.loanParticipationStore,
      'cash_participation': instance.cashParticipation,
      'cash_participation_percentage': instance.cashParticipationPercentage,
      'savings_participation': instance.savingsParticipation,
      'savings_participation_percentage':
          instance.savingsParticipationPercentage,
      'meeting_deposit_percentage': instance.meetingDepositPercentage,
      'loan_balance_pb': instance.loanBalancePb,
      'loan_balance_bbm': instance.loanBalanceBbm,
      'loan_balance_store': instance.loanBalanceStore,
      'receivable_score': instance.receivableScore,
      'financial_final_score_percentage':
          instance.financialFinalScorePercentage,
      'combined_final_score_percentage': instance.combinedFinalScorePercentage,
      'criteria': _$ReportCriteriaEnumMap[instance.criteria]!,
      'group_id': instance.groupId,
    };

const _$QuarterEnumMap = {
  Quarter.triwulan1: 1,
  Quarter.triwulan2: 2,
  Quarter.triwulan3: 3,
  Quarter.triwulan4: 4,
};

const _$ReportCriteriaEnumMap = {
  ReportCriteria.sangatBaik: 'sangat_baik',
  ReportCriteria.baik: 'baik',
  ReportCriteria.cukup: 'cukup',
  ReportCriteria.kurang: 'kurang',
  ReportCriteria.sangatKurang: 'sangat_kurang',
};
