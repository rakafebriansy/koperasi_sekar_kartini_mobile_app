class WorkAreaModel {
  final String id;
  final String districtName;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  WorkAreaModel({
    required this.id,
    required this.districtName,
    this.createdAt,
    this.updatedAt,
  });

  factory WorkAreaModel.fromJson(Map<String, dynamic> json) {
    return WorkAreaModel(
      id: json['id'],
      districtName: json['nama_kecamatan'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_kecamatan': districtName,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
