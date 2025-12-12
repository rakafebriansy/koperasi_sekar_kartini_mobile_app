import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/main/tabs/employee/controllers/employee_main_tabs_employee_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/main/tabs/group/controllers/employee_main_tabs_group_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/main/tabs/home/controllers/employee_main_tabs_home_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/main/tabs/profile/controllers/employee_main_tabs_profile_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/employee_main_controller.dart';

class EmployeeMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeMainController>(
      () => EmployeeMainController(),
    );
    Get.lazyPut<EmployeeMainTabsHomeController>(
      () => EmployeeMainTabsHomeController(apiHelper: Get.find<ApiHelper>()),
    );
    Get.lazyPut<EmployeeMainTabsProfileController>(
      () => EmployeeMainTabsProfileController(),
    );
    Get.lazyPut<EmployeeMainTabsGroupController>(
      () => EmployeeMainTabsGroupController(apiHelper: Get.find<ApiHelper>()),
    );
    Get.lazyPut<EmployeeMainTabsEmployeeController>(
      () => EmployeeMainTabsEmployeeController(),
    );
  }
}
