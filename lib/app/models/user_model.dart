import 'package:koperasi_sekar_kartini_mobile_app/app/types/enum/role_enum.dart';

class UserModel {
  final String id;
  final String name;
  final String nationalId;
  final String phone;
  final DateTime birthDate;
  final String address;
  final String job;
  final String? email;
  final RoleEnum role;
  final String? idCard;
  final String? photo;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.role,
    this.idCard,
    this.photo,
    required this.nationalId,
    required this.phone,
    required this.birthDate,
    required this.address,
    required this.job,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      nationalId: json['national_id'],
      phone: json['phone'],
      idCard: json['id_card'],
      photo: json['photo'],
      address: json['address'],
      job: json['job'],
      email: json['email'],
      birthDate: json['birth_ate'],
      role: RoleEnum.fromString(json['role']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'national_id': nationalId,
      'phone': phone,
      'address': address,
      'job': job,
      'email': email,
      'role': role.value,
      'birth_date': birthDate,
      'id_card': idCard,
      'photo': photo,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
