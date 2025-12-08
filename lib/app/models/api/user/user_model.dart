import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/work_area/work_area_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String name,
    @JsonKey(name: 'member_number') String? memberNumber,
    @JsonKey(name: 'identity_number') String? identityNumber,
    @JsonKey(name: 'birth_date') DateTime? birthDate,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    String? address,
    String? occupation,
    @JsonKey(name: 'identity_card_photo') String? identityCardPhoto,
    @JsonKey(name: 'self_photo') String? selfPhoto,
    @JsonKey(name: 'member_card_photo') String? memberCardPhoto,
    @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
    required String role,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'work_area') WorkAreaModel? workArea,
    GroupModel? group,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
