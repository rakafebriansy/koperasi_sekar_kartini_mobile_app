import 'package:koperasi_sekar_kartini_mobile_app/app/models/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';

class FundModel {
  final int month;
  final int year;
  final double amount;
  final FundType fundType;
  final GroupModel group;

  FundModel({
    required this.month,
    required this.year,
    required this.amount,
    required this.fundType,
    required this.group,
  });

  factory FundModel.fromJson(Map<String, dynamic> json) {
    return FundModel(
      month: json['month'],
      year: json['year'],
      amount: (json['amount'] as num).toDouble(),
      fundType: FundType.fromJson(json['fund_type']),
      group: GroupModel.fromJson(json['group']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'month': month,
      'year': year,
      'amount': amount,
      'fundType': fundType.name,
      'group': group.toJson(),
    };
  }
}
