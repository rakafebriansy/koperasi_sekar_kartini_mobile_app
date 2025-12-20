// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardStatsModel _$DashboardStatsModelFromJson(Map<String, dynamic> json) {
  return _DashboardStatsModel.fromJson(json);
}

/// @nodoc
mixin _$DashboardStatsModel {
  DashboardMeta get meta => throw _privateConstructorUsedError;
  MemberStats get member => throw _privateConstructorUsedError;
  SavingsStats get savings => throw _privateConstructorUsedError;
  LoanStats get loan => throw _privateConstructorUsedError;

  /// Serializes this DashboardStatsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardStatsModelCopyWith<DashboardStatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStatsModelCopyWith<$Res> {
  factory $DashboardStatsModelCopyWith(
          DashboardStatsModel value, $Res Function(DashboardStatsModel) then) =
      _$DashboardStatsModelCopyWithImpl<$Res, DashboardStatsModel>;
  @useResult
  $Res call(
      {DashboardMeta meta,
      MemberStats member,
      SavingsStats savings,
      LoanStats loan});

  $DashboardMetaCopyWith<$Res> get meta;
  $MemberStatsCopyWith<$Res> get member;
  $SavingsStatsCopyWith<$Res> get savings;
  $LoanStatsCopyWith<$Res> get loan;
}

