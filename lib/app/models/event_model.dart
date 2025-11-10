import 'package:koperasi_sekar_kartini_mobile_app/app/models/user_model.dart';

class EventModel {
  String? id;
  final String title;
  final String description;
  final DateTime dateTime;
  final String location;
  final String? imageUrl;
  final UserModel user;

  EventModel({
    this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.location,
    this.imageUrl,
    required this.user,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      dateTime: DateTime.parse(json['date_time']),
      location: json['location'],
      imageUrl: json['image'],
      user: UserModel.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date_time': dateTime.toIso8601String(),
      'location': location,
      'image': imageUrl,
      'user': user.toJson(),
    };
  }
}
