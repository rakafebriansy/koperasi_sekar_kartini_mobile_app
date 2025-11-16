import 'package:get/get.dart';

import '../controllers/group_member_main_tabs_group_controller.dart';

class GroupMemberMainTabsGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupMemberMainTabsGroupController>(
      () => GroupMemberMainTabsGroupController(),
    );
  }
}
