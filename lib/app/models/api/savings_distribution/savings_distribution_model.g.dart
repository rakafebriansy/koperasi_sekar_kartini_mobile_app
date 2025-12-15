// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savings_distribution_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavingsDistributionModelImpl _$$SavingsDistributionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SavingsDistributionModelImpl(
      type: json['type'] as String,
      total: _toDouble(json['total']),
    );

Map<String, dynamic> _$$SavingsDistributionModelImplToJson(
        _$SavingsDistributionModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'total': instance.total,
    };
