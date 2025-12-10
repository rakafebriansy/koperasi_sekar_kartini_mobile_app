import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

enum EventType {
  @JsonValue('group')
  group('Kelompok'),

  @JsonValue('coop')
  coop('Koperasi');

  final String displayName;
  const EventType(this.displayName);
}

@freezed
class EventModel with _$EventModel {
  const factory EventModel({
    required int id,
    required String name,
    required EventType type,
    required DateTime datetime,
    required String location,
    String? photo,
    String? description,
    GroupModel? group,
    required UserModel user,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _EventModel;

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
}
