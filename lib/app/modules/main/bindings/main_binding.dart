import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/main/tabs/group/controllers/main_tabs_group_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/main/tabs/home/controllers/main_tabs_home_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/main/tabs/profile/controllers/main_tabs_profile_controller.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<MainTabsHomeController>(
      () => MainTabsHomeController(),
    );
    Get.lazyPut<MainTabsGroupController>(
      () => MainTabsGroupController(),
    );
    Get.lazyPut<MainTabsProfileController>(
      () => MainTabsProfileController(),
    );
  }
}
