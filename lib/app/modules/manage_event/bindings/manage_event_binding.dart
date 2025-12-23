import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/manage_event_controller.dart';

class ManageEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageEventController>(
      () => ManageEventController(apiHelper: Get.find<ApiHelper>(), authController: Get.find<AuthController>()),
    );
  }
}
