import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/manage_savings_controller.dart';

class ManageSavingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageSavingsController>(
      () => ManageSavingsController(apiHelper: Get.find<ApiHelper>()),
    );
  }
}
