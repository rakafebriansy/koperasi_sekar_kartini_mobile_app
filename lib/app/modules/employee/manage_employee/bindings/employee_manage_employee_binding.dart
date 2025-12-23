import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/employee_manage_employee_controller.dart';

class EmployeeManageEmployeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeManageEmployeeController>(
      () => EmployeeManageEmployeeController(
        apiHelper: Get.find<ApiHelper>(),
        authController: Get.find<AuthController>(),
      ),
    );
  }
}
