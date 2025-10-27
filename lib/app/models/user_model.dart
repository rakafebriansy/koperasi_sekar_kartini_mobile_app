import 'package:koperasi_sekar_kartini_mobile_app/app/types/enum/role_enum.dart';

class UserModel {
  String id;
  String namaLengkap;
  RoleEnum role;

  UserModel({required this.id, required this.namaLengkap, required this.role});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      namaLengkap: json['nama_lengkap'],
      role: RoleEnum.fromString(json['role']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'nama_lengkap': this.namaLengkap,
      'role': this.role.value,
    };
  }
}
