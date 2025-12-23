import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/manage_group_controller.dart';

class ManageGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageGroupController>(
      () => ManageGroupController(apiHelper: Get.find<ApiHelper>()),
    );
  }
}
