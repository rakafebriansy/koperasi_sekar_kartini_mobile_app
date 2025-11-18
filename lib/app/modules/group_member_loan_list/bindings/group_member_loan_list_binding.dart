import 'package:get/get.dart';

import '../controllers/group_member_loan_list_controller.dart';

class GroupMemberLoanListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupMemberLoanListController>(
      () => GroupMemberLoanListController(),
    );
  }
}
