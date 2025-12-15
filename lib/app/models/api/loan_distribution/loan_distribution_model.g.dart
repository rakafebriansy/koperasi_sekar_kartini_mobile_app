// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_distribution_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoanDistributionModelImpl _$$LoanDistributionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LoanDistributionModelImpl(
      type: json['type'] as String,
      total: _toDouble(json['total']),
    );

Map<String, dynamic> _$$LoanDistributionModelImplToJson(
        _$LoanDistributionModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'total': instance.total,
    };
