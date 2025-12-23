import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/manage_group_member_profile_controller.dart';

class ManageGroupMemberProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageGroupMemberProfileController>(
      () => ManageGroupMemberProfileController(apiHelper: Get.find<ApiHelper>()),
    );
  }
}
