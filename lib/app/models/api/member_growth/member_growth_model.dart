import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_growth_model.freezed.dart';
part 'member_growth_model.g.dart';

@freezed
class MemberGrowthModel with _$MemberGrowthModel {
  const factory MemberGrowthModel({
    @JsonKey(fromJson: _toInt) required int year,
    @JsonKey(fromJson: _toDouble) required double total,
  }) = _MemberGrowthModel;

  factory MemberGrowthModel.fromJson(Map<String, dynamic> json) =>
      _$MemberGrowthModelFromJson(json);
}

int _toInt(dynamic value) {
  if (value == null) return 0;
  return int.parse(value.toString());
}

double _toDouble(dynamic value) {
  if (value == null) return 0.0;
  return double.parse(value.toString());
}
