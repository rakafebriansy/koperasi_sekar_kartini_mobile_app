import 'package:get/get.dart';

import '../controllers/employee_main_tabs_home_controller.dart';

class EmployeeMainTabsHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeMainTabsHomeController>(
      () => EmployeeMainTabsHomeController(),
    );
  }
}
