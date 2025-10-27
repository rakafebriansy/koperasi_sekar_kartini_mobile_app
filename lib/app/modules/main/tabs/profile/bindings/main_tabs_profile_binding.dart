import 'package:get/get.dart';

import '../controllers/main_tabs_profile_controller.dart';

class MainTabsProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainTabsProfileController>(
      () => MainTabsProfileController(),
    );
  }
}
