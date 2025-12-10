// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoanModelImpl _$$LoanModelImplFromJson(Map<String, dynamic> json) =>
    _$LoanModelImpl(
      id: (json['id'] as num).toInt(),
      type: $enumDecode(_$LoanTypeEnumMap, json['type']),
      status: $enumDecode(_$LoanStatusEnumMap, json['status']),
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

Map<String, dynamic> _$$LoanModelImplToJson(_$LoanModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$LoanTypeEnumMap[instance.type]!,
      'status': _$LoanStatusEnumMap[instance.status]!,
      'nominal': instance.nominal,
      'year': instance.year,
      'month': instance.month,
      'user': instance.user,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$LoanTypeEnumMap = {
  LoanType.pinjamanBiasa: 'pinjaman_biasa',
  LoanType.pinjamanPengadaanBarang: 'pinjaman_pengadaan_barang',
  LoanType.pinjamanBbm: 'pinjaman_bbm',
  LoanType.pinjamanBahanPokok: 'pinjaman_bahan_pokok',
  LoanType.pinjamanBarangDagangan: 'pinjaman_barang_dagangan',
  LoanType.pinjamanLebaran: 'pinjaman_lebaran',
  LoanType.pinjamanRekreasi: 'pinjaman_rekreasi',
  LoanType.pinjamanSpesial: 'pinjaman_spesial',
};

const _$LoanStatusEnumMap = {
  LoanStatus.unpaid: 'unpaid',
  LoanStatus.paid: 'paid',
};
