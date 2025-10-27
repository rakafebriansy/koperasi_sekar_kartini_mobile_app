import 'package:get/get.dart';

import '../controllers/main_tabs_group_controller.dart';

class MainTabsGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainTabsGroupController>(
      () => MainTabsGroupController(),
    );
  }
}
