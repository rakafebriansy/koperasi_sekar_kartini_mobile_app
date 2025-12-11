import 'package:get/get.dart';

import '../controllers/manage_password_controller.dart';

class ManagePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagePasswordController>(
      () => ManagePasswordController(),
    );
  }
}
