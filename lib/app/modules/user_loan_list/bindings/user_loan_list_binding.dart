import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/user_loan_list_controller.dart';

class UserLoanListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserLoanListController>(
      () => UserLoanListController(apiHelper: Get.find<ApiHelper>()),
    );
  }
}
