import 'package:get/get.dart';

import '../controllers/manage_group_controller.dart';

class ManageGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageGroupController>(
      () => ManageGroupController(),
    );
  }
}
