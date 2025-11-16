import 'package:get/get.dart';

import '../controllers/group_member_main_tabs_profile_controller.dart';

class GroupMemberMainTabsProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupMemberMainTabsProfileController>(
      () => GroupMemberMainTabsProfileController(),
    );
  }
}
