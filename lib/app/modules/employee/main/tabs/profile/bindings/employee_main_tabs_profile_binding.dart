import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/employee_main_tabs_profile_controller.dart';

class EmployeeMainTabsProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeMainTabsProfileController>(
      () => EmployeeMainTabsProfileController(
        apiHelper: Get.find<ApiHelper>(),
        authController: Get.find<AuthController>(),
      ),
    );
  }
}
