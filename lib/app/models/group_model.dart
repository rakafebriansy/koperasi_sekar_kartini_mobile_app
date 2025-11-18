import 'package:koperasi_sekar_kartini_mobile_app/app/models/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/work_area_model.dart';

class GroupModel {
  final String id;
  final String number;
  final String regulation;
  final int jointLiabilityFundAmount;
  final int groupFundAmount;
  final int socialFundAmount;
  final int totalJointLiabilityFund;
  final int totalGroupFund;
  final int totalSocialFund;
  final bool isActive;

  final WorkAreaModel workArea;

  final UserModel? chairman;
  final UserModel? facilitator;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  GroupModel({
    required this.id,
    required this.number,
    required this.regulation,
    required this.jointLiabilityFundAmount,
    required this.groupFundAmount,
    required this.socialFundAmount,
    required this.totalJointLiabilityFund,
    required this.totalGroupFund,
    required this.totalSocialFund,
    required this.isActive,
    required this.workArea,
    this.chairman,
    this.facilitator,
    this.createdAt,
    this.updatedAt,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      id: json['id'],
      number: json['number'],
      regulation: json['regulation'],
      jointLiabilityFundAmount: json['joint_liability_fund_amount'],
      groupFundAmount: json['group_fund_amount'],
      socialFundAmount: json['social_fund_amount'],
      totalJointLiabilityFund: json['total_joint_liability_fund'],
      totalGroupFund: json['total_group_fund'],
      totalSocialFund: json['total_social_fund'],
      isActive: json['is_active'],
      workArea: WorkAreaModel.fromJson(json['work_area']),
      chairman: json['chairman'] != null
          ? UserModel.fromJson(json['chairman'])
          : null,
      facilitator: json['facilitator'] != null
          ? UserModel.fromJson(json['facilitator'])
          : null,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'number': number,
      'regulation': regulation,
      'joint_liability_fund_amount': jointLiabilityFundAmount,
      'group_fund_amount': groupFundAmount,
      'social_fund_amount': socialFundAmount,
      'total_joint_liability_fund': totalJointLiabilityFund,
      'total_group_fund': totalGroupFund,
      'total_social_fund': totalSocialFund,
      'is_active': isActive,
      'work_area': workArea.toJson(),
      'chairman': chairman?.toJson(),
      'facilitator': facilitator?.toJson(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
