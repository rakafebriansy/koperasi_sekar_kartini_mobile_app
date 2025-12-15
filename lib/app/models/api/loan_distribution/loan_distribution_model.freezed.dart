// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loan_distribution_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoanDistributionModel _$LoanDistributionModelFromJson(
    Map<String, dynamic> json) {
  return _LoanDistributionModel.fromJson(json);
}

/// @nodoc
mixin _$LoanDistributionModel {
  String get type => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _toDouble)
  double get total => throw _privateConstructorUsedError;

  /// Serializes this LoanDistributionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoanDistributionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoanDistributionModelCopyWith<LoanDistributionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoanDistributionModelCopyWith<$Res> {
  factory $LoanDistributionModelCopyWith(LoanDistributionModel value,
          $Res Function(LoanDistributionModel) then) =
      _$LoanDistributionModelCopyWithImpl<$Res, LoanDistributionModel>;
  @useResult
  $Res call({String type, @JsonKey(fromJson: _toDouble) double total});
}

/// @nodoc
class _$LoanDistributionModelCopyWithImpl<$Res,
        $Val extends LoanDistributionModel>
    implements $LoanDistributionModelCopyWith<$Res> {
  _$LoanDistributionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoanDistributionModel
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
abstract class _$$LoanDistributionModelImplCopyWith<$Res>
    implements $LoanDistributionModelCopyWith<$Res> {
  factory _$$LoanDistributionModelImplCopyWith(
          _$LoanDistributionModelImpl value,
          $Res Function(_$LoanDistributionModelImpl) then) =
      __$$LoanDistributionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, @JsonKey(fromJson: _toDouble) double total});
}

/// @nodoc
class __$$LoanDistributionModelImplCopyWithImpl<$Res>
    extends _$LoanDistributionModelCopyWithImpl<$Res,
        _$LoanDistributionModelImpl>
    implements _$$LoanDistributionModelImplCopyWith<$Res> {
  __$$LoanDistributionModelImplCopyWithImpl(_$LoanDistributionModelImpl _value,
      $Res Function(_$LoanDistributionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoanDistributionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? total = null,
  }) {
    return _then(_$LoanDistributionModelImpl(
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
class _$LoanDistributionModelImpl implements _LoanDistributionModel {
  const _$LoanDistributionModelImpl(
      {required this.type, @JsonKey(fromJson: _toDouble) required this.total});

  factory _$LoanDistributionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoanDistributionModelImplFromJson(json);

  @override
  final String type;
  @override
  @JsonKey(fromJson: _toDouble)
  final double total;

  @override
  String toString() {
    return 'LoanDistributionModel(type: $type, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoanDistributionModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, total);

  /// Create a copy of LoanDistributionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoanDistributionModelImplCopyWith<_$LoanDistributionModelImpl>
      get copyWith => __$$LoanDistributionModelImplCopyWithImpl<
          _$LoanDistributionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoanDistributionModelImplToJson(
      this,
    );
  }
}

abstract class _LoanDistributionModel implements LoanDistributionModel {
  const factory _LoanDistributionModel(
          {required final String type,
          @JsonKey(fromJson: _toDouble) required final double total}) =
      _$LoanDistributionModelImpl;

  factory _LoanDistributionModel.fromJson(Map<String, dynamic> json) =
      _$LoanDistributionModelImpl.fromJson;

  @override
  String get type;
  @override
  @JsonKey(fromJson: _toDouble)
  double get total;

  /// Create a copy of LoanDistributionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoanDistributionModelImplCopyWith<_$LoanDistributionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
