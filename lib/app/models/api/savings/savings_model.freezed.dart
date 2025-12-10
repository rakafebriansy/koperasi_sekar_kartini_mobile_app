// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'savings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SavingsModel _$SavingsModelFromJson(Map<String, dynamic> json) {
  return _SavingsModel.fromJson(json);
}

/// @nodoc
mixin _$SavingsModel {
  int get id => throw _privateConstructorUsedError;
  SavingsType get type => throw _privateConstructorUsedError;
  int get nominal => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  UserModel get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this SavingsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SavingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavingsModelCopyWith<SavingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavingsModelCopyWith<$Res> {
  factory $SavingsModelCopyWith(
          SavingsModel value, $Res Function(SavingsModel) then) =
      _$SavingsModelCopyWithImpl<$Res, SavingsModel>;
  @useResult
  $Res call(
      {int id,
      SavingsType type,
      int nominal,
      int year,
      int month,
      @JsonKey(name: 'user') UserModel user,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$SavingsModelCopyWithImpl<$Res, $Val extends SavingsModel>
    implements $SavingsModelCopyWith<$Res> {
  _$SavingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? nominal = null,
    Object? year = null,
    Object? month = null,
    Object? user = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SavingsType,
      nominal: null == nominal
          ? _value.nominal
          : nominal // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
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

  /// Create a copy of SavingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SavingsModelImplCopyWith<$Res>
    implements $SavingsModelCopyWith<$Res> {
  factory _$$SavingsModelImplCopyWith(
          _$SavingsModelImpl value, $Res Function(_$SavingsModelImpl) then) =
      __$$SavingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      SavingsType type,
      int nominal,
      int year,
      int month,
      @JsonKey(name: 'user') UserModel user,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$SavingsModelImplCopyWithImpl<$Res>
    extends _$SavingsModelCopyWithImpl<$Res, _$SavingsModelImpl>
    implements _$$SavingsModelImplCopyWith<$Res> {
  __$$SavingsModelImplCopyWithImpl(
      _$SavingsModelImpl _value, $Res Function(_$SavingsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SavingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? nominal = null,
    Object? year = null,
    Object? month = null,
    Object? user = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$SavingsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SavingsType,
      nominal: null == nominal
          ? _value.nominal
          : nominal // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
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
class _$SavingsModelImpl extends _SavingsModel {
  const _$SavingsModelImpl(
      {required this.id,
      required this.type,
      required this.nominal,
      required this.year,
      required this.month,
      @JsonKey(name: 'user') required this.user,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : super._();

  factory _$SavingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavingsModelImplFromJson(json);

  @override
  final int id;
  @override
  final SavingsType type;
  @override
  final int nominal;
  @override
  final int year;
  @override
  final int month;
  @override
  @JsonKey(name: 'user')
  final UserModel user;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'SavingsModel(id: $id, type: $type, nominal: $nominal, year: $year, month: $month, user: $user, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavingsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.nominal, nominal) || other.nominal == nominal) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, type, nominal, year, month, user, createdAt, updatedAt);

  /// Create a copy of SavingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavingsModelImplCopyWith<_$SavingsModelImpl> get copyWith =>
      __$$SavingsModelImplCopyWithImpl<_$SavingsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavingsModelImplToJson(
      this,
    );
  }
}

abstract class _SavingsModel extends SavingsModel {
  const factory _SavingsModel(
          {required final int id,
          required final SavingsType type,
          required final int nominal,
          required final int year,
          required final int month,
          @JsonKey(name: 'user') required final UserModel user,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$SavingsModelImpl;
  const _SavingsModel._() : super._();

  factory _SavingsModel.fromJson(Map<String, dynamic> json) =
      _$SavingsModelImpl.fromJson;

  @override
  int get id;
  @override
  SavingsType get type;
  @override
  int get nominal;
  @override
  int get year;
  @override
  int get month;
  @override
  @JsonKey(name: 'user')
  UserModel get user;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of SavingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavingsModelImplCopyWith<_$SavingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
