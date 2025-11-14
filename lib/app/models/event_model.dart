import 'package:koperasi_sekar_kartini_mobile_app/app/models/user_model.dart';

class EventModel {
  String? id;
  final String title;
  final String description;
  final DateTime dateTime;
  final String location;
  final String? image;
  final UserModel user;
  final DateTime createdAt;
  final DateTime updatedAt;

  EventModel({
    this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.location,
    this.image,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      dateTime: DateTime.parse(json['date_time']),
      location: json['location'],
      image: json['image'],
      user: UserModel.fromJson(json['user']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date_time': dateTime.toIso8601String(),
      'location': location,
      'image': image,
      'user': user.toJson(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
