// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupModel _$GroupModelFromJson(Map<String, dynamic> json) {
  return _GroupModel.fromJson(json);
}

/// @nodoc
mixin _$GroupModel {
  int get id => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'shared_liability_fund_amount')
  int? get sharedLiabilityFundAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_fund_amount')
  int? get groupFundAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'social_fund_amount')
  int? get socialFundAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_shared_liability_fund')
  int? get totalSharedLiabilityFund => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_group_fund')
  int? get totalGroupFund => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_social_fund')
  int? get totalSocialFund => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_area')
  WorkAreaModel? get workArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'chairman')
  UserModel? get chairman => throw _privateConstructorUsedError;
  @JsonKey(name: 'facilitator')
  UserModel? get facilitator => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this GroupModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupModelCopyWith<GroupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupModelCopyWith<$Res> {
  factory $GroupModelCopyWith(
          GroupModel value, $Res Function(GroupModel) then) =
      _$GroupModelCopyWithImpl<$Res, GroupModel>;
  @useResult
  $Res call(
      {int id,
      int number,
      String? description,
      @JsonKey(name: 'shared_liability_fund_amount')
      int? sharedLiabilityFundAmount,
      @JsonKey(name: 'group_fund_amount') int? groupFundAmount,
      @JsonKey(name: 'social_fund_amount') int? socialFundAmount,
      @JsonKey(name: 'total_shared_liability_fund')
      int? totalSharedLiabilityFund,
      @JsonKey(name: 'total_group_fund') int? totalGroupFund,
      @JsonKey(name: 'total_social_fund') int? totalSocialFund,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'work_area') WorkAreaModel? workArea,
      @JsonKey(name: 'chairman') UserModel? chairman,
      @JsonKey(name: 'facilitator') UserModel? facilitator,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  $WorkAreaModelCopyWith<$Res>? get workArea;
  $UserModelCopyWith<$Res>? get chairman;
  $UserModelCopyWith<$Res>? get facilitator;
}

/// @nodoc
class _$GroupModelCopyWithImpl<$Res, $Val extends GroupModel>
    implements $GroupModelCopyWith<$Res> {
  _$GroupModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? description = freezed,
    Object? sharedLiabilityFundAmount = freezed,
    Object? groupFundAmount = freezed,
    Object? socialFundAmount = freezed,
    Object? totalSharedLiabilityFund = freezed,
    Object? totalGroupFund = freezed,
    Object? totalSocialFund = freezed,
    Object? isActive = freezed,
    Object? workArea = freezed,
    Object? chairman = freezed,
    Object? facilitator = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      sharedLiabilityFundAmount: freezed == sharedLiabilityFundAmount
          ? _value.sharedLiabilityFundAmount
          : sharedLiabilityFundAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      groupFundAmount: freezed == groupFundAmount
          ? _value.groupFundAmount
          : groupFundAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      socialFundAmount: freezed == socialFundAmount
          ? _value.socialFundAmount
          : socialFundAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalSharedLiabilityFund: freezed == totalSharedLiabilityFund
          ? _value.totalSharedLiabilityFund
          : totalSharedLiabilityFund // ignore: cast_nullable_to_non_nullable
              as int?,
      totalGroupFund: freezed == totalGroupFund
          ? _value.totalGroupFund
          : totalGroupFund // ignore: cast_nullable_to_non_nullable
              as int?,
      totalSocialFund: freezed == totalSocialFund
          ? _value.totalSocialFund
          : totalSocialFund // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      workArea: freezed == workArea
          ? _value.workArea
          : workArea // ignore: cast_nullable_to_non_nullable
              as WorkAreaModel?,
      chairman: freezed == chairman
          ? _value.chairman
          : chairman // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      facilitator: freezed == facilitator
          ? _value.facilitator
          : facilitator // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of GroupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkAreaModelCopyWith<$Res>? get workArea {
    if (_value.workArea == null) {
      return null;
    }

    return $WorkAreaModelCopyWith<$Res>(_value.workArea!, (value) {
      return _then(_value.copyWith(workArea: value) as $Val);
    });
  }

  /// Create a copy of GroupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get chairman {
    if (_value.chairman == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.chairman!, (value) {
      return _then(_value.copyWith(chairman: value) as $Val);
    });
  }

  /// Create a copy of GroupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get facilitator {
    if (_value.facilitator == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.facilitator!, (value) {
      return _then(_value.copyWith(facilitator: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GroupModelImplCopyWith<$Res>
    implements $GroupModelCopyWith<$Res> {
  factory _$$GroupModelImplCopyWith(
          _$GroupModelImpl value, $Res Function(_$GroupModelImpl) then) =
      __$$GroupModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int number,
      String? description,
      @JsonKey(name: 'shared_liability_fund_amount')
      int? sharedLiabilityFundAmount,
      @JsonKey(name: 'group_fund_amount') int? groupFundAmount,
      @JsonKey(name: 'social_fund_amount') int? socialFundAmount,
      @JsonKey(name: 'total_shared_liability_fund')
      int? totalSharedLiabilityFund,
      @JsonKey(name: 'total_group_fund') int? totalGroupFund,
      @JsonKey(name: 'total_social_fund') int? totalSocialFund,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'work_area') WorkAreaModel? workArea,
      @JsonKey(name: 'chairman') UserModel? chairman,
      @JsonKey(name: 'facilitator') UserModel? facilitator,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  @override
  $WorkAreaModelCopyWith<$Res>? get workArea;
  @override
  $UserModelCopyWith<$Res>? get chairman;
  @override
  $UserModelCopyWith<$Res>? get facilitator;
}

/// @nodoc
class __$$GroupModelImplCopyWithImpl<$Res>
    extends _$GroupModelCopyWithImpl<$Res, _$GroupModelImpl>
    implements _$$GroupModelImplCopyWith<$Res> {
  __$$GroupModelImplCopyWithImpl(
      _$GroupModelImpl _value, $Res Function(_$GroupModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? description = freezed,
    Object? sharedLiabilityFundAmount = freezed,
    Object? groupFundAmount = freezed,
    Object? socialFundAmount = freezed,
    Object? totalSharedLiabilityFund = freezed,
    Object? totalGroupFund = freezed,
    Object? totalSocialFund = freezed,
    Object? isActive = freezed,
    Object? workArea = freezed,
    Object? chairman = freezed,
    Object? facilitator = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$GroupModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      sharedLiabilityFundAmount: freezed == sharedLiabilityFundAmount
          ? _value.sharedLiabilityFundAmount
          : sharedLiabilityFundAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      groupFundAmount: freezed == groupFundAmount
          ? _value.groupFundAmount
          : groupFundAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      socialFundAmount: freezed == socialFundAmount
          ? _value.socialFundAmount
          : socialFundAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalSharedLiabilityFund: freezed == totalSharedLiabilityFund
          ? _value.totalSharedLiabilityFund
          : totalSharedLiabilityFund // ignore: cast_nullable_to_non_nullable
              as int?,
      totalGroupFund: freezed == totalGroupFund
          ? _value.totalGroupFund
          : totalGroupFund // ignore: cast_nullable_to_non_nullable
              as int?,
      totalSocialFund: freezed == totalSocialFund
          ? _value.totalSocialFund
          : totalSocialFund // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      workArea: freezed == workArea
          ? _value.workArea
          : workArea // ignore: cast_nullable_to_non_nullable
              as WorkAreaModel?,
      chairman: freezed == chairman
          ? _value.chairman
          : chairman // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      facilitator: freezed == facilitator
          ? _value.facilitator
          : facilitator // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupModelImpl implements _GroupModel {
  const _$GroupModelImpl(
      {required this.id,
      required this.number,
      this.description,
      @JsonKey(name: 'shared_liability_fund_amount')
      this.sharedLiabilityFundAmount,
      @JsonKey(name: 'group_fund_amount') this.groupFundAmount,
      @JsonKey(name: 'social_fund_amount') this.socialFundAmount,
      @JsonKey(name: 'total_shared_liability_fund')
      this.totalSharedLiabilityFund,
      @JsonKey(name: 'total_group_fund') this.totalGroupFund,
      @JsonKey(name: 'total_social_fund') this.totalSocialFund,
      @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'work_area') this.workArea,
      @JsonKey(name: 'chairman') this.chairman,
      @JsonKey(name: 'facilitator') this.facilitator,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$GroupModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupModelImplFromJson(json);

  @override
  final int id;
  @override
  final int number;
  @override
  final String? description;
  @override
  @JsonKey(name: 'shared_liability_fund_amount')
  final int? sharedLiabilityFundAmount;
  @override
  @JsonKey(name: 'group_fund_amount')
  final int? groupFundAmount;
  @override
  @JsonKey(name: 'social_fund_amount')
  final int? socialFundAmount;
  @override
  @JsonKey(name: 'total_shared_liability_fund')
  final int? totalSharedLiabilityFund;
  @override
  @JsonKey(name: 'total_group_fund')
  final int? totalGroupFund;
  @override
  @JsonKey(name: 'total_social_fund')
  final int? totalSocialFund;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @override
  @JsonKey(name: 'work_area')
  final WorkAreaModel? workArea;
  @override
  @JsonKey(name: 'chairman')
  final UserModel? chairman;
  @override
  @JsonKey(name: 'facilitator')
  final UserModel? facilitator;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'GroupModel(id: $id, number: $number, description: $description, sharedLiabilityFundAmount: $sharedLiabilityFundAmount, groupFundAmount: $groupFundAmount, socialFundAmount: $socialFundAmount, totalSharedLiabilityFund: $totalSharedLiabilityFund, totalGroupFund: $totalGroupFund, totalSocialFund: $totalSocialFund, isActive: $isActive, workArea: $workArea, chairman: $chairman, facilitator: $facilitator, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.sharedLiabilityFundAmount,
                    sharedLiabilityFundAmount) ||
                other.sharedLiabilityFundAmount == sharedLiabilityFundAmount) &&
            (identical(other.groupFundAmount, groupFundAmount) ||
                other.groupFundAmount == groupFundAmount) &&
            (identical(other.socialFundAmount, socialFundAmount) ||
                other.socialFundAmount == socialFundAmount) &&
            (identical(
                    other.totalSharedLiabilityFund, totalSharedLiabilityFund) ||
                other.totalSharedLiabilityFund == totalSharedLiabilityFund) &&
            (identical(other.totalGroupFund, totalGroupFund) ||
                other.totalGroupFund == totalGroupFund) &&
            (identical(other.totalSocialFund, totalSocialFund) ||
                other.totalSocialFund == totalSocialFund) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.workArea, workArea) ||
                other.workArea == workArea) &&
            (identical(other.chairman, chairman) ||
                other.chairman == chairman) &&
            (identical(other.facilitator, facilitator) ||
                other.facilitator == facilitator) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      number,
      description,
      sharedLiabilityFundAmount,
      groupFundAmount,
      socialFundAmount,
      totalSharedLiabilityFund,
      totalGroupFund,
      totalSocialFund,
      isActive,
      workArea,
      chairman,
      facilitator,
      createdAt,
      updatedAt);

  /// Create a copy of GroupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupModelImplCopyWith<_$GroupModelImpl> get copyWith =>
      __$$GroupModelImplCopyWithImpl<_$GroupModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupModelImplToJson(
      this,
    );
  }
}