/// @nodoc
class _$DashboardStatsModelCopyWithImpl<$Res, $Val extends DashboardStatsModel>
    implements $DashboardStatsModelCopyWith<$Res> {
  _$DashboardStatsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? member = null,
    Object? savings = null,
    Object? loan = null,
  }) {
    return _then(_value.copyWith(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DashboardMeta,
      member: null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as MemberStats,
      savings: null == savings
          ? _value.savings
          : savings // ignore: cast_nullable_to_non_nullable
              as SavingsStats,
      loan: null == loan
          ? _value.loan
          : loan // ignore: cast_nullable_to_non_nullable
              as LoanStats,
    ) as $Val);
  }

  /// Create a copy of DashboardStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardMetaCopyWith<$Res> get meta {
    return $DashboardMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  /// Create a copy of DashboardStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MemberStatsCopyWith<$Res> get member {
    return $MemberStatsCopyWith<$Res>(_value.member, (value) {
      return _then(_value.copyWith(member: value) as $Val);
    });
  }

  /// Create a copy of DashboardStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SavingsStatsCopyWith<$Res> get savings {
    return $SavingsStatsCopyWith<$Res>(_value.savings, (value) {
      return _then(_value.copyWith(savings: value) as $Val);
    });
  }

  /// Create a copy of DashboardStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoanStatsCopyWith<$Res> get loan {
    return $LoanStatsCopyWith<$Res>(_value.loan, (value) {
      return _then(_value.copyWith(loan: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardStatsModelImplCopyWith<$Res>
    implements $DashboardStatsModelCopyWith<$Res> {
  factory _$$DashboardStatsModelImplCopyWith(_$DashboardStatsModelImpl value,
          $Res Function(_$DashboardStatsModelImpl) then) =
      __$$DashboardStatsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DashboardMeta meta,
      MemberStats member,
      SavingsStats savings,
      LoanStats loan});

  @override
  $DashboardMetaCopyWith<$Res> get meta;
  @override
  $MemberStatsCopyWith<$Res> get member;
  @override
  $SavingsStatsCopyWith<$Res> get savings;
  @override
  $LoanStatsCopyWith<$Res> get loan;
}

/// @nodoc
class __$$DashboardStatsModelImplCopyWithImpl<$Res>
    extends _$DashboardStatsModelCopyWithImpl<$Res, _$DashboardStatsModelImpl>
    implements _$$DashboardStatsModelImplCopyWith<$Res> {
  __$$DashboardStatsModelImplCopyWithImpl(_$DashboardStatsModelImpl _value,
      $Res Function(_$DashboardStatsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? member = null,
    Object? savings = null,
    Object? loan = null,
  }) {
    return _then(_$DashboardStatsModelImpl(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DashboardMeta,
      member: null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as MemberStats,
      savings: null == savings
          ? _value.savings
          : savings // ignore: cast_nullable_to_non_nullable
              as SavingsStats,
      loan: null == loan
          ? _value.loan
          : loan // ignore: cast_nullable_to_non_nullable
              as LoanStats,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardStatsModelImpl implements _DashboardStatsModel {
  const _$DashboardStatsModelImpl(
      {required this.meta,
      required this.member,
      required this.savings,
      required this.loan});

  factory _$DashboardStatsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardStatsModelImplFromJson(json);

  @override
  final DashboardMeta meta;
  @override
  final MemberStats member;
  @override
  final SavingsStats savings;
  @override
  final LoanStats loan;

  @override
  String toString() {
    return 'DashboardStatsModel(meta: $meta, member: $member, savings: $savings, loan: $loan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStatsModelImpl &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.member, member) || other.member == member) &&
            (identical(other.savings, savings) || other.savings == savings) &&
            (identical(other.loan, loan) || other.loan == loan));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, meta, member, savings, loan);

  /// Create a copy of DashboardStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStatsModelImplCopyWith<_$DashboardStatsModelImpl> get copyWith =>
      __$$DashboardStatsModelImplCopyWithImpl<_$DashboardStatsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardStatsModelImplToJson(
      this,
    );
  }
}

abstract class _DashboardStatsModel implements DashboardStatsModel {
  const factory _DashboardStatsModel(
      {required final DashboardMeta meta,
      required final MemberStats member,
      required final SavingsStats savings,
      required final LoanStats loan}) = _$DashboardStatsModelImpl;

  factory _DashboardStatsModel.fromJson(Map<String, dynamic> json) =
      _$DashboardStatsModelImpl.fromJson;

  @override
  DashboardMeta get meta;
  @override
  MemberStats get member;
  @override
  SavingsStats get savings;
  @override
  LoanStats get loan;

  /// Create a copy of DashboardStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardStatsModelImplCopyWith<_$DashboardStatsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardMeta _$DashboardMetaFromJson(Map<String, dynamic> json) {
  return _DashboardMeta.fromJson(json);
}

/// @nodoc
mixin _$DashboardMeta {
  int get year => throw _privateConstructorUsedError;
  int get quarter => throw _privateConstructorUsedError;

  /// Serializes this DashboardMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardMetaCopyWith<DashboardMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardMetaCopyWith<$Res> {
  factory $DashboardMetaCopyWith(
          DashboardMeta value, $Res Function(DashboardMeta) then) =
      _$DashboardMetaCopyWithImpl<$Res, DashboardMeta>;
  @useResult
  $Res call({int year, int quarter});
}

/// @nodoc
class _$DashboardMetaCopyWithImpl<$Res, $Val extends DashboardMeta>
    implements $DashboardMetaCopyWith<$Res> {
  _$DashboardMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? quarter = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      quarter: null == quarter
          ? _value.quarter
          : quarter // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardMetaImplCopyWith<$Res>
    implements $DashboardMetaCopyWith<$Res> {
  factory _$$DashboardMetaImplCopyWith(
          _$DashboardMetaImpl value, $Res Function(_$DashboardMetaImpl) then) =
      __$$DashboardMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int year, int quarter});
}

/// @nodoc
class __$$DashboardMetaImplCopyWithImpl<$Res>
    extends _$DashboardMetaCopyWithImpl<$Res, _$DashboardMetaImpl>
    implements _$$DashboardMetaImplCopyWith<$Res> {
  __$$DashboardMetaImplCopyWithImpl(
      _$DashboardMetaImpl _value, $Res Function(_$DashboardMetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? quarter = null,
  }) {
    return _then(_$DashboardMetaImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      quarter: null == quarter
          ? _value.quarter
          : quarter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardMetaImpl implements _DashboardMeta {
  const _$DashboardMetaImpl({required this.year, required this.quarter});

  factory _$DashboardMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardMetaImplFromJson(json);

  @override
  final int year;
  @override
  final int quarter;

  @override
  String toString() {
    return 'DashboardMeta(year: $year, quarter: $quarter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardMetaImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.quarter, quarter) || other.quarter == quarter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, year, quarter);

  /// Create a copy of DashboardMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardMetaImplCopyWith<_$DashboardMetaImpl> get copyWith =>
      __$$DashboardMetaImplCopyWithImpl<_$DashboardMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardMetaImplToJson(
      this,
    );
  }
}

abstract class _DashboardMeta implements DashboardMeta {
  const factory _DashboardMeta(
      {required final int year,
      required final int quarter}) = _$DashboardMetaImpl;

  factory _DashboardMeta.fromJson(Map<String, dynamic> json) =
      _$DashboardMetaImpl.fromJson;

  @override
  int get year;
  @override
  int get quarter;

  /// Create a copy of DashboardMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardMetaImplCopyWith<_$DashboardMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MemberStats _$MemberStatsFromJson(Map<String, dynamic> json) {
  return _MemberStats.fromJson(json);
}

/// @nodoc
mixin _$MemberStats {
  @JsonKey(name: 'joined_this_quarter')
  int get joinedThisQuarter => throw _privateConstructorUsedError;
  @JsonKey(name: 'joined_percentage')
  double get joinedPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'left_this_quarter')
  int get leftThisQuarter => throw _privateConstructorUsedError;
  @JsonKey(name: 'left_percentage')
  double get leftPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_active_members')
  int get totalActiveMembers => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_inactive_members')
  int get totalInactiveMembers => throw _privateConstructorUsedError;

  /// Serializes this MemberStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MemberStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemberStatsCopyWith<MemberStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberStatsCopyWith<$Res> {
  factory $MemberStatsCopyWith(
          MemberStats value, $Res Function(MemberStats) then) =
      _$MemberStatsCopyWithImpl<$Res, MemberStats>;
  @useResult
  $Res call(
      {@JsonKey(name: 'joined_this_quarter') int joinedThisQuarter,
      @JsonKey(name: 'joined_percentage') double joinedPercentage,
      @JsonKey(name: 'left_this_quarter') int leftThisQuarter,
      @JsonKey(name: 'left_percentage') double leftPercentage,
      @JsonKey(name: 'total_active_members') int totalActiveMembers,
      @JsonKey(name: 'total_inactive_members') int totalInactiveMembers});
}

/// @nodoc
class _$MemberStatsCopyWithImpl<$Res, $Val extends MemberStats>
    implements $MemberStatsCopyWith<$Res> {
  _$MemberStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemberStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? joinedThisQuarter = null,
    Object? joinedPercentage = null,
    Object? leftThisQuarter = null,
    Object? leftPercentage = null,
    Object? totalActiveMembers = null,
    Object? totalInactiveMembers = null,
  }) {
    return _then(_value.copyWith(
      joinedThisQuarter: null == joinedThisQuarter
          ? _value.joinedThisQuarter
          : joinedThisQuarter // ignore: cast_nullable_to_non_nullable
              as int,
      joinedPercentage: null == joinedPercentage
          ? _value.joinedPercentage
          : joinedPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      leftThisQuarter: null == leftThisQuarter
          ? _value.leftThisQuarter
          : leftThisQuarter // ignore: cast_nullable_to_non_nullable
              as int,
      leftPercentage: null == leftPercentage
          ? _value.leftPercentage
          : leftPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      totalActiveMembers: null == totalActiveMembers
          ? _value.totalActiveMembers
          : totalActiveMembers // ignore: cast_nullable_to_non_nullable
              as int,
      totalInactiveMembers: null == totalInactiveMembers
          ? _value.totalInactiveMembers
          : totalInactiveMembers // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemberStatsImplCopyWith<$Res>
    implements $MemberStatsCopyWith<$Res> {
  factory _$$MemberStatsImplCopyWith(
          _$MemberStatsImpl value, $Res Function(_$MemberStatsImpl) then) =
      __$$MemberStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'joined_this_quarter') int joinedThisQuarter,
      @JsonKey(name: 'joined_percentage') double joinedPercentage,
      @JsonKey(name: 'left_this_quarter') int leftThisQuarter,
      @JsonKey(name: 'left_percentage') double leftPercentage,
      @JsonKey(name: 'total_active_members') int totalActiveMembers,
      @JsonKey(name: 'total_inactive_members') int totalInactiveMembers});
}

/// @nodoc
class __$$MemberStatsImplCopyWithImpl<$Res>
    extends _$MemberStatsCopyWithImpl<$Res, _$MemberStatsImpl>
    implements _$$MemberStatsImplCopyWith<$Res> {
  __$$MemberStatsImplCopyWithImpl(
      _$MemberStatsImpl _value, $Res Function(_$MemberStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemberStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? joinedThisQuarter = null,
    Object? joinedPercentage = null,
    Object? leftThisQuarter = null,
    Object? leftPercentage = null,
    Object? totalActiveMembers = null,
    Object? totalInactiveMembers = null,
  }) {
    return _then(_$MemberStatsImpl(
      joinedThisQuarter: null == joinedThisQuarter
          ? _value.joinedThisQuarter
          : joinedThisQuarter // ignore: cast_nullable_to_non_nullable
              as int,
      joinedPercentage: null == joinedPercentage
          ? _value.joinedPercentage
          : joinedPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      leftThisQuarter: null == leftThisQuarter
          ? _value.leftThisQuarter
          : leftThisQuarter // ignore: cast_nullable_to_non_nullable
              as int,
      leftPercentage: null == leftPercentage
          ? _value.leftPercentage
          : leftPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      totalActiveMembers: null == totalActiveMembers
          ? _value.totalActiveMembers
          : totalActiveMembers // ignore: cast_nullable_to_non_nullable
              as int,
      totalInactiveMembers: null == totalInactiveMembers
          ? _value.totalInactiveMembers
          : totalInactiveMembers // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberStatsImpl implements _MemberStats {
  const _$MemberStatsImpl(
      {@JsonKey(name: 'joined_this_quarter') required this.joinedThisQuarter,
      @JsonKey(name: 'joined_percentage') required this.joinedPercentage,
      @JsonKey(name: 'left_this_quarter') required this.leftThisQuarter,
      @JsonKey(name: 'left_percentage') required this.leftPercentage,
      @JsonKey(name: 'total_active_members') required this.totalActiveMembers,
      @JsonKey(name: 'total_inactive_members')
      required this.totalInactiveMembers});

  factory _$MemberStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberStatsImplFromJson(json);

  @override
  @JsonKey(name: 'joined_this_quarter')
  final int joinedThisQuarter;
  @override
  @JsonKey(name: 'joined_percentage')
  final double joinedPercentage;
  @override
  @JsonKey(name: 'left_this_quarter')
  final int leftThisQuarter;
  @override
  @JsonKey(name: 'left_percentage')
  final double leftPercentage;
  @override
  @JsonKey(name: 'total_active_members')
  final int totalActiveMembers;
  @override
  @JsonKey(name: 'total_inactive_members')
  final int totalInactiveMembers;

  @override
  String toString() {
    return 'MemberStats(joinedThisQuarter: $joinedThisQuarter, joinedPercentage: $joinedPercentage, leftThisQuarter: $leftThisQuarter, leftPercentage: $leftPercentage, totalActiveMembers: $totalActiveMembers, totalInactiveMembers: $totalInactiveMembers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberStatsImpl &&
            (identical(other.joinedThisQuarter, joinedThisQuarter) ||
                other.joinedThisQuarter == joinedThisQuarter) &&
            (identical(other.joinedPercentage, joinedPercentage) ||
                other.joinedPercentage == joinedPercentage) &&
            (identical(other.leftThisQuarter, leftThisQuarter) ||
                other.leftThisQuarter == leftThisQuarter) &&
            (identical(other.leftPercentage, leftPercentage) ||
                other.leftPercentage == leftPercentage) &&
            (identical(other.totalActiveMembers, totalActiveMembers) ||
                other.totalActiveMembers == totalActiveMembers) &&
            (identical(other.totalInactiveMembers, totalInactiveMembers) ||
                other.totalInactiveMembers == totalInactiveMembers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      joinedThisQuarter,
      joinedPercentage,
      leftThisQuarter,
      leftPercentage,
      totalActiveMembers,
      totalInactiveMembers);

  /// Create a copy of MemberStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberStatsImplCopyWith<_$MemberStatsImpl> get copyWith =>
      __$$MemberStatsImplCopyWithImpl<_$MemberStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberStatsImplToJson(
      this,
    );
  }
}

abstract class _MemberStats implements MemberStats {
  const factory _MemberStats(
      {@JsonKey(name: 'joined_this_quarter')
      required final int joinedThisQuarter,
      @JsonKey(name: 'joined_percentage')
      required final double joinedPercentage,
      @JsonKey(name: 'left_this_quarter') required final int leftThisQuarter,
      @JsonKey(name: 'left_percentage') required final double leftPercentage,
      @JsonKey(name: 'total_active_members')
      required final int totalActiveMembers,
      @JsonKey(name: 'total_inactive_members')
      required final int totalInactiveMembers}) = _$MemberStatsImpl;

  factory _MemberStats.fromJson(Map<String, dynamic> json) =
      _$MemberStatsImpl.fromJson;

  @override
  @JsonKey(name: 'joined_this_quarter')
  int get joinedThisQuarter;
  @override
  @JsonKey(name: 'joined_percentage')
  double get joinedPercentage;
  @override
  @JsonKey(name: 'left_this_quarter')
  int get leftThisQuarter;
  @override
  @JsonKey(name: 'left_percentage')
  double get leftPercentage;
  @override
  @JsonKey(name: 'total_active_members')
  int get totalActiveMembers;
  @override
  @JsonKey(name: 'total_inactive_members')
  int get totalInactiveMembers;

  /// Create a copy of MemberStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemberStatsImplCopyWith<_$MemberStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SavingsStats _$SavingsStatsFromJson(Map<String, dynamic> json) {
  return _SavingsStats.fromJson(json);
}

/// @nodoc
mixin _$SavingsStats {
  @JsonKey(name: 'users_not_saved_this_month')
  int get usersNotSavedThisQuarter => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_savings_this_month')
  int get totalSavingsThisQuarter => throw _privateConstructorUsedError;
  @JsonKey(name: 'saving_percentage')
  double get savingPercentage => throw _privateConstructorUsedError;

  /// Serializes this SavingsStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SavingsStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavingsStatsCopyWith<SavingsStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavingsStatsCopyWith<$Res> {
  factory $SavingsStatsCopyWith(
          SavingsStats value, $Res Function(SavingsStats) then) =
      _$SavingsStatsCopyWithImpl<$Res, SavingsStats>;
  @useResult
  $Res call(
      {@JsonKey(name: 'users_not_saved_this_month')
      int usersNotSavedThisQuarter,
      @JsonKey(name: 'total_savings_this_month') int totalSavingsThisQuarter,
      @JsonKey(name: 'saving_percentage') double savingPercentage});
}

/// @nodoc
class _$SavingsStatsCopyWithImpl<$Res, $Val extends SavingsStats>
    implements $SavingsStatsCopyWith<$Res> {
  _$SavingsStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavingsStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usersNotSavedThisQuarter = null,
    Object? totalSavingsThisQuarter = null,
    Object? savingPercentage = null,
  }) {
    return _then(_value.copyWith(
      usersNotSavedThisQuarter: null == usersNotSavedThisQuarter
          ? _value.usersNotSavedThisQuarter
          : usersNotSavedThisQuarter // ignore: cast_nullable_to_non_nullable
              as int,
      totalSavingsThisQuarter: null == totalSavingsThisQuarter
          ? _value.totalSavingsThisQuarter
          : totalSavingsThisQuarter // ignore: cast_nullable_to_non_nullable
              as int,
      savingPercentage: null == savingPercentage
          ? _value.savingPercentage
          : savingPercentage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SavingsStatsImplCopyWith<$Res>
    implements $SavingsStatsCopyWith<$Res> {
  factory _$$SavingsStatsImplCopyWith(
          _$SavingsStatsImpl value, $Res Function(_$SavingsStatsImpl) then) =
      __$$SavingsStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'users_not_saved_this_month')
      int usersNotSavedThisQuarter,
      @JsonKey(name: 'total_savings_this_month') int totalSavingsThisQuarter,
      @JsonKey(name: 'saving_percentage') double savingPercentage});
}

/// @nodoc
class __$$SavingsStatsImplCopyWithImpl<$Res>
    extends _$SavingsStatsCopyWithImpl<$Res, _$SavingsStatsImpl>
    implements _$$SavingsStatsImplCopyWith<$Res> {
  __$$SavingsStatsImplCopyWithImpl(
      _$SavingsStatsImpl _value, $Res Function(_$SavingsStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SavingsStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usersNotSavedThisQuarter = null,
    Object? totalSavingsThisQuarter = null,
    Object? savingPercentage = null,
  }) {
    return _then(_$SavingsStatsImpl(
      usersNotSavedThisQuarter: null == usersNotSavedThisQuarter
          ? _value.usersNotSavedThisQuarter
          : usersNotSavedThisQuarter // ignore: cast_nullable_to_non_nullable
              as int,
      totalSavingsThisQuarter: null == totalSavingsThisQuarter
          ? _value.totalSavingsThisQuarter
          : totalSavingsThisQuarter // ignore: cast_nullable_to_non_nullable
              as int,
      savingPercentage: null == savingPercentage
          ? _value.savingPercentage
          : savingPercentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavingsStatsImpl implements _SavingsStats {
  const _$SavingsStatsImpl(
      {@JsonKey(name: 'users_not_saved_this_month')
      required this.usersNotSavedThisQuarter,
      @JsonKey(name: 'total_savings_this_month')
      required this.totalSavingsThisQuarter,
      @JsonKey(name: 'saving_percentage') required this.savingPercentage});

  factory _$SavingsStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavingsStatsImplFromJson(json);

  @override
  @JsonKey(name: 'users_not_saved_this_month')
  final int usersNotSavedThisQuarter;
  @override
  @JsonKey(name: 'total_savings_this_month')
  final int totalSavingsThisQuarter;
  @override
  @JsonKey(name: 'saving_percentage')
  final double savingPercentage;

  @override
  String toString() {
    return 'SavingsStats(usersNotSavedThisQuarter: $usersNotSavedThisQuarter, totalSavingsThisQuarter: $totalSavingsThisQuarter, savingPercentage: $savingPercentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavingsStatsImpl &&
            (identical(
                    other.usersNotSavedThisQuarter, usersNotSavedThisQuarter) ||
                other.usersNotSavedThisQuarter == usersNotSavedThisQuarter) &&
            (identical(
                    other.totalSavingsThisQuarter, totalSavingsThisQuarter) ||
                other.totalSavingsThisQuarter == totalSavingsThisQuarter) &&
            (identical(other.savingPercentage, savingPercentage) ||
                other.savingPercentage == savingPercentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, usersNotSavedThisQuarter,
      totalSavingsThisQuarter, savingPercentage);

  /// Create a copy of SavingsStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavingsStatsImplCopyWith<_$SavingsStatsImpl> get copyWith =>
      __$$SavingsStatsImplCopyWithImpl<_$SavingsStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavingsStatsImplToJson(
      this,
    );
  }
}

abstract class _SavingsStats implements SavingsStats {
  const factory _SavingsStats(
      {@JsonKey(name: 'users_not_saved_this_month')
      required final int usersNotSavedThisQuarter,
      @JsonKey(name: 'total_savings_this_month')
      required final int totalSavingsThisQuarter,
      @JsonKey(name: 'saving_percentage')
      required final double savingPercentage}) = _$SavingsStatsImpl;

  factory _SavingsStats.fromJson(Map<String, dynamic> json) =
      _$SavingsStatsImpl.fromJson;

  @override
  @JsonKey(name: 'users_not_saved_this_month')
  int get usersNotSavedThisQuarter;
  @override
  @JsonKey(name: 'total_savings_this_month')
  int get totalSavingsThisQuarter;
  @override
  @JsonKey(name: 'saving_percentage')
  double get savingPercentage;

  /// Create a copy of SavingsStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavingsStatsImplCopyWith<_$SavingsStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoanStats _$LoanStatsFromJson(Map<String, dynamic> json) {
  return _LoanStats.fromJson(json);
}

/// @nodoc
mixin _$LoanStats {
  @JsonKey(name: 'users_unpaid_loan_this_month')
  int get usersUnpaidLoanThisQuarter => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_unpaid_loan_this_month')
  int get totalUnpaidLoanThisQuarter => throw _privateConstructorUsedError;
  @JsonKey(name: 'loan_percentage')
  double get loanPercentage => throw _privateConstructorUsedError;

  /// Serializes this LoanStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoanStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoanStatsCopyWith<LoanStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoanStatsCopyWith<$Res> {
  factory $LoanStatsCopyWith(LoanStats value, $Res Function(LoanStats) then) =
      _$LoanStatsCopyWithImpl<$Res, LoanStats>;
  @useResult
  $Res call(
      {@JsonKey(name: 'users_unpaid_loan_this_month')
      int usersUnpaidLoanThisQuarter,
      @JsonKey(name: 'total_unpaid_loan_this_month')
      int totalUnpaidLoanThisQuarter,
      @JsonKey(name: 'loan_percentage') double loanPercentage});
}

/// @nodoc
class _$LoanStatsCopyWithImpl<$Res, $Val extends LoanStats>
    implements $LoanStatsCopyWith<$Res> {
  _$LoanStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoanStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usersUnpaidLoanThisQuarter = null,
    Object? totalUnpaidLoanThisQuarter = null,
    Object? loanPercentage = null,
  }) {
    return _then(_value.copyWith(
      usersUnpaidLoanThisQuarter: null == usersUnpaidLoanThisQuarter
          ? _value.usersUnpaidLoanThisQuarter
          : usersUnpaidLoanThisQuarter // ignore: cast_nullable_to_non_nullable
              as int,
      totalUnpaidLoanThisQuarter: null == totalUnpaidLoanThisQuarter
          ? _value.totalUnpaidLoanThisQuarter
          : totalUnpaidLoanThisQuarter // ignore: cast_nullable_to_non_nullable
              as int,
      loanPercentage: null == loanPercentage
          ? _value.loanPercentage
          : loanPercentage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoanStatsImplCopyWith<$Res>
    implements $LoanStatsCopyWith<$Res> {
  factory _$$LoanStatsImplCopyWith(
          _$LoanStatsImpl value, $Res Function(_$LoanStatsImpl) then) =
      __$$LoanStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'users_unpaid_loan_this_month')
      int usersUnpaidLoanThisQuarter,
      @JsonKey(name: 'total_unpaid_loan_this_month')
      int totalUnpaidLoanThisQuarter,
      @JsonKey(name: 'loan_percentage') double loanPercentage});
}

/// @nodoc
class __$$LoanStatsImplCopyWithImpl<$Res>
    extends _$LoanStatsCopyWithImpl<$Res, _$LoanStatsImpl>
    implements _$$LoanStatsImplCopyWith<$Res> {
  __$$LoanStatsImplCopyWithImpl(
      _$LoanStatsImpl _value, $Res Function(_$LoanStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoanStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usersUnpaidLoanThisQuarter = null,
    Object? totalUnpaidLoanThisQuarter = null,
    Object? loanPercentage = null,
  }) {
    return _then(_$LoanStatsImpl(
      usersUnpaidLoanThisQuarter: null == usersUnpaidLoanThisQuarter
          ? _value.usersUnpaidLoanThisQuarter
          : usersUnpaidLoanThisQuarter // ignore: cast_nullable_to_non_nullable
              as int,
      totalUnpaidLoanThisQuarter: null == totalUnpaidLoanThisQuarter
          ? _value.totalUnpaidLoanThisQuarter
          : totalUnpaidLoanThisQuarter // ignore: cast_nullable_to_non_nullable
              as int,
      loanPercentage: null == loanPercentage
          ? _value.loanPercentage
          : loanPercentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoanStatsImpl implements _LoanStats {
  const _$LoanStatsImpl(
      {@JsonKey(name: 'users_unpaid_loan_this_month')
      required this.usersUnpaidLoanThisQuarter,
      @JsonKey(name: 'total_unpaid_loan_this_month')
      required this.totalUnpaidLoanThisQuarter,
      @JsonKey(name: 'loan_percentage') required this.loanPercentage});

  factory _$LoanStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoanStatsImplFromJson(json);

  @override
  @JsonKey(name: 'users_unpaid_loan_this_month')
  final int usersUnpaidLoanThisQuarter;
  @override
  @JsonKey(name: 'total_unpaid_loan_this_month')
  final int totalUnpaidLoanThisQuarter;
  @override
  @JsonKey(name: 'loan_percentage')
  final double loanPercentage;

  @override
  String toString() {
    return 'LoanStats(usersUnpaidLoanThisQuarter: $usersUnpaidLoanThisQuarter, totalUnpaidLoanThisQuarter: $totalUnpaidLoanThisQuarter, loanPercentage: $loanPercentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoanStatsImpl &&
            (identical(other.usersUnpaidLoanThisQuarter,
                    usersUnpaidLoanThisQuarter) ||
                other.usersUnpaidLoanThisQuarter ==
                    usersUnpaidLoanThisQuarter) &&
            (identical(other.totalUnpaidLoanThisQuarter,
                    totalUnpaidLoanThisQuarter) ||
                other.totalUnpaidLoanThisQuarter ==
                    totalUnpaidLoanThisQuarter) &&
            (identical(other.loanPercentage, loanPercentage) ||
                other.loanPercentage == loanPercentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, usersUnpaidLoanThisQuarter,
      totalUnpaidLoanThisQuarter, loanPercentage);

  /// Create a copy of LoanStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoanStatsImplCopyWith<_$LoanStatsImpl> get copyWith =>
      __$$LoanStatsImplCopyWithImpl<_$LoanStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoanStatsImplToJson(
      this,
    );
  }
}

abstract class _LoanStats implements LoanStats {
  const factory _LoanStats(
      {@JsonKey(name: 'users_unpaid_loan_this_month')
      required final int usersUnpaidLoanThisQuarter,
      @JsonKey(name: 'total_unpaid_loan_this_month')
      required final int totalUnpaidLoanThisQuarter,
      @JsonKey(name: 'loan_percentage')
      required final double loanPercentage}) = _$LoanStatsImpl;

  factory _LoanStats.fromJson(Map<String, dynamic> json) =
      _$LoanStatsImpl.fromJson;

  @override
  @JsonKey(name: 'users_unpaid_loan_this_month')
  int get usersUnpaidLoanThisQuarter;
  @override
  @JsonKey(name: 'total_unpaid_loan_this_month')
  int get totalUnpaidLoanThisQuarter;
  @override
  @JsonKey(name: 'loan_percentage')
  double get loanPercentage;

  /// Create a copy of LoanStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoanStatsImplCopyWith<_$LoanStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
