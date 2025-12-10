import 'package:freezed_annotation/freezed_annotation.dart';

part 'savings_model.freezed.dart';
part 'savings_model.g.dart';

enum SavingType {
  @JsonValue('simpanan_pokok')
  simpananPokok('Simpanan Pokok'),

  @JsonValue('simpanan_wajib')
  simpananWajib('Simpanan Wajib'),

  @JsonValue('simpanan_wajib_khusus')
  simpananWajibKhusus('Simpanan Wajib Khusus'),

  @JsonValue('simpanan_sukarela')
  simpananSukarela('Simpanan Sukarela'),

  @JsonValue('simpanan_bersama')
  simpananBersama('Simpanan Bersama'),

  @JsonValue('simpanan_berjangka')
  simpananBerjangka('Simpanan Berjangka'),

  @JsonValue('simpanan_hari_raya')
  simpananHariRaya('Simpanan Hari Raya'),

  @JsonValue('simpanan_hari_tua')
  simpananHariTua('Simpanan Hari Tua'),

  @JsonValue('simpanan_rekreasi')
  simpananRekreasi('Simpanan Rekreasi');

  final String displayName;
  const SavingType(this.displayName);

  String get snakeCase {
    switch (this) {
      case SavingType.simpananPokok:
        return 'simpanan_pokok';
      case SavingType.simpananWajib:
        return 'simpanan_wajib';
      case SavingType.simpananWajibKhusus:
        return 'simpanan_wajib_khusus';
      case SavingType.simpananSukarela:
        return 'simpanan_sukarela';
      case SavingType.simpananBersama:
        return 'simpanan_bersama';
      case SavingType.simpananBerjangka:
        return 'simpanan_berjangka';
      case SavingType.simpananHariRaya:
        return 'simpanan_hari_raya';
      case SavingType.simpananHariTua:
        return 'simpanan_hari_tua';
      case SavingType.simpananRekreasi:
        return 'simpanan_rekreasi';
    }
  }
}

@freezed
class SavingsModel with _$SavingsModel {
  const SavingsModel._();

  const factory SavingsModel({
    required int id,
    required SavingType type,
    required int nominal,
    required int year,
    required int month,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _SavingsModel;

  DateTime get periodDate => DateTime(year, month, 1);

  factory SavingsModel.fromJson(Map<String, dynamic> json) =>
      _$SavingsModelFromJson(json);
}
