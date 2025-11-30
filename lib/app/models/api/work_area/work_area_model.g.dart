// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_area_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkAreaModelImpl _$$WorkAreaModelImplFromJson(Map<String, dynamic> json) =>
    _$WorkAreaModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name_work_area'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$WorkAreaModelImplToJson(_$WorkAreaModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_work_area': instance.name,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
