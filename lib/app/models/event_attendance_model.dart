import 'package:koperasi_sekar_kartini_mobile_app/app/models/event_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/types/enum/attendance_status_enum.dart';

class EventAttendanceModel {
  final int id;
  final UserModel user;
  final EventModel event;
  final AttendanceStatusEnum attendance;
  final DateTime createdAt;
  final DateTime updatedAt;

  EventAttendanceModel({
    required this.id,
    required this.event,
    required this.user,
    required this.attendance,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EventAttendanceModel.fromJson(Map<String, dynamic> json) {
    return EventAttendanceModel(
      id: json['id'],
      event: EventModel.fromJson(json['event']),
      user: UserModel.fromJson(json['user']),
      attendance: AttendanceStatusEnum.fromString(json['is_attend']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'event': event.toJson(),
      'is_attend': attendance.value,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
