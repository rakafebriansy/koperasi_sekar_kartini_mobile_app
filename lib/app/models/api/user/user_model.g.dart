// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      memberNumber: json['member_number'] as String?,
      identityNumber: json['identity_number'] as String?,
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      phoneNumber: json['phone_number'] as String?,
      address: json['address'] as String?,
      occupation: json['occupation'] as String?,
      identityCardPhoto: json['identity_card_photo'] as String?,
      selfPhoto: json['self_photo'] as String?,
      memberCardPhoto: json['member_card_photo'] as String?,
      emailVerifiedAt: json['email_verified_at'] == null
          ? null
          : DateTime.parse(json['email_verified_at'] as String),
      role: json['role'] as String,
      isVerified: json['is_verified'] as bool,
      isActive: json['is_active'] as bool,
      workArea: json['work_area'] == null
          ? null
          : WorkAreaModel.fromJson(json['work_area'] as Map<String, dynamic>),
      group: json['group'] == null
          ? null
          : GroupModel.fromJson(json['group'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'member_number': instance.memberNumber,
      'identity_number': instance.identityNumber,
      'birth_date': instance.birthDate?.toIso8601String(),
      'phone_number': instance.phoneNumber,
      'address': instance.address,
      'occupation': instance.occupation,
      'identity_card_photo': instance.identityCardPhoto,
      'self_photo': instance.selfPhoto,
      'member_card_photo': instance.memberCardPhoto,
      'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
      'role': instance.role,
      'is_verified': instance.isVerified,
      'is_active': instance.isActive,
      'work_area': instance.workArea,
      'group': instance.group,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
