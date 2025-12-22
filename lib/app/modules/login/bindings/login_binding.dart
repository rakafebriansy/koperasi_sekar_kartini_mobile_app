import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(apiHelper: Get.find<ApiHelper>()),
    );
  }
}