abstract class _GroupModel implements GroupModel {
  const factory _GroupModel(
          {required final int id,
          required final int number,
          final String? description,
          @JsonKey(name: 'shared_liability_fund_amount')
          final int? sharedLiabilityFundAmount,
          @JsonKey(name: 'group_fund_amount') final int? groupFundAmount,
          @JsonKey(name: 'social_fund_amount') final int? socialFundAmount,
          @JsonKey(name: 'total_shared_liability_fund')
          final int? totalSharedLiabilityFund,
          @JsonKey(name: 'total_group_fund') final int? totalGroupFund,
          @JsonKey(name: 'total_social_fund') final int? totalSocialFund,
          @JsonKey(name: 'is_active') final bool? isActive,
          @JsonKey(name: 'work_area') final WorkAreaModel? workArea,
          @JsonKey(name: 'chairman') final UserModel? chairman,
          @JsonKey(name: 'facilitator') final UserModel? facilitator,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$GroupModelImpl;

  factory _GroupModel.fromJson(Map<String, dynamic> json) =
      _$GroupModelImpl.fromJson;

  @override
  int get id;
  @override
  int get number;
  @override
  String? get description;
  @override
  @JsonKey(name: 'shared_liability_fund_amount')
  int? get sharedLiabilityFundAmount;
  @override
  @JsonKey(name: 'group_fund_amount')
  int? get groupFundAmount;
  @override
  @JsonKey(name: 'social_fund_amount')
  int? get socialFundAmount;
  @override
  @JsonKey(name: 'total_shared_liability_fund')
  int? get totalSharedLiabilityFund;
  @override
  @JsonKey(name: 'total_group_fund')
  int? get totalGroupFund;
  @override
  @JsonKey(name: 'total_social_fund')
  int? get totalSocialFund;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @override
  @JsonKey(name: 'work_area')
  WorkAreaModel? get workArea;
  @override
  @JsonKey(name: 'chairman')
  UserModel? get chairman;
  @override
  @JsonKey(name: 'facilitator')
  UserModel? get facilitator;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of GroupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupModelImplCopyWith<_$GroupModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
