import 'package:get/get.dart';

import '../controllers/manage_savings_controller.dart';

class ManageSavingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageSavingsController>(
      () => ManageSavingsController(),
    );
  }
}
