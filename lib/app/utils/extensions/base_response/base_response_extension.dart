import 'package:koperasi_sekar_kartini_mobile_app/app/data/remote/base_response/base_response.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';

extension BaseResponseExtension on BaseResponse {
  UserModel? get userData {
    if (data == null) return null;
    return UserModel.fromJson(data as Map<String, dynamic>);
  }

  GroupModel? get groupData {
    if (data == null) return null;
    return GroupModel.fromJson(data as Map<String, dynamic>);
  }
}
