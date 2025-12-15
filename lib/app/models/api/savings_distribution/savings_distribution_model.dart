import 'package:freezed_annotation/freezed_annotation.dart';

part 'savings_distribution_model.freezed.dart';
part 'savings_distribution_model.g.dart';

@freezed
class SavingsDistributionModel with _$SavingsDistributionModel {
  const factory SavingsDistributionModel({
    required String type,
    @JsonKey(fromJson: _toDouble) required double total,
  }) = _SavingsDistributionModel;

  factory SavingsDistributionModel.fromJson(Map<String, dynamic> json) =>
      _$SavingsDistributionModelFromJson(json);
}

double _toDouble(dynamic value) {
  if (value == null) return 0;
  return double.parse(value.toString());
}
