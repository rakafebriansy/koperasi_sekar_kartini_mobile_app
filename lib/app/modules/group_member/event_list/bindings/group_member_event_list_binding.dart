import 'package:get/get.dart';

import '../controllers/group_member_event_list_controller.dart';

class GroupMemberEventListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupMemberEventListController>(
      () => GroupMemberEventListController(),
    );
  }
}
