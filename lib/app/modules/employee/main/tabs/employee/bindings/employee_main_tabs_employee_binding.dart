import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/employee_main_tabs_employee_controller.dart';

class EmployeeMainTabsEmployeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeMainTabsEmployeeController>(
      () => EmployeeMainTabsEmployeeController(apiHelper: Get.find<ApiHelper>()),
    );
  }
}
