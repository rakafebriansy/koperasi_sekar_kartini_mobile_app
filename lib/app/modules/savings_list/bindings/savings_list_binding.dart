import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/savings_list_controller.dart';

class SavingsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavingsListController>(
      () => SavingsListController(apiHelper: Get.find<ApiHelper>()),
    );
  }
}
