import 'package:get/get.dart';

import '../controllers/employee_manage_employee_controller.dart';

class EmployeeManageEmployeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeManageEmployeeController>(
      () => EmployeeManageEmployeeController(),
    );
  }
}
