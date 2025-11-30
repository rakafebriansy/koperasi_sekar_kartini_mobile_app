// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_area_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkAreaModel _$WorkAreaModelFromJson(Map<String, dynamic> json) {
  return _WorkAreaModel.fromJson(json);
}

/// @nodoc
mixin _$WorkAreaModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_work_area')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this WorkAreaModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkAreaModelCopyWith<WorkAreaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkAreaModelCopyWith<$Res> {
  factory $WorkAreaModelCopyWith(
          WorkAreaModel value, $Res Function(WorkAreaModel) then) =
      _$WorkAreaModelCopyWithImpl<$Res, WorkAreaModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'name_work_area') String name,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$WorkAreaModelCopyWithImpl<$Res, $Val extends WorkAreaModel>
    implements $WorkAreaModelCopyWith<$Res> {
  _$WorkAreaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
}

/// @nodoc
abstract class _$$WorkAreaModelImplCopyWith<$Res>
    implements $WorkAreaModelCopyWith<$Res> {
  factory _$$WorkAreaModelImplCopyWith(
          _$WorkAreaModelImpl value, $Res Function(_$WorkAreaModelImpl) then) =
      __$$WorkAreaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'name_work_area') String name,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$WorkAreaModelImplCopyWithImpl<$Res>
    extends _$WorkAreaModelCopyWithImpl<$Res, _$WorkAreaModelImpl>
    implements _$$WorkAreaModelImplCopyWith<$Res> {
  __$$WorkAreaModelImplCopyWithImpl(
      _$WorkAreaModelImpl _value, $Res Function(_$WorkAreaModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$WorkAreaModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$WorkAreaModelImpl implements _WorkAreaModel {
  const _$WorkAreaModelImpl(
      {required this.id,
      @JsonKey(name: 'name_work_area') required this.name,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$WorkAreaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkAreaModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'name_work_area')
  final String name;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'WorkAreaModel(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkAreaModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, createdAt, updatedAt);

  /// Create a copy of WorkAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkAreaModelImplCopyWith<_$WorkAreaModelImpl> get copyWith =>
      __$$WorkAreaModelImplCopyWithImpl<_$WorkAreaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkAreaModelImplToJson(
      this,
    );
  }
}

abstract class _WorkAreaModel implements WorkAreaModel {
  const factory _WorkAreaModel(
          {required final int id,
          @JsonKey(name: 'name_work_area') required final String name,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$WorkAreaModelImpl;

  factory _WorkAreaModel.fromJson(Map<String, dynamic> json) =
      _$WorkAreaModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'name_work_area')
  String get name;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of WorkAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkAreaModelImplCopyWith<_$WorkAreaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
