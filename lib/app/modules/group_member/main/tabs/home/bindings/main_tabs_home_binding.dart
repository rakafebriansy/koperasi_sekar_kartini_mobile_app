import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/group_member_main_tabs_home_controller.dart';

class GroupMemberMainTabsHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupMemberMainTabsHomeController>(
      () => GroupMemberMainTabsHomeController(apiHelper: Get.find<ApiHelper>()),
    );
  }
}
