// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_number')
  String? get memberNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'identity_number')
  String get identityNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth_date')
  DateTime get birthDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get occupation => throw _privateConstructorUsedError;
  @JsonKey(name: 'identity_card_photo')
  String? get identityCardPhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'self_photo')
  String? get selfPhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_card_photo')
  String? get memberCardPhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified_at')
  DateTime? get emailVerifiedAt => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_area')
  WorkAreaModel? get workArea => throw _privateConstructorUsedError;
  GroupModel? get group => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'member_number') String? memberNumber,
      @JsonKey(name: 'identity_number') String identityNumber,
      @JsonKey(name: 'birth_date') DateTime birthDate,
      @JsonKey(name: 'phone_number') String phoneNumber,
      String? address,
      String? occupation,
      @JsonKey(name: 'identity_card_photo') String? identityCardPhoto,
      @JsonKey(name: 'self_photo') String? selfPhoto,
      @JsonKey(name: 'member_card_photo') String? memberCardPhoto,
      @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
      String role,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'work_area') WorkAreaModel? workArea,
      GroupModel? group,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  $WorkAreaModelCopyWith<$Res>? get workArea;
  $GroupModelCopyWith<$Res>? get group;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? memberNumber = freezed,
    Object? identityNumber = null,
    Object? birthDate = null,
    Object? phoneNumber = null,
    Object? address = freezed,
    Object? occupation = freezed,
    Object? identityCardPhoto = freezed,
    Object? selfPhoto = freezed,
    Object? memberCardPhoto = freezed,
    Object? emailVerifiedAt = freezed,
    Object? role = null,
    Object? isActive = null,
    Object? workArea = freezed,
    Object? group = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      memberNumber: freezed == memberNumber
          ? _value.memberNumber
          : memberNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      identityNumber: null == identityNumber
          ? _value.identityNumber
          : identityNumber // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      occupation: freezed == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String?,
      identityCardPhoto: freezed == identityCardPhoto
          ? _value.identityCardPhoto
          : identityCardPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      selfPhoto: freezed == selfPhoto
          ? _value.selfPhoto
          : selfPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      memberCardPhoto: freezed == memberCardPhoto
          ? _value.memberCardPhoto
          : memberCardPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      workArea: freezed == workArea
          ? _value.workArea
          : workArea // ignore: cast_nullable_to_non_nullable
              as WorkAreaModel?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as GroupModel?,
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

  /// Create a copy of UserModel
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

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupModelCopyWith<$Res>? get group {
    if (_value.group == null) {
      return null;
    }

    return $GroupModelCopyWith<$Res>(_value.group!, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'member_number') String? memberNumber,
      @JsonKey(name: 'identity_number') String identityNumber,
      @JsonKey(name: 'birth_date') DateTime birthDate,
      @JsonKey(name: 'phone_number') String phoneNumber,
      String? address,
      String? occupation,
      @JsonKey(name: 'identity_card_photo') String? identityCardPhoto,
      @JsonKey(name: 'self_photo') String? selfPhoto,
      @JsonKey(name: 'member_card_photo') String? memberCardPhoto,
      @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
      String role,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'work_area') WorkAreaModel? workArea,
      GroupModel? group,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  @override
  $WorkAreaModelCopyWith<$Res>? get workArea;
  @override
  $GroupModelCopyWith<$Res>? get group;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? memberNumber = freezed,
    Object? identityNumber = null,
    Object? birthDate = null,
    Object? phoneNumber = null,
    Object? address = freezed,
    Object? occupation = freezed,
    Object? identityCardPhoto = freezed,
    Object? selfPhoto = freezed,
    Object? memberCardPhoto = freezed,
    Object? emailVerifiedAt = freezed,
    Object? role = null,
    Object? isActive = null,
    Object? workArea = freezed,
    Object? group = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      memberNumber: freezed == memberNumber
          ? _value.memberNumber
          : memberNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      identityNumber: null == identityNumber
          ? _value.identityNumber
          : identityNumber // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      occupation: freezed == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String?,
      identityCardPhoto: freezed == identityCardPhoto
          ? _value.identityCardPhoto
          : identityCardPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      selfPhoto: freezed == selfPhoto
          ? _value.selfPhoto
          : selfPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      memberCardPhoto: freezed == memberCardPhoto
          ? _value.memberCardPhoto
          : memberCardPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      workArea: freezed == workArea
          ? _value.workArea
          : workArea // ignore: cast_nullable_to_non_nullable
              as WorkAreaModel?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as GroupModel?,
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
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'member_number') this.memberNumber,
      @JsonKey(name: 'identity_number') required this.identityNumber,
      @JsonKey(name: 'birth_date') required this.birthDate,
      @JsonKey(name: 'phone_number') required this.phoneNumber,
      this.address,
      this.occupation,
      @JsonKey(name: 'identity_card_photo') this.identityCardPhoto,
      @JsonKey(name: 'self_photo') this.selfPhoto,
      @JsonKey(name: 'member_card_photo') this.memberCardPhoto,
      @JsonKey(name: 'email_verified_at') this.emailVerifiedAt,
      required this.role,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'work_area') this.workArea,
      this.group,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'member_number')
  final String? memberNumber;
  @override
  @JsonKey(name: 'identity_number')
  final String identityNumber;
  @override
  @JsonKey(name: 'birth_date')
  final DateTime birthDate;
  @override
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @override
  final String? address;
  @override
  final String? occupation;
  @override
  @JsonKey(name: 'identity_card_photo')
  final String? identityCardPhoto;
  @override
  @JsonKey(name: 'self_photo')
  final String? selfPhoto;
  @override
  @JsonKey(name: 'member_card_photo')
  final String? memberCardPhoto;
  @override
  @JsonKey(name: 'email_verified_at')
  final DateTime? emailVerifiedAt;
  @override
  final String role;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'work_area')
  final WorkAreaModel? workArea;
  @override
  final GroupModel? group;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, memberNumber: $memberNumber, identityNumber: $identityNumber, birthDate: $birthDate, phoneNumber: $phoneNumber, address: $address, occupation: $occupation, identityCardPhoto: $identityCardPhoto, selfPhoto: $selfPhoto, memberCardPhoto: $memberCardPhoto, emailVerifiedAt: $emailVerifiedAt, role: $role, isActive: $isActive, workArea: $workArea, group: $group, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.memberNumber, memberNumber) ||
                other.memberNumber == memberNumber) &&
            (identical(other.identityNumber, identityNumber) ||
                other.identityNumber == identityNumber) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.occupation, occupation) ||
                other.occupation == occupation) &&
            (identical(other.identityCardPhoto, identityCardPhoto) ||
                other.identityCardPhoto == identityCardPhoto) &&
            (identical(other.selfPhoto, selfPhoto) ||
                other.selfPhoto == selfPhoto) &&
            (identical(other.memberCardPhoto, memberCardPhoto) ||
                other.memberCardPhoto == memberCardPhoto) &&
            (identical(other.emailVerifiedAt, emailVerifiedAt) ||
                other.emailVerifiedAt == emailVerifiedAt) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.workArea, workArea) ||
                other.workArea == workArea) &&
            (identical(other.group, group) || other.group == group) &&
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
      name,
      memberNumber,
      identityNumber,
      birthDate,
      phoneNumber,
      address,
      occupation,
      identityCardPhoto,
      selfPhoto,
      memberCardPhoto,
      emailVerifiedAt,
      role,
      isActive,
      workArea,
      group,
      createdAt,
      updatedAt);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required final int id,
      required final String name,
      @JsonKey(name: 'member_number') final String? memberNumber,
      @JsonKey(name: 'identity_number') required final String identityNumber,
      @JsonKey(name: 'birth_date') required final DateTime birthDate,
      @JsonKey(name: 'phone_number') required final String phoneNumber,
      final String? address,
      final String? occupation,
      @JsonKey(name: 'identity_card_photo') final String? identityCardPhoto,
      @JsonKey(name: 'self_photo') final String? selfPhoto,
      @JsonKey(name: 'member_card_photo') final String? memberCardPhoto,
      @JsonKey(name: 'email_verified_at') final DateTime? emailVerifiedAt,
      required final String role,
      @JsonKey(name: 'is_active') required final bool isActive,
      @JsonKey(name: 'work_area') final WorkAreaModel? workArea,
      final GroupModel? group,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      final DateTime? updatedAt}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'member_number')
  String? get memberNumber;
  @override
  @JsonKey(name: 'identity_number')
  String get identityNumber;
  @override
  @JsonKey(name: 'birth_date')
  DateTime get birthDate;
  @override
  @JsonKey(name: 'phone_number')
  String get phoneNumber;
  @override
  String? get address;
  @override
  String? get occupation;
  @override
  @JsonKey(name: 'identity_card_photo')
  String? get identityCardPhoto;
  @override
  @JsonKey(name: 'self_photo')
  String? get selfPhoto;
  @override
  @JsonKey(name: 'member_card_photo')
  String? get memberCardPhoto;
  @override
  @JsonKey(name: 'email_verified_at')
  DateTime? get emailVerifiedAt;
  @override
  String get role;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'work_area')
  WorkAreaModel? get workArea;
  @override
  GroupModel? get group;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
