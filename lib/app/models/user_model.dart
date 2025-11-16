import 'package:koperasi_sekar_kartini_mobile_app/app/types/enum/role_enum.dart';

class UserModel {
  final String id;
  final String name;
  final String nomorAnggota;
  final RoleEnum role;
  final String? fileKartuTandaAnggota;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.role,
    this.fileKartuTandaAnggota,
    required this.nomorAnggota,
    required this.createdAt,
    required this.updatedAt,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      nomorAnggota: json['nomor_anggota'],
      fileKartuTandaAnggota: json['file_kartu_tanda_anggota'],
      role: RoleEnum.fromString(json['role']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'nomor_anggota': nomorAnggota,
      'role': this.role.value,
      'file_kartu_tanda_anggota': fileKartuTandaAnggota,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
