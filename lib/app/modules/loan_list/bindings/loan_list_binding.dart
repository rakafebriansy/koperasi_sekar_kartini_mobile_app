import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/loan_list_controller.dart';

class LoanListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoanListController>(
      () => LoanListController(apiHelper: Get.find<ApiHelper>()),
    );
  }
}
