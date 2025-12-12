import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/employee_main_tabs_home_controller.dart';

class EmployeeMainTabsHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeMainTabsHomeController>(
      () => EmployeeMainTabsHomeController(apiHelper: Get.find<ApiHelper>()),
    );
  }
}
