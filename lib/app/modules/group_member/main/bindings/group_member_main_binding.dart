import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/main/tabs/group/controllers/group_member_main_tabs_group_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/main/tabs/home/controllers/group_member_main_tabs_home_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/main/tabs/profile/controllers/group_member_main_tabs_profile_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/group_member_main_controller.dart';

class GroupMemberMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupMemberMainController>(
      () => GroupMemberMainController(),
    );
    Get.lazyPut<GroupMemberMainTabsHomeController>(
      () => GroupMemberMainTabsHomeController(apiHelper: Get.find<ApiHelper>()),
    );
    Get.lazyPut<GroupMemberMainTabsGroupController>(
      () => GroupMemberMainTabsGroupController(apiHelper: Get.find<ApiHelper>()),
    );
    Get.lazyPut<GroupMemberMainTabsProfileController>(
      () => GroupMemberMainTabsProfileController(apiHelper: Get.find<ApiHelper>()),
    );
  }
}
