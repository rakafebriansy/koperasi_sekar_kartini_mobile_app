import 'package:get/get.dart';

import '../controllers/employee_employee_detail_controller.dart';

class EmployeeEmployeeDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeEmployeeDetailController>(
      () => EmployeeEmployeeDetailController(),
    );
  }
}
