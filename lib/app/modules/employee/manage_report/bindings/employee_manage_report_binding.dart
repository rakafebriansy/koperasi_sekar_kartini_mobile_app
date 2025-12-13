import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/employee_manage_report_controller.dart';

class EmployeeManageReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeManageReportController>(
      () => EmployeeManageReportController(apiHelper: ApiHelper()),
    );
  }
}
