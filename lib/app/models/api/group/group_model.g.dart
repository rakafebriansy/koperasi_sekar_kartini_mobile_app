// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupModelImpl _$$GroupModelImplFromJson(Map<String, dynamic> json) =>
    _$GroupModelImpl(
      id: (json['id'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      description: json['description'] as String?,
      sharedLiabilityFundAmount:
          (json['shared_liability_fund_amount'] as num?)?.toInt(),
      groupFundAmount: (json['group_fund_amount'] as num?)?.toInt(),
      socialFundAmount: (json['social_fund_amount'] as num?)?.toInt(),
      totalSharedLiabilityFund:
          (json['total_shared_liability_fund'] as num?)?.toInt(),
      totalGroupFund: (json['total_group_fund'] as num?)?.toInt(),
      totalSocialFund: (json['total_social_fund'] as num?)?.toInt(),
      isActive: json['is_active'] as bool?,
      workArea: json['work_area'] == null
          ? null
          : WorkAreaModel.fromJson(json['work_area'] as Map<String, dynamic>),
      chairman: json['chairman'] == null
          ? null
          : UserModel.fromJson(json['chairman'] as Map<String, dynamic>),
      facilitator: json['facilitator'] == null
          ? null
          : UserModel.fromJson(json['facilitator'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$GroupModelImplToJson(_$GroupModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'description': instance.description,
      'shared_liability_fund_amount': instance.sharedLiabilityFundAmount,
      'group_fund_amount': instance.groupFundAmount,
      'social_fund_amount': instance.socialFundAmount,
      'total_shared_liability_fund': instance.totalSharedLiabilityFund,
      'total_group_fund': instance.totalGroupFund,
      'total_social_fund': instance.totalSocialFund,
      'is_active': instance.isActive,
      'work_area': instance.workArea,
      'chairman': instance.chairman,
      'facilitator': instance.facilitator,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
