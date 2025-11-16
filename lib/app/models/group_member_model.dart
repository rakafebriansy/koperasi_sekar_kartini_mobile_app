import 'package:koperasi_sekar_kartini_mobile_app/app/models/user_model.dart';

class GroupMemberModel {
  final String id;
  final bool isActive;
  final String note;
  final UserModel user;
  final String group;
  final DateTime createdAt;
  final DateTime updatedAt;

  GroupMemberModel({
    required this.id,
    required this.isActive,
    required this.note,
    required this.user,
    required this.group,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GroupMemberModel.fromJson(Map<String, dynamic> json) {
    return GroupMemberModel(
      id: json['id'],
      isActive: json['is_active'],
      note: json['note'],
      user: UserModel.fromJson(json['user']),
      group: json['group'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'is_active': isActive,
      'note': note,
      'user': user.toJson(),
      'group': group,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
