import 'package:freezed_annotation/freezed_annotation.dart';

part 'loan_distribution_model.freezed.dart';
part 'loan_distribution_model.g.dart';

@freezed
class LoanDistributionModel with _$LoanDistributionModel {
  const factory LoanDistributionModel({
    required String type,
    @JsonKey(fromJson: _toDouble) required double total,
  }) = _LoanDistributionModel;

  factory LoanDistributionModel.fromJson(Map<String, dynamic> json) =>
      _$LoanDistributionModelFromJson(json);
}

double _toDouble(dynamic value) {
  if (value == null) return 0;
  return double.parse(value.toString());
}
