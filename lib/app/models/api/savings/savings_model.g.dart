// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavingsModelImpl _$$SavingsModelImplFromJson(Map<String, dynamic> json) =>
    _$SavingsModelImpl(
      id: (json['id'] as num).toInt(),
      type: $enumDecode(_$SavingTypeEnumMap, json['type']),
      nominal: (json['nominal'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      month: (json['month'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$SavingsModelImplToJson(_$SavingsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$SavingTypeEnumMap[instance.type]!,
      'nominal': instance.nominal,
      'year': instance.year,
      'month': instance.month,
      'user_id': instance.userId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$SavingTypeEnumMap = {
  SavingType.simpananPokok: 'simpanan_pokok',
  SavingType.simpananWajib: 'simpanan_wajib',
  SavingType.simpananWajibKhusus: 'simpanan_wajib_khusus',
  SavingType.simpananSukarela: 'simpanan_sukarela',
  SavingType.simpananBersama: 'simpanan_bersama',
  SavingType.simpananBerjangka: 'simpanan_berjangka',
  SavingType.simpananHariRaya: 'simpanan_hari_raya',
  SavingType.simpananHariTua: 'simpanan_hari_tua',
  SavingType.simpananRekreasi: 'simpanan_rekreasi',
};
