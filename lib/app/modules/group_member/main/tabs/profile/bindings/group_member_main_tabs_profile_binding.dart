import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/group_member_main_tabs_profile_controller.dart';

class GroupMemberMainTabsProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupMemberMainTabsProfileController>(
      () => GroupMemberMainTabsProfileController(
        apiHelper: Get.find<ApiHelper>(),
        authController: Get.find<AuthController>(),
      ),
    );
  }
}
