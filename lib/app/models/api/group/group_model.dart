import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/work_area/work_area_model.dart';

part 'group_model.freezed.dart';
part 'group_model.g.dart';

@freezed
class GroupModel with _$GroupModel {
  const factory GroupModel({
    required int id,
    required int number,
    String? description,
    @JsonKey(name: 'shared_liability_fund_amount')
    required int sharedLiabilityFundAmount,
    @JsonKey(name: 'group_fund_amount') required int groupFundAmount,
    @JsonKey(name: 'social_fund_amount') required int socialFundAmount,
    @JsonKey(name: 'work_area') required WorkAreaModel workArea,
    @JsonKey(name: 'chairman') UserModel? chairman,
    @JsonKey(name: 'facilitator') UserModel? facilitator,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _GroupModel;

  factory GroupModel.fromJson(Map<String, dynamic> json) =>
      _$GroupModelFromJson(json);
}
