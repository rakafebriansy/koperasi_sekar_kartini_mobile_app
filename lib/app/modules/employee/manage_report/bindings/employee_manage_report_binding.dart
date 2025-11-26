import 'package:get/get.dart';

import '../controllers/employee_manage_report_controller.dart';

class EmployeeManageReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeManageReportController>(
      () => EmployeeManageReportController(),
    );
  }
}
