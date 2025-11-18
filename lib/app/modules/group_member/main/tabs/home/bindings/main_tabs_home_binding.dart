import 'package:get/get.dart';

import '../controllers/group_member_main_tabs_home_controller.dart';

class GroupMemberMainTabsHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupMemberMainTabsHomeController>(
      () => GroupMemberMainTabsHomeController(),
    );
  }
}
