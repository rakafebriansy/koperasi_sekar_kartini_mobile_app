class RegionModel {
  String? id;
  String name;

  RegionModel({required this.name, this.id});
  factory RegionModel.fromJson(Map<String, dynamic> json) {
    return RegionModel(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': this.id, 'name': this.name};
  }
}
