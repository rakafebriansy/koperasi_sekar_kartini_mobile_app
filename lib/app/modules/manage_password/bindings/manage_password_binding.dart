import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/manage_password_controller.dart';

class ManagePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagePasswordController>(
      () => ManagePasswordController(apiHelper: Get.find<ApiHelper>()),
    );
  }
}
