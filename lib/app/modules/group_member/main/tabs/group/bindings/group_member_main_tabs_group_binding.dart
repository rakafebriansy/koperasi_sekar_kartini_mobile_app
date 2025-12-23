import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/group_member_main_tabs_group_controller.dart';

class GroupMemberMainTabsGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupMemberMainTabsGroupController>(
      () => GroupMemberMainTabsGroupController(
        apiHelper: Get.find<ApiHelper>(),
        authController: Get.find<AuthController>(),
      ),
    );
  }
}
