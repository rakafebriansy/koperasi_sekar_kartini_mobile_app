import 'package:koperasi_sekar_kartini_mobile_app/app/types/enum/role_enum.dart';

class UserModel {
  String? id;
  String name;
  RoleEnum role;

  UserModel({this.id, required this.name, required this.role});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      role: RoleEnum.fromString(json['role']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'role': this.role.value,
    };
  }
}
