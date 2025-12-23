import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/group_detail_controller.dart';

class GroupDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupDetailController>(
      () => GroupDetailController(
        apiHelper: Get.find<ApiHelper>(),
        authController: Get.find<AuthController>(),
      ),
    );
  }
}
