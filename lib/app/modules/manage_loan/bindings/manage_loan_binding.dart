import 'package:get/get.dart';

import '../controllers/manage_loan_controller.dart';

class ManageLoanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageLoanController>(
      () => ManageLoanController(),
    );
  }
}
