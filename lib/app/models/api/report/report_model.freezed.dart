// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReportModel _$ReportModelFromJson(Map<String, dynamic> json) {
  return _ReportModel.fromJson(json);
}

/// @nodoc
mixin _$ReportModel {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'quarter')
  Quarter get quarter => throw _privateConstructorUsedError;
  @JsonKey(name: 'year')
  int get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_growth_in')
  int get memberGrowthIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_growth_in_percentage')
  int get memberGrowthInPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_growth_out')
  int get memberGrowthOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_growth_out_percentage')
  int get memberGrowthOutPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_member_total')
  int get groupMemberTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_member_total_percentage')
  int get groupMemberTotalPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'administrative_compliance_percentage')
  int get administrativeCompliancePercentage =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'deposit_compliance_percentage')
  int get depositCompliancePercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'attendance_percentage')
  int get attendancePercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'organization_final_score_percentage')
  int get organizationFinalScorePercentage =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'loan_participation_pb')
  int get loanParticipationPb => throw _privateConstructorUsedError;
  @JsonKey(name: 'loan_participation_bbm')
  int get loanParticipationBbm => throw _privateConstructorUsedError;
  @JsonKey(name: 'loan_participation_store')
  int get loanParticipationStore => throw _privateConstructorUsedError;
  @JsonKey(name: 'cash_participation')
  int get cashParticipation => throw _privateConstructorUsedError;
  @JsonKey(name: 'cash_participation_percentage')
  int get cashParticipationPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'savings_participation')
  int get savingsParticipation => throw _privateConstructorUsedError;
  @JsonKey(name: 'savings_participation_percentage')
  int get savingsParticipationPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'meeting_deposit_percentage')
  int get meetingDepositPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'loan_balance_pb')
  int get loanBalancePb => throw _privateConstructorUsedError;
  @JsonKey(name: 'loan_balance_bbm')
  int get loanBalanceBbm => throw _privateConstructorUsedError;
  @JsonKey(name: 'loan_balance_store')
  int get loanBalanceStore => throw _privateConstructorUsedError;
  @JsonKey(name: 'receivable_score')
  int get receivableScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'financial_final_score_percentage')
  int get financialFinalScorePercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'combined_final_score_percentage')
  int get combinedFinalScorePercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'criteria')
  ReportCriteria get criteria => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_id')
  int get groupId => throw _privateConstructorUsedError;

  /// Serializes this ReportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportModelCopyWith<ReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportModelCopyWith<$Res> {
  factory $ReportModelCopyWith(
          ReportModel value, $Res Function(ReportModel) then) =
      _$ReportModelCopyWithImpl<$Res, ReportModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'quarter') Quarter quarter,
      @JsonKey(name: 'year') int year,
      @JsonKey(name: 'member_growth_in') int memberGrowthIn,
      @JsonKey(name: 'member_growth_in_percentage')
      int memberGrowthInPercentage,
      @JsonKey(name: 'member_growth_out') int memberGrowthOut,
      @JsonKey(name: 'member_growth_out_percentage')
      int memberGrowthOutPercentage,
      @JsonKey(name: 'group_member_total') int groupMemberTotal,
      @JsonKey(name: 'group_member_total_percentage')
      int groupMemberTotalPercentage,
      @JsonKey(name: 'administrative_compliance_percentage')
      int administrativeCompliancePercentage,
      @JsonKey(name: 'deposit_compliance_percentage')
      int depositCompliancePercentage,
      @JsonKey(name: 'attendance_percentage') int attendancePercentage,
      @JsonKey(name: 'organization_final_score_percentage')
      int organizationFinalScorePercentage,
      @JsonKey(name: 'loan_participation_pb') int loanParticipationPb,
      @JsonKey(name: 'loan_participation_bbm') int loanParticipationBbm,
      @JsonKey(name: 'loan_participation_store') int loanParticipationStore,
      @JsonKey(name: 'cash_participation') int cashParticipation,
      @JsonKey(name: 'cash_participation_percentage')
      int cashParticipationPercentage,
      @JsonKey(name: 'savings_participation') int savingsParticipation,
      @JsonKey(name: 'savings_participation_percentage')
      int savingsParticipationPercentage,
      @JsonKey(name: 'meeting_deposit_percentage') int meetingDepositPercentage,
      @JsonKey(name: 'loan_balance_pb') int loanBalancePb,
      @JsonKey(name: 'loan_balance_bbm') int loanBalanceBbm,
      @JsonKey(name: 'loan_balance_store') int loanBalanceStore,
      @JsonKey(name: 'receivable_score') int receivableScore,
      @JsonKey(name: 'financial_final_score_percentage')
      int financialFinalScorePercentage,
      @JsonKey(name: 'combined_final_score_percentage')
      int combinedFinalScorePercentage,
      @JsonKey(name: 'criteria') ReportCriteria criteria,
      @JsonKey(name: 'group_id') int groupId});
}

