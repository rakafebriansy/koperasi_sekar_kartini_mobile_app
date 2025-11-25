import 'package:get/get.dart';

import '../controllers/group_member_fund_list_controller.dart';

class GroupMemberFundListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupMemberFundListController>(
      () => GroupMemberFundListController(),
    );
  }
}
