import 'package:get/get.dart';

import '../controllers/employee_main_tabs_group_controller.dart';

class EmployeeMainTabsGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeMainTabsGroupController>(
      () => EmployeeMainTabsGroupController(),
    );
  }
}