/// @nodoc
class _$ReportModelCopyWithImpl<$Res, $Val extends ReportModel>
    implements $ReportModelCopyWith<$Res> {
  _$ReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quarter = null,
    Object? year = null,
    Object? memberGrowthIn = null,
    Object? memberGrowthInPercentage = null,
    Object? memberGrowthOut = null,
    Object? memberGrowthOutPercentage = null,
    Object? groupMemberTotal = null,
    Object? groupMemberTotalPercentage = null,
    Object? administrativeCompliancePercentage = null,
    Object? depositCompliancePercentage = null,
    Object? attendancePercentage = null,
    Object? organizationFinalScorePercentage = null,
    Object? loanParticipationPb = null,
    Object? loanParticipationBbm = null,
    Object? loanParticipationStore = null,
    Object? cashParticipation = null,
    Object? cashParticipationPercentage = null,
    Object? savingsParticipation = null,
    Object? savingsParticipationPercentage = null,
    Object? meetingDepositPercentage = null,
    Object? loanBalancePb = null,
    Object? loanBalanceBbm = null,
    Object? loanBalanceStore = null,
    Object? receivableScore = null,
    Object? financialFinalScorePercentage = null,
    Object? combinedFinalScorePercentage = null,
    Object? criteria = null,
    Object? groupId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      quarter: null == quarter
          ? _value.quarter
          : quarter // ignore: cast_nullable_to_non_nullable
              as Quarter,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      memberGrowthIn: null == memberGrowthIn
          ? _value.memberGrowthIn
          : memberGrowthIn // ignore: cast_nullable_to_non_nullable
              as int,
      memberGrowthInPercentage: null == memberGrowthInPercentage
          ? _value.memberGrowthInPercentage
          : memberGrowthInPercentage // ignore: cast_nullable_to_non_nullable
              as int,
      memberGrowthOut: null == memberGrowthOut
          ? _value.memberGrowthOut
          : memberGrowthOut // ignore: cast_nullable_to_non_nullable
              as int,
      memberGrowthOutPercentage: null == memberGrowthOutPercentage
          ? _value.memberGrowthOutPercentage
          : memberGrowthOutPercentage // ignore: cast_nullable_to_non_nullable
              as int,
      groupMemberTotal: null == groupMemberTotal
          ? _value.groupMemberTotal
          : groupMemberTotal // ignore: cast_nullable_to_non_nullable
              as int,
      groupMemberTotalPercentage: null == groupMemberTotalPercentage
          ? _value.groupMemberTotalPercentage
          : groupMemberTotalPercentage // ignore: cast_nullable_to_non_nullable
              as int,
      administrativeCompliancePercentage: null ==
              administrativeCompliancePercentage
          ? _value.administrativeCompliancePercentage
          : administrativeCompliancePercentage // ignore: cast_nullable_to_non_nullable
              as int,
      depositCompliancePercentage: null == depositCompliancePercentage
          ? _value.depositCompliancePercentage
          : depositCompliancePercentage // ignore: cast_nullable_to_non_nullable
              as int,
      attendancePercentage: null == attendancePercentage
          ? _value.attendancePercentage
          : attendancePercentage // ignore: cast_nullable_to_non_nullable
              as int,
      organizationFinalScorePercentage: null == organizationFinalScorePercentage
          ? _value.organizationFinalScorePercentage
          : organizationFinalScorePercentage // ignore: cast_nullable_to_non_nullable
              as int,
      loanParticipationPb: null == loanParticipationPb
          ? _value.loanParticipationPb
          : loanParticipationPb // ignore: cast_nullable_to_non_nullable
              as int,
      loanParticipationBbm: null == loanParticipationBbm
          ? _value.loanParticipationBbm
          : loanParticipationBbm // ignore: cast_nullable_to_non_nullable
              as int,
      loanParticipationStore: null == loanParticipationStore
          ? _value.loanParticipationStore
          : loanParticipationStore // ignore: cast_nullable_to_non_nullable
              as int,
      cashParticipation: null == cashParticipation
          ? _value.cashParticipation
          : cashParticipation // ignore: cast_nullable_to_non_nullable
              as int,
      cashParticipationPercentage: null == cashParticipationPercentage
          ? _value.cashParticipationPercentage
          : cashParticipationPercentage // ignore: cast_nullable_to_non_nullable
              as int,
      savingsParticipation: null == savingsParticipation
          ? _value.savingsParticipation
          : savingsParticipation // ignore: cast_nullable_to_non_nullable
              as int,
      savingsParticipationPercentage: null == savingsParticipationPercentage
          ? _value.savingsParticipationPercentage
          : savingsParticipationPercentage // ignore: cast_nullable_to_non_nullable
              as int,
      meetingDepositPercentage: null == meetingDepositPercentage
          ? _value.meetingDepositPercentage
          : meetingDepositPercentage // ignore: cast_nullable_to_non_nullable
              as int,
      loanBalancePb: null == loanBalancePb
          ? _value.loanBalancePb
          : loanBalancePb // ignore: cast_nullable_to_non_nullable
              as int,
      loanBalanceBbm: null == loanBalanceBbm
          ? _value.loanBalanceBbm
          : loanBalanceBbm // ignore: cast_nullable_to_non_nullable
              as int,
      loanBalanceStore: null == loanBalanceStore
          ? _value.loanBalanceStore
          : loanBalanceStore // ignore: cast_nullable_to_non_nullable
              as int,
      receivableScore: null == receivableScore
          ? _value.receivableScore
          : receivableScore // ignore: cast_nullable_to_non_nullable
              as int,
      financialFinalScorePercentage: null == financialFinalScorePercentage
          ? _value.financialFinalScorePercentage
          : financialFinalScorePercentage // ignore: cast_nullable_to_non_nullable
              as int,
      combinedFinalScorePercentage: null == combinedFinalScorePercentage
          ? _value.combinedFinalScorePercentage
          : combinedFinalScorePercentage // ignore: cast_nullable_to_non_nullable
              as int,
      criteria: null == criteria
          ? _value.criteria
          : criteria // ignore: cast_nullable_to_non_nullable
              as ReportCriteria,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportModelImplCopyWith<$Res>
    implements $ReportModelCopyWith<$Res> {
  factory _$$ReportModelImplCopyWith(
          _$ReportModelImpl value, $Res Function(_$ReportModelImpl) then) =
      __$$ReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'quarter') Quarter quarter,
      @JsonKey(name: 'year') int year,
      @JsonKey(name: 'member_growth_in') int memberGrowthIn,
      @JsonKey(name: 'member_growth_in_percentage')
      int memberGrowthInPercentage,
      @JsonKey(name: 'member_growth_out') int memberGrowthOut,
      @JsonKey(name: 'member_growth_out_percentage')
      int memberGrowthOutPercentage,
      @JsonKey(name: 'group_member_total') int groupMemberTotal,
      @JsonKey(name: 'group_member_total_percentage')
      int groupMemberTotalPercentage,
      @JsonKey(name: 'administrative_compliance_percentage')
      int administrativeCompliancePercentage,
      @JsonKey(name: 'deposit_compliance_percentage')
      int depositCompliancePercentage,
      @JsonKey(name: 'attendance_percentage') int attendancePercentage,
      @JsonKey(name: 'organization_final_score_percentage')
      int organizationFinalScorePercentage,
      @JsonKey(name: 'loan_participation_pb') int loanParticipationPb,
      @JsonKey(name: 'loan_participation_bbm') int loanParticipationBbm,
      @JsonKey(name: 'loan_participation_store') int loanParticipationStore,
      @JsonKey(name: 'cash_participation') int cashParticipation,
      @JsonKey(name: 'cash_participation_percentage')
      int cashParticipationPercentage,
      @JsonKey(name: 'savings_participation') int savingsParticipation,
      @JsonKey(name: 'savings_participation_percentage')
      int savingsParticipationPercentage,
      @JsonKey(name: 'meeting_deposit_percentage') int meetingDepositPercentage,
      @JsonKey(name: 'loan_balance_pb') int loanBalancePb,
      @JsonKey(name: 'loan_balance_bbm') int loanBalanceBbm,
      @JsonKey(name: 'loan_balance_store') int loanBalanceStore,
      @JsonKey(name: 'receivable_score') int receivableScore,
      @JsonKey(name: 'financial_final_score_percentage')
      int financialFinalScorePercentage,
      @JsonKey(name: 'combined_final_score_percentage')
      int combinedFinalScorePercentage,
      @JsonKey(name: 'criteria') ReportCriteria criteria,
      @JsonKey(name: 'group_id') int groupId});
}

