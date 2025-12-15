// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'savings_distribution_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SavingsDistributionModel _$SavingsDistributionModelFromJson(
    Map<String, dynamic> json) {
  return _SavingsDistributionModel.fromJson(json);
}

/// @nodoc
mixin _$SavingsDistributionModel {
  String get type => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _toDouble)
  double get total => throw _privateConstructorUsedError;

  /// Serializes this SavingsDistributionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SavingsDistributionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavingsDistributionModelCopyWith<SavingsDistributionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavingsDistributionModelCopyWith<$Res> {
  factory $SavingsDistributionModelCopyWith(SavingsDistributionModel value,
          $Res Function(SavingsDistributionModel) then) =
      _$SavingsDistributionModelCopyWithImpl<$Res, SavingsDistributionModel>;
  @useResult
  $Res call({String type, @JsonKey(fromJson: _toDouble) double total});
}

/// @nodoc
class _$SavingsDistributionModelCopyWithImpl<$Res,
        $Val extends SavingsDistributionModel>
    implements $SavingsDistributionModelCopyWith<$Res> {
  _$SavingsDistributionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavingsDistributionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SavingsDistributionModelImplCopyWith<$Res>
    implements $SavingsDistributionModelCopyWith<$Res> {
  factory _$$SavingsDistributionModelImplCopyWith(
          _$SavingsDistributionModelImpl value,
          $Res Function(_$SavingsDistributionModelImpl) then) =
      __$$SavingsDistributionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, @JsonKey(fromJson: _toDouble) double total});
}

/// @nodoc
class __$$SavingsDistributionModelImplCopyWithImpl<$Res>
    extends _$SavingsDistributionModelCopyWithImpl<$Res,
        _$SavingsDistributionModelImpl>
    implements _$$SavingsDistributionModelImplCopyWith<$Res> {
  __$$SavingsDistributionModelImplCopyWithImpl(
      _$SavingsDistributionModelImpl _value,
      $Res Function(_$SavingsDistributionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SavingsDistributionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? total = null,
  }) {
    return _then(_$SavingsDistributionModelImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavingsDistributionModelImpl implements _SavingsDistributionModel {
  const _$SavingsDistributionModelImpl(
      {required this.type, @JsonKey(fromJson: _toDouble) required this.total});

  factory _$SavingsDistributionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavingsDistributionModelImplFromJson(json);

  @override
  final String type;
  @override
  @JsonKey(fromJson: _toDouble)
  final double total;

  @override
  String toString() {
    return 'SavingsDistributionModel(type: $type, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavingsDistributionModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, total);

  /// Create a copy of SavingsDistributionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavingsDistributionModelImplCopyWith<_$SavingsDistributionModelImpl>
      get copyWith => __$$SavingsDistributionModelImplCopyWithImpl<
          _$SavingsDistributionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavingsDistributionModelImplToJson(
      this,
    );
  }
}

abstract class _SavingsDistributionModel implements SavingsDistributionModel {
  const factory _SavingsDistributionModel(
          {required final String type,
          @JsonKey(fromJson: _toDouble) required final double total}) =
      _$SavingsDistributionModelImpl;

  factory _SavingsDistributionModel.fromJson(Map<String, dynamic> json) =
      _$SavingsDistributionModelImpl.fromJson;

  @override
  String get type;
  @override
  @JsonKey(fromJson: _toDouble)
  double get total;

  /// Create a copy of SavingsDistributionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavingsDistributionModelImplCopyWith<_$SavingsDistributionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
