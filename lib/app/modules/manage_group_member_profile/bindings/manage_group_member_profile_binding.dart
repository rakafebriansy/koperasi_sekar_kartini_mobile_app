import 'package:get/get.dart';

import '../controllers/manage_group_member_profile_controller.dart';

class ManageGroupMemberProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageGroupMemberProfileController>(
      () => ManageGroupMemberProfileController(),
    );
  }
}