/// @nodoc
class __$$ReportModelImplCopyWithImpl<$Res>
    extends _$ReportModelCopyWithImpl<$Res, _$ReportModelImpl>
    implements _$$ReportModelImplCopyWith<$Res> {
  __$$ReportModelImplCopyWithImpl(
      _$ReportModelImpl _value, $Res Function(_$ReportModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quarter = null,
    Object? year = null,
    Object? memberGrowthIn = null,
    Object? memberGrowthInPercentage = null,
    Object? memberGrowthOut = null,
    Object? memberGrowthOutPercentage = null,
    Object? groupMemberTotal = null,
    Object? groupMemberTotalPercentage = null,
    Object? administrativeCompliancePercentage = null,
    Object? depositCompliancePercentage = null,
    Object? attendancePercentage = null,
    Object? organizationFinalScorePercentage = null,
    Object? loanParticipationPb = null,
    Object? loanParticipationBbm = null,
    Object? loanParticipationStore = null,
    Object? cashParticipation = null,
    Object? cashParticipationPercentage = null,
    Object? savingsParticipation = null,
    Object? savingsParticipationPercentage = null,
    Object? meetingDepositPercentage = null,
    Object? loanBalancePb = null,
    Object? loanBalanceBbm = null,
    Object? loanBalanceStore = null,
    Object? receivableScore = null,
    Object? financialFinalScorePercentage = null,
    Object? combinedFinalScorePercentage = null,
    Object? criteria = null,
    Object? groupId = null,
  }) {
    return _then(_$ReportModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      quarter: null == quarter
          ? _value.quarter
          : quarter // ignore: cast_nullable_to_non_nullable
              as Quarter,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      memberGrowthIn: null == memberGrowthIn
          ? _value.memberGrowthIn
          : memberGrowthIn // ignore: cast_nullable_to_non_nullable
              as int,
      memberGrowthInPercentage: null == memberGrowthInPercentage
          ? _value.memberGrowthInPercentage
          : memberGrowthInPercentage // ignore: cast_nullable_to_non_nullable
              as int,
      memberGrowthOut: null == memberGrowthOut
          ? _value.memberGrowthOut
          : memberGrowthOut // ignore: cast_nullable_to_non_nullable
              as int,
      memberGrowthOutPercentage: null == memberGrowthOutPercentage
          ? _value.memberGrowthOutPercentage
          : memberGrowthOutPercentage // ignore: cast_nullable_to_non_nullable
              as int,
      groupMemberTotal: null == groupMemberTotal
          ? _value.groupMemberTotal
          : groupMemberTotal // ignore: cast_nullable_to_non_nullable
              as int,
      groupMemberTotalPercentage: null == groupMemberTotalPercentage
          ? _value.groupMemberTotalPercentage
          : groupMemberTotalPercentage // ignore: cast_nullable_to_non_nullable
              as int,
      administrativeCompliancePercentage: null ==
              administrativeCompliancePercentage
          ? _value.administrativeCompliancePercentage
          : administrativeCompliancePercentage // ignore: cast_nullable_to_non_nullable
              as int,
      depositCompliancePercentage: null == depositCompliancePercentage
          ? _value.depositCompliancePercentage
          : depositCompliancePercentage // ignore: cast_nullable_to_non_nullable
              as int,
      attendancePercentage: null == attendancePercentage
          ? _value.attendancePercentage
          : attendancePercentage // ignore: cast_nullable_to_non_nullable
              as int,
      organizationFinalScorePercentage: null == organizationFinalScorePercentage
          ? _value.organizationFinalScorePercentage
          : organizationFinalScorePercentage // ignore: cast_nullable_to_non_nullable
              as int,
      loanParticipationPb: null == loanParticipationPb
          ? _value.loanParticipationPb
          : loanParticipationPb // ignore: cast_nullable_to_non_nullable
              as int,
      loanParticipationBbm: null == loanParticipationBbm
          ? _value.loanParticipationBbm
          : loanParticipationBbm // ignore: cast_nullable_to_non_nullable
              as int,
      loanParticipationStore: null == loanParticipationStore
          ? _value.loanParticipationStore
          : loanParticipationStore // ignore: cast_nullable_to_non_nullable
              as int,
      cashParticipation: null == cashParticipation
          ? _value.cashParticipation
          : cashParticipation // ignore: cast_nullable_to_non_nullable
              as int,
      cashParticipationPercentage: null == cashParticipationPercentage
          ? _value.cashParticipationPercentage
          : cashParticipationPercentage // ignore: cast_nullable_to_non_nullable
              as int,
      savingsParticipation: null == savingsParticipation
          ? _value.savingsParticipation
          : savingsParticipation // ignore: cast_nullable_to_non_nullable
              as int,
      savingsParticipationPercentage: null == savingsParticipationPercentage
          ? _value.savingsParticipationPercentage
          : savingsParticipationPercentage // ignore: cast_nullable_to_non_nullable
              as int,
      meetingDepositPercentage: null == meetingDepositPercentage
          ? _value.meetingDepositPercentage
          : meetingDepositPercentage // ignore: cast_nullable_to_non_nullable
              as int,
      loanBalancePb: null == loanBalancePb
          ? _value.loanBalancePb
          : loanBalancePb // ignore: cast_nullable_to_non_nullable
              as int,
      loanBalanceBbm: null == loanBalanceBbm
          ? _value.loanBalanceBbm
          : loanBalanceBbm // ignore: cast_nullable_to_non_nullable
              as int,
      loanBalanceStore: null == loanBalanceStore
          ? _value.loanBalanceStore
          : loanBalanceStore // ignore: cast_nullable_to_non_nullable
              as int,
      receivableScore: null == receivableScore
          ? _value.receivableScore
          : receivableScore // ignore: cast_nullable_to_non_nullable
              as int,
      financialFinalScorePercentage: null == financialFinalScorePercentage
          ? _value.financialFinalScorePercentage
          : financialFinalScorePercentage // ignore: cast_nullable_to_non_nullable
              as int,
      combinedFinalScorePercentage: null == combinedFinalScorePercentage
          ? _value.combinedFinalScorePercentage
          : combinedFinalScorePercentage // ignore: cast_nullable_to_non_nullable
              as int,
      criteria: null == criteria
          ? _value.criteria
          : criteria // ignore: cast_nullable_to_non_nullable
              as ReportCriteria,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportModelImpl implements _ReportModel {
  const _$ReportModelImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'quarter') required this.quarter,
      @JsonKey(name: 'year') required this.year,
      @JsonKey(name: 'member_growth_in') required this.memberGrowthIn,
      @JsonKey(name: 'member_growth_in_percentage')
      required this.memberGrowthInPercentage,
      @JsonKey(name: 'member_growth_out') required this.memberGrowthOut,
      @JsonKey(name: 'member_growth_out_percentage')
      required this.memberGrowthOutPercentage,
      @JsonKey(name: 'group_member_total') required this.groupMemberTotal,
      @JsonKey(name: 'group_member_total_percentage')
      required this.groupMemberTotalPercentage,
      @JsonKey(name: 'administrative_compliance_percentage')
      required this.administrativeCompliancePercentage,
      @JsonKey(name: 'deposit_compliance_percentage')
      required this.depositCompliancePercentage,
      @JsonKey(name: 'attendance_percentage')
      required this.attendancePercentage,
      @JsonKey(name: 'organization_final_score_percentage')
      required this.organizationFinalScorePercentage,
      @JsonKey(name: 'loan_participation_pb') required this.loanParticipationPb,
      @JsonKey(name: 'loan_participation_bbm')
      required this.loanParticipationBbm,
      @JsonKey(name: 'loan_participation_store')
      required this.loanParticipationStore,
      @JsonKey(name: 'cash_participation') required this.cashParticipation,
      @JsonKey(name: 'cash_participation_percentage')
      required this.cashParticipationPercentage,
      @JsonKey(name: 'savings_participation')
      required this.savingsParticipation,
      @JsonKey(name: 'savings_participation_percentage')
      required this.savingsParticipationPercentage,
      @JsonKey(name: 'meeting_deposit_percentage')
      required this.meetingDepositPercentage,
      @JsonKey(name: 'loan_balance_pb') required this.loanBalancePb,
      @JsonKey(name: 'loan_balance_bbm') required this.loanBalanceBbm,
      @JsonKey(name: 'loan_balance_store') required this.loanBalanceStore,
      @JsonKey(name: 'receivable_score') required this.receivableScore,
      @JsonKey(name: 'financial_final_score_percentage')
      required this.financialFinalScorePercentage,
      @JsonKey(name: 'combined_final_score_percentage')
      required this.combinedFinalScorePercentage,
      @JsonKey(name: 'criteria') required this.criteria,
      @JsonKey(name: 'group_id') required this.groupId});

  factory _$ReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'quarter')
  final Quarter quarter;
  @override
  @JsonKey(name: 'year')
  final int year;
  @override
  @JsonKey(name: 'member_growth_in')
  final int memberGrowthIn;
  @override
  @JsonKey(name: 'member_growth_in_percentage')
  final int memberGrowthInPercentage;
  @override
  @JsonKey(name: 'member_growth_out')
  final int memberGrowthOut;
  @override
  @JsonKey(name: 'member_growth_out_percentage')
  final int memberGrowthOutPercentage;
  @override
  @JsonKey(name: 'group_member_total')
  final int groupMemberTotal;
  @override
  @JsonKey(name: 'group_member_total_percentage')
  final int groupMemberTotalPercentage;
  @override
  @JsonKey(name: 'administrative_compliance_percentage')
  final int administrativeCompliancePercentage;
  @override
  @JsonKey(name: 'deposit_compliance_percentage')
  final int depositCompliancePercentage;
  @override
  @JsonKey(name: 'attendance_percentage')
  final int attendancePercentage;
  @override
  @JsonKey(name: 'organization_final_score_percentage')
  final int organizationFinalScorePercentage;
  @override
  @JsonKey(name: 'loan_participation_pb')
  final int loanParticipationPb;
  @override
  @JsonKey(name: 'loan_participation_bbm')
  final int loanParticipationBbm;
  @override
  @JsonKey(name: 'loan_participation_store')
  final int loanParticipationStore;
  @override
  @JsonKey(name: 'cash_participation')
  final int cashParticipation;
  @override
  @JsonKey(name: 'cash_participation_percentage')
  final int cashParticipationPercentage;
  @override
  @JsonKey(name: 'savings_participation')
  final int savingsParticipation;
  @override
  @JsonKey(name: 'savings_participation_percentage')
  final int savingsParticipationPercentage;
  @override
  @JsonKey(name: 'meeting_deposit_percentage')
  final int meetingDepositPercentage;
  @override
  @JsonKey(name: 'loan_balance_pb')
  final int loanBalancePb;
  @override
  @JsonKey(name: 'loan_balance_bbm')
  final int loanBalanceBbm;
  @override
  @JsonKey(name: 'loan_balance_store')
  final int loanBalanceStore;
  @override
  @JsonKey(name: 'receivable_score')
  final int receivableScore;
  @override
  @JsonKey(name: 'financial_final_score_percentage')
  final int financialFinalScorePercentage;
  @override
  @JsonKey(name: 'combined_final_score_percentage')
  final int combinedFinalScorePercentage;
  @override
  @JsonKey(name: 'criteria')
  final ReportCriteria criteria;
  @override
  @JsonKey(name: 'group_id')
  final int groupId;

  @override
  String toString() {
    return 'ReportModel(id: $id, quarter: $quarter, year: $year, memberGrowthIn: $memberGrowthIn, memberGrowthInPercentage: $memberGrowthInPercentage, memberGrowthOut: $memberGrowthOut, memberGrowthOutPercentage: $memberGrowthOutPercentage, groupMemberTotal: $groupMemberTotal, groupMemberTotalPercentage: $groupMemberTotalPercentage, administrativeCompliancePercentage: $administrativeCompliancePercentage, depositCompliancePercentage: $depositCompliancePercentage, attendancePercentage: $attendancePercentage, organizationFinalScorePercentage: $organizationFinalScorePercentage, loanParticipationPb: $loanParticipationPb, loanParticipationBbm: $loanParticipationBbm, loanParticipationStore: $loanParticipationStore, cashParticipation: $cashParticipation, cashParticipationPercentage: $cashParticipationPercentage, savingsParticipation: $savingsParticipation, savingsParticipationPercentage: $savingsParticipationPercentage, meetingDepositPercentage: $meetingDepositPercentage, loanBalancePb: $loanBalancePb, loanBalanceBbm: $loanBalanceBbm, loanBalanceStore: $loanBalanceStore, receivableScore: $receivableScore, financialFinalScorePercentage: $financialFinalScorePercentage, combinedFinalScorePercentage: $combinedFinalScorePercentage, criteria: $criteria, groupId: $groupId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quarter, quarter) || other.quarter == quarter) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.memberGrowthIn, memberGrowthIn) ||
                other.memberGrowthIn == memberGrowthIn) &&
            (identical(other.memberGrowthInPercentage, memberGrowthInPercentage) ||
                other.memberGrowthInPercentage == memberGrowthInPercentage) &&
            (identical(other.memberGrowthOut, memberGrowthOut) ||
                other.memberGrowthOut == memberGrowthOut) &&
            (identical(other.memberGrowthOutPercentage, memberGrowthOutPercentage) ||
                other.memberGrowthOutPercentage == memberGrowthOutPercentage) &&
            (identical(other.groupMemberTotal, groupMemberTotal) ||
                other.groupMemberTotal == groupMemberTotal) &&
            (identical(other.groupMemberTotalPercentage, groupMemberTotalPercentage) ||
                other.groupMemberTotalPercentage ==
                    groupMemberTotalPercentage) &&
            (identical(other.administrativeCompliancePercentage, administrativeCompliancePercentage) ||
                other.administrativeCompliancePercentage ==
                    administrativeCompliancePercentage) &&
            (identical(other.depositCompliancePercentage, depositCompliancePercentage) ||
                other.depositCompliancePercentage ==
                    depositCompliancePercentage) &&
            (identical(other.attendancePercentage, attendancePercentage) ||
                other.attendancePercentage == attendancePercentage) &&
            (identical(other.organizationFinalScorePercentage, organizationFinalScorePercentage) ||
                other.organizationFinalScorePercentage ==
                    organizationFinalScorePercentage) &&
            (identical(other.loanParticipationPb, loanParticipationPb) ||
                other.loanParticipationPb == loanParticipationPb) &&
            (identical(other.loanParticipationBbm, loanParticipationBbm) ||
                other.loanParticipationBbm == loanParticipationBbm) &&
            (identical(other.loanParticipationStore, loanParticipationStore) ||
                other.loanParticipationStore == loanParticipationStore) &&
            (identical(other.cashParticipation, cashParticipation) ||
                other.cashParticipation == cashParticipation) &&
            (identical(other.cashParticipationPercentage, cashParticipationPercentage) ||
                other.cashParticipationPercentage ==
                    cashParticipationPercentage) &&
            (identical(other.savingsParticipation, savingsParticipation) ||
                other.savingsParticipation == savingsParticipation) &&
            (identical(other.savingsParticipationPercentage, savingsParticipationPercentage) ||
                other.savingsParticipationPercentage == savingsParticipationPercentage) &&
            (identical(other.meetingDepositPercentage, meetingDepositPercentage) || other.meetingDepositPercentage == meetingDepositPercentage) &&
            (identical(other.loanBalancePb, loanBalancePb) || other.loanBalancePb == loanBalancePb) &&
            (identical(other.loanBalanceBbm, loanBalanceBbm) || other.loanBalanceBbm == loanBalanceBbm) &&
            (identical(other.loanBalanceStore, loanBalanceStore) || other.loanBalanceStore == loanBalanceStore) &&
            (identical(other.receivableScore, receivableScore) || other.receivableScore == receivableScore) &&
            (identical(other.financialFinalScorePercentage, financialFinalScorePercentage) || other.financialFinalScorePercentage == financialFinalScorePercentage) &&
            (identical(other.combinedFinalScorePercentage, combinedFinalScorePercentage) || other.combinedFinalScorePercentage == combinedFinalScorePercentage) &&
            (identical(other.criteria, criteria) || other.criteria == criteria) &&
            (identical(other.groupId, groupId) || other.groupId == groupId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        quarter,
        year,
        memberGrowthIn,
        memberGrowthInPercentage,
        memberGrowthOut,
        memberGrowthOutPercentage,
        groupMemberTotal,
        groupMemberTotalPercentage,
        administrativeCompliancePercentage,
        depositCompliancePercentage,
        attendancePercentage,
        organizationFinalScorePercentage,
        loanParticipationPb,
        loanParticipationBbm,
        loanParticipationStore,
        cashParticipation,
        cashParticipationPercentage,
        savingsParticipation,
        savingsParticipationPercentage,
        meetingDepositPercentage,
        loanBalancePb,
        loanBalanceBbm,
        loanBalanceStore,
        receivableScore,
        financialFinalScorePercentage,
        combinedFinalScorePercentage,
        criteria,
        groupId
      ]);

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportModelImplCopyWith<_$ReportModelImpl> get copyWith =>
      __$$ReportModelImplCopyWithImpl<_$ReportModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportModelImplToJson(
      this,
    );
  }
}

