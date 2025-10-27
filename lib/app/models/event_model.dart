import 'package:koperasi_sekar_kartini_mobile_app/app/models/user_model.dart';

class EventModel {
  final String id;
  final String name;
  final String description;
  final DateTime dateTime;
  final String location;
  final UserModel user;

  EventModel({
    required this.id,
    required this.name,
    required this.description,
    required this.dateTime,
    required this.location,
    required this.user,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      dateTime: DateTime.parse(json['date_time']),
      location: json['location'],
      user: UserModel.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'date_time': dateTime.toIso8601String(),
      'location': location,
      'user': user.toJson(),
    };
  }
}
