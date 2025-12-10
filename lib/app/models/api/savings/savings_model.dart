import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';

part 'savings_model.freezed.dart';
part 'savings_model.g.dart';

enum SavingsType {
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
  const SavingsType(this.displayName);

  String get snakeCase {
    switch (this) {
      case SavingsType.simpananPokok:
        return 'simpanan_pokok';
      case SavingsType.simpananWajib:
        return 'simpanan_wajib';
      case SavingsType.simpananWajibKhusus:
        return 'simpanan_wajib_khusus';
      case SavingsType.simpananSukarela:
        return 'simpanan_sukarela';
      case SavingsType.simpananBersama:
        return 'simpanan_bersama';
      case SavingsType.simpananBerjangka:
        return 'simpanan_berjangka';
      case SavingsType.simpananHariRaya:
        return 'simpanan_hari_raya';
      case SavingsType.simpananHariTua:
        return 'simpanan_hari_tua';
      case SavingsType.simpananRekreasi:
        return 'simpanan_rekreasi';
    }
  }
}

@freezed
class SavingsModel with _$SavingsModel {
  const SavingsModel._();

  const factory SavingsModel({
    required int id,
    required SavingsType type,
    required int nominal,
    required int year,
    required int month,
    @JsonKey(name: 'user') required UserModel user,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _SavingsModel;

  DateTime get periodDate => DateTime(year, month, 1);

  factory SavingsModel.fromJson(Map<String, dynamic> json) =>
      _$SavingsModelFromJson(json);
}