abstract class _ReportModel implements ReportModel {
  const factory _ReportModel(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'quarter') required final Quarter quarter,
      @JsonKey(name: 'year') required final int year,
      @JsonKey(name: 'member_growth_in') required final int memberGrowthIn,
      @JsonKey(name: 'member_growth_in_percentage')
      required final int memberGrowthInPercentage,
      @JsonKey(name: 'member_growth_out') required final int memberGrowthOut,
      @JsonKey(name: 'member_growth_out_percentage')
      required final int memberGrowthOutPercentage,
      @JsonKey(name: 'group_member_total') required final int groupMemberTotal,
      @JsonKey(name: 'group_member_total_percentage')
      required final int groupMemberTotalPercentage,
      @JsonKey(name: 'administrative_compliance_percentage')
      required final int administrativeCompliancePercentage,
      @JsonKey(name: 'deposit_compliance_percentage')
      required final int depositCompliancePercentage,
      @JsonKey(name: 'attendance_percentage')
      required final int attendancePercentage,
      @JsonKey(name: 'organization_final_score_percentage')
      required final int organizationFinalScorePercentage,
      @JsonKey(name: 'loan_participation_pb')
      required final int loanParticipationPb,
      @JsonKey(name: 'loan_participation_bbm')
      required final int loanParticipationBbm,
      @JsonKey(name: 'loan_participation_store')
      required final int loanParticipationStore,
      @JsonKey(name: 'cash_participation') required final int cashParticipation,
      @JsonKey(name: 'cash_participation_percentage')
      required final int cashParticipationPercentage,
      @JsonKey(name: 'savings_participation')
      required final int savingsParticipation,
      @JsonKey(name: 'savings_participation_percentage')
      required final int savingsParticipationPercentage,
      @JsonKey(name: 'meeting_deposit_percentage')
      required final int meetingDepositPercentage,
      @JsonKey(name: 'loan_balance_pb') required final int loanBalancePb,
      @JsonKey(name: 'loan_balance_bbm') required final int loanBalanceBbm,
      @JsonKey(name: 'loan_balance_store') required final int loanBalanceStore,
      @JsonKey(name: 'receivable_score') required final int receivableScore,
      @JsonKey(name: 'financial_final_score_percentage')
      required final int financialFinalScorePercentage,
      @JsonKey(name: 'combined_final_score_percentage')
      required final int combinedFinalScorePercentage,
      @JsonKey(name: 'criteria') required final ReportCriteria criteria,
      @JsonKey(name: 'group_id')
      required final int groupId}) = _$ReportModelImpl;

  factory _ReportModel.fromJson(Map<String, dynamic> json) =
      _$ReportModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'quarter')
  Quarter get quarter;
  @override
  @JsonKey(name: 'year')
  int get year;
  @override
  @JsonKey(name: 'member_growth_in')
  int get memberGrowthIn;
  @override
  @JsonKey(name: 'member_growth_in_percentage')
  int get memberGrowthInPercentage;
  @override
  @JsonKey(name: 'member_growth_out')
  int get memberGrowthOut;
  @override
  @JsonKey(name: 'member_growth_out_percentage')
  int get memberGrowthOutPercentage;
  @override
  @JsonKey(name: 'group_member_total')
  int get groupMemberTotal;
  @override
  @JsonKey(name: 'group_member_total_percentage')
  int get groupMemberTotalPercentage;
  @override
  @JsonKey(name: 'administrative_compliance_percentage')
  int get administrativeCompliancePercentage;
  @override
  @JsonKey(name: 'deposit_compliance_percentage')
  int get depositCompliancePercentage;
  @override
  @JsonKey(name: 'attendance_percentage')
  int get attendancePercentage;
  @override
  @JsonKey(name: 'organization_final_score_percentage')
  int get organizationFinalScorePercentage;
  @override
  @JsonKey(name: 'loan_participation_pb')
  int get loanParticipationPb;
  @override
  @JsonKey(name: 'loan_participation_bbm')
  int get loanParticipationBbm;
  @override
  @JsonKey(name: 'loan_participation_store')
  int get loanParticipationStore;
  @override
  @JsonKey(name: 'cash_participation')
  int get cashParticipation;
  @override
  @JsonKey(name: 'cash_participation_percentage')
  int get cashParticipationPercentage;
  @override
  @JsonKey(name: 'savings_participation')
  int get savingsParticipation;
  @override
  @JsonKey(name: 'savings_participation_percentage')
  int get savingsParticipationPercentage;
  @override
  @JsonKey(name: 'meeting_deposit_percentage')
  int get meetingDepositPercentage;
  @override
  @JsonKey(name: 'loan_balance_pb')
  int get loanBalancePb;
  @override
  @JsonKey(name: 'loan_balance_bbm')
  int get loanBalanceBbm;
  @override
  @JsonKey(name: 'loan_balance_store')
  int get loanBalanceStore;
  @override
  @JsonKey(name: 'receivable_score')
  int get receivableScore;
  @override
  @JsonKey(name: 'financial_final_score_percentage')
  int get financialFinalScorePercentage;
  @override
  @JsonKey(name: 'combined_final_score_percentage')
  int get combinedFinalScorePercentage;
  @override
  @JsonKey(name: 'criteria')
  ReportCriteria get criteria;
  @override
  @JsonKey(name: 'group_id')
  int get groupId;

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportModelImplCopyWith<_$ReportModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
