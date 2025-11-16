import 'package:get/get.dart';

import '../controllers/employee_main_tabs_employee_controller.dart';

class EmployeeMainTabsEmployeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeMainTabsEmployeeController>(
      () => EmployeeMainTabsEmployeeController(),
    );
  }
}
