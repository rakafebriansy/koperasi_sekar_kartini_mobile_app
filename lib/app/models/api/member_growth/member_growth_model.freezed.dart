// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_growth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MemberGrowthModel _$MemberGrowthModelFromJson(Map<String, dynamic> json) {
  return _MemberGrowthModel.fromJson(json);
}

/// @nodoc
mixin _$MemberGrowthModel {
  @JsonKey(fromJson: _toInt)
  int get year => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _toDouble)
  double get total => throw _privateConstructorUsedError;

  /// Serializes this MemberGrowthModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MemberGrowthModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemberGrowthModelCopyWith<MemberGrowthModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberGrowthModelCopyWith<$Res> {
  factory $MemberGrowthModelCopyWith(
          MemberGrowthModel value, $Res Function(MemberGrowthModel) then) =
      _$MemberGrowthModelCopyWithImpl<$Res, MemberGrowthModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _toInt) int year,
      @JsonKey(fromJson: _toDouble) double total});
}

/// @nodoc
class _$MemberGrowthModelCopyWithImpl<$Res, $Val extends MemberGrowthModel>
    implements $MemberGrowthModelCopyWith<$Res> {
  _$MemberGrowthModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemberGrowthModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemberGrowthModelImplCopyWith<$Res>
    implements $MemberGrowthModelCopyWith<$Res> {
  factory _$$MemberGrowthModelImplCopyWith(_$MemberGrowthModelImpl value,
          $Res Function(_$MemberGrowthModelImpl) then) =
      __$$MemberGrowthModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _toInt) int year,
      @JsonKey(fromJson: _toDouble) double total});
}

/// @nodoc
class __$$MemberGrowthModelImplCopyWithImpl<$Res>
    extends _$MemberGrowthModelCopyWithImpl<$Res, _$MemberGrowthModelImpl>
    implements _$$MemberGrowthModelImplCopyWith<$Res> {
  __$$MemberGrowthModelImplCopyWithImpl(_$MemberGrowthModelImpl _value,
      $Res Function(_$MemberGrowthModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemberGrowthModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? total = null,
  }) {
    return _then(_$MemberGrowthModelImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberGrowthModelImpl implements _MemberGrowthModel {
  const _$MemberGrowthModelImpl(
      {@JsonKey(fromJson: _toInt) required this.year,
      @JsonKey(fromJson: _toDouble) required this.total});

  factory _$MemberGrowthModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberGrowthModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _toInt)
  final int year;
  @override
  @JsonKey(fromJson: _toDouble)
  final double total;

  @override
  String toString() {
    return 'MemberGrowthModel(year: $year, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberGrowthModelImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, year, total);

  /// Create a copy of MemberGrowthModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberGrowthModelImplCopyWith<_$MemberGrowthModelImpl> get copyWith =>
      __$$MemberGrowthModelImplCopyWithImpl<_$MemberGrowthModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberGrowthModelImplToJson(
      this,
    );
  }
}

abstract class _MemberGrowthModel implements MemberGrowthModel {
  const factory _MemberGrowthModel(
          {@JsonKey(fromJson: _toInt) required final int year,
          @JsonKey(fromJson: _toDouble) required final double total}) =
      _$MemberGrowthModelImpl;

  factory _MemberGrowthModel.fromJson(Map<String, dynamic> json) =
      _$MemberGrowthModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _toInt)
  int get year;
  @override
  @JsonKey(fromJson: _toDouble)
  double get total;

  /// Create a copy of MemberGrowthModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemberGrowthModelImplCopyWith<_$MemberGrowthModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
