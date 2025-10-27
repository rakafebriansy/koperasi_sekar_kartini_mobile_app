import 'package:koperasi_sekar_kartini_mobile_app/app/models/event_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/types/enum/attendance_status_enum.dart';

class EventAttendanceModel {
  final String id;
  final UserModel user;
  final EventModel event;
  final AttendanceStatusEnum attendance;

  EventAttendanceModel({
    required this.id,
    required this.event,
    required this.user,
    required this.attendance,
  });

  factory EventAttendanceModel.fromJson(Map<String, dynamic> json) {
    return EventAttendanceModel(
      id: json['id'],
      event: EventModel.fromJson(json['event']),
      user: UserModel.fromJson(json['user']),
      attendance: AttendanceStatusEnum.fromString(json['is_attend']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'event': event.toJson(),
      'is_attend': attendance.value,
    };
  }
}
