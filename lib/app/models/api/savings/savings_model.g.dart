// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavingsModelImpl _$$SavingsModelImplFromJson(Map<String, dynamic> json) =>
    _$SavingsModelImpl(
      id: (json['id'] as num).toInt(),
      type: $enumDecode(_$SavingsTypeEnumMap, json['type']),
      nominal: (json['nominal'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      month: (json['month'] as num).toInt(),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
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
      'type': _$SavingsTypeEnumMap[instance.type]!,
      'nominal': instance.nominal,
      'year': instance.year,
      'month': instance.month,
      'user': instance.user,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$SavingsTypeEnumMap = {
  SavingsType.simpananPokok: 'simpanan_pokok',
  SavingsType.simpananWajib: 'simpanan_wajib',
  SavingsType.simpananWajibKhusus: 'simpanan_wajib_khusus',
  SavingsType.simpananSukarela: 'simpanan_sukarela',
  SavingsType.simpananBersama: 'simpanan_bersama',
  SavingsType.simpananBerjangka: 'simpanan_berjangka',
  SavingsType.simpananHariRaya: 'simpanan_hari_raya',
  SavingsType.simpananHariTua: 'simpanan_hari_tua',
  SavingsType.simpananRekreasi: 'simpanan_rekreasi',
};
