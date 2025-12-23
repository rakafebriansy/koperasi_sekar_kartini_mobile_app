import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/manage_loan_controller.dart';

class ManageLoanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageLoanController>(
      () => ManageLoanController(apiHelper: Get.find<ApiHelper>()),
    );
  }
}
