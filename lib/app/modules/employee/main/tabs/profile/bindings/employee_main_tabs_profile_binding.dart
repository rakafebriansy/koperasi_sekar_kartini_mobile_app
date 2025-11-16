import 'package:get/get.dart';

import '../controllers/employee_main_tabs_profile_controller.dart';

class EmployeeMainTabsProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeMainTabsProfileController>(
      () => EmployeeMainTabsProfileController(),
    );
  }
}
