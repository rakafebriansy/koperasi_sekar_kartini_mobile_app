import 'package:get/get.dart';

import '../controllers/group_member_savings_list_controller.dart';

class GroupMemberSavingsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupMemberSavingsListController>(
      () => GroupMemberSavingsListController(),
    );
  }
}
