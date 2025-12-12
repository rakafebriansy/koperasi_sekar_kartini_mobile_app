import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/employee_main_tabs_group_controller.dart';

class EmployeeMainTabsGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeMainTabsGroupController>(
      () => EmployeeMainTabsGroupController(apiHelper: Get.find<ApiHelper>()),
    );
  }
}
