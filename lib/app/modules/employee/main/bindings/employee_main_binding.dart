import 'package:get/get.dart';

import '../controllers/employee_main_controller.dart';

class EmployeeMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeMainController>(
      () => EmployeeMainController(),
    );
  }
}
