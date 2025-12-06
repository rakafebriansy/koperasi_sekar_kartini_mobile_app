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
        int? sharedLiabilityFundAmount,
    @JsonKey(name: 'group_fund_amount') int? groupFundAmount,
    @JsonKey(name: 'social_fund_amount') int? socialFundAmount,
    @JsonKey(name: 'total_shared_liability_fund')
        int? totalSharedLiabilityFund,
    @JsonKey(name: 'total_group_fund') int? totalGroupFund,
    @JsonKey(name: 'total_social_fund') int? totalSocialFund,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'work_area') WorkAreaModel? workArea,
    @JsonKey(name: 'chairman') UserModel? chairman,
    @JsonKey(name: 'facilitator') UserModel? facilitator,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _GroupModel;

  factory GroupModel.fromJson(Map<String, dynamic> json) =>
      _$GroupModelFromJson(json);
}
