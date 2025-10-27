import 'package:get/get.dart';

import '../controllers/main_tabs_home_controller.dart';

class MainTabsHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainTabsHomeController>(
      () => MainTabsHomeController(),
    );
  }
}
