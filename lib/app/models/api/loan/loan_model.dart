import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';

part 'loan_model.freezed.dart';
part 'loan_model.g.dart';

enum LoanType {
  @JsonValue('pinjaman_biasa')
  pinjamanBiasa('Pinjaman Biasa'),

  @JsonValue('pinjaman_pengadaan_barang')
  pinjamanPengadaanBarang('Pinjaman Pengadaan Barang'),

  @JsonValue('pinjaman_bbm')
  pinjamanBbm('Pinjaman BBM'),

  @JsonValue('pinjaman_bahan_pokok')
  pinjamanBahanPokok('Pinjaman Bahan Pokok'),

  @JsonValue('pinjaman_barang_dagangan')
  pinjamanBarangDagangan('Pinjaman Barang Dagangan'),

  @JsonValue('pinjaman_lebaran')
  pinjamanLebaran('Pinjaman Lebaran'),

  @JsonValue('pinjaman_rekreasi')
  pinjamanRekreasi('Pinjaman Rekreasi'),

  @JsonValue('pinjaman_spesial')
  pinjamanSpesial('Pinjaman Spesial');

  final String displayName;
  const LoanType(this.displayName);

  String get snakeCase {
    switch (this) {
      case LoanType.pinjamanBiasa:
        return 'pinjaman_biasa';
      case LoanType.pinjamanPengadaanBarang:
        return 'pinjaman_pengadaan_barang';
      case LoanType.pinjamanBbm:
        return 'pinjaman_bbm';
      case LoanType.pinjamanBahanPokok:
        return 'pinjaman_bahan_pokok';
      case LoanType.pinjamanBarangDagangan:
        return 'pinjaman_barang_dagangan';
      case LoanType.pinjamanLebaran:
        return 'pinjaman_lebaran';
      case LoanType.pinjamanRekreasi:
        return 'pinjaman_rekreasi';
      case LoanType.pinjamanSpesial:
        return 'pinjaman_spesial';
    }
  }

}

enum LoanStatus {
  @JsonValue('unpaid')
  unpaid('Belum dibayar'),

  @JsonValue('paid')
  paid('Dibayar');

  final String displayName;
  const LoanStatus(this.displayName);
}

@freezed
class LoanModel with _$LoanModel {
  const LoanModel._();

  const factory LoanModel({
    required int id,
    required LoanType type,
    required LoanStatus status,
    required int nominal,
    required int year,
    required int month,
    @JsonKey(name: 'user') required UserModel user,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _LoanModel;

  DateTime get periodDate => DateTime(year, month, 1);

  factory LoanModel.fromJson(Map<String, dynamic> json) =>
      _$LoanModelFromJson(json);
}
