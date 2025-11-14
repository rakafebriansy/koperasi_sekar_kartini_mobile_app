import 'package:koperasi_sekar_kartini_mobile_app/app/models/user_model.dart';

class GroupMemberModel {
  final String id;
  final String nomorAnggota;
  final bool statusAktif;
  final String? fileKartuTandaAnggota;
  final String catatan;
  final UserModel user;
  final String idKelompok;
  final DateTime createdAt;
  final DateTime updatedAt;

  GroupMemberModel({
    required this.id,
    required this.nomorAnggota,
    required this.statusAktif,
    this.fileKartuTandaAnggota,
    required this.catatan,
    required this.user,
    required this.idKelompok,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GroupMemberModel.fromJson(Map<String, dynamic> json) {
    return GroupMemberModel(
      id: json['id'],
      nomorAnggota: json['nomor_anggota'],
      statusAktif: json['status_aktif'] == 1 || json['status_aktif'] == true,
      fileKartuTandaAnggota: json['file_kartu_tanda_anggota'],
      catatan: json['catatan'],
      user: UserModel.fromJson(json['user']),
      idKelompok: json['id_kelompok'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomor_anggota': nomorAnggota,
      'status_aktif': statusAktif,
      'file_kartu_tanda_anggota': fileKartuTandaAnggota,
      'catatan': catatan,
      'user': user.toJson(),
      'id_kelompok': idKelompok,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
