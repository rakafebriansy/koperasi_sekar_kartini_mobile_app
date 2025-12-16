import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_model.freezed.dart';
part 'report_model.g.dart';

enum ReportCriteria {
  @JsonValue('sangat_baik')
  sangatBaik('Sangat Baik'),

  @JsonValue('baik')
  baik('Baik'),

  @JsonValue('cukup')
  cukup('Cukup'),

  @JsonValue('kurang')
  kurang('Kurang'),

  @JsonValue('sangat_kurang')
  sangatKurang('Sangat Kurang');

  final String displayName;
  const ReportCriteria(this.displayName);

  String get snakeCase {
    switch (this) {
      case ReportCriteria.sangatBaik:
        return 'sangat_baik';
      case ReportCriteria.baik:
        return 'baik';
      case ReportCriteria.cukup:
        return 'cukup';
      case ReportCriteria.kurang:
        return 'kurang';
      case ReportCriteria.sangatKurang:
        return 'sangat_kurang';
    }
  }
}

enum Quarter {
  @JsonValue(1)
  triwulan1('Triwulan I'),

  @JsonValue(2)
  triwulan2('Triwulan II'),

  @JsonValue(3)
  triwulan3('Triwulan III'),

  @JsonValue(4)
  triwulan4('Triwulan IV');

  final String displayName;
  const Quarter(this.displayName);

  int toInt() {
    switch (this) {
      case Quarter.triwulan1:
        return 1;
      case Quarter.triwulan2:
        return 2;
      case Quarter.triwulan3:
        return 3;
      case Quarter.triwulan4:
        return 4;
    }
  }
}
@freezed
class ReportModel with _$ReportModel {
  const factory ReportModel({
    @JsonKey(name: 'id')
    required int id,

    @JsonKey(name: 'quarter')
    required Quarter quarter,

    @JsonKey(name: 'year')
    required int year,

    @JsonKey(name: 'member_growth_in')
    required int memberGrowthIn,

    @JsonKey(name: 'member_growth_in_percentage')
    required double memberGrowthInPercentage,

    @JsonKey(name: 'member_growth_out')
    required int memberGrowthOut,

    @JsonKey(name: 'member_growth_out_percentage')
    required double memberGrowthOutPercentage,

    @JsonKey(name: 'group_member_total')
    required int groupMemberTotal,

    @JsonKey(name: 'group_member_total_percentage')
    required double groupMemberTotalPercentage,

    @JsonKey(name: 'administrative_compliance_percentage')
    required double administrativeCompliancePercentage,

    @JsonKey(name: 'deposit_compliance_percentage')
    required double depositCompliancePercentage,

    @JsonKey(name: 'attendance_percentage')
    required double attendancePercentage,

    @JsonKey(name: 'organization_final_score_percentage')
    required double organizationFinalScorePercentage,

    @JsonKey(name: 'loan_participation_pb')
    required int loanParticipationPb,

    @JsonKey(name: 'loan_participation_bbm')
    required int loanParticipationBbm,

    @JsonKey(name: 'loan_participation_store')
    required int loanParticipationStore,

    @JsonKey(name: 'cash_participation')
    required int cashParticipation,

    @JsonKey(name: 'cash_participation_percentage')
    required double cashParticipationPercentage,

    @JsonKey(name: 'savings_participation')
    required int savingsParticipation,

    @JsonKey(name: 'savings_participation_percentage')
    required double savingsParticipationPercentage,

    @JsonKey(name: 'meeting_deposit_percentage')
    required double meetingDepositPercentage,

    @JsonKey(name: 'loan_balance_pb')
    required int loanBalancePb,

    @JsonKey(name: 'loan_balance_bbm')
    required int loanBalanceBbm,

    @JsonKey(name: 'loan_balance_store')
    required int loanBalanceStore,

    @JsonKey(name: 'receivable_score')
    required double receivableScorePercentage,

    @JsonKey(name: 'financial_final_score_percentage')
    required double financialFinalScorePercentage,

    @JsonKey(name: 'combined_final_score_percentage')
    required double combinedFinalScorePercentage,

    @JsonKey(name: 'criteria')
    required ReportCriteria criteria,

    @JsonKey(name: 'group_id')
    required int groupId,
  }) = _ReportModel;

  factory ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);
}
