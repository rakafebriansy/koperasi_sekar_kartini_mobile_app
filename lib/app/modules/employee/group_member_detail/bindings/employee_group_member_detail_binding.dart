import 'package:get/get.dart';

import '../controllers/employee_group_member_detail_controller.dart';

class EmployeeGroupMemberDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeGroupMemberDetailController>(
      () => EmployeeGroupMemberDetailController(),
    );
  }
}
