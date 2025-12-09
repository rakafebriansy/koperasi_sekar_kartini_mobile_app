import 'package:get/get.dart';

import '../controllers/savings_list_controller.dart';

class SavingsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavingsListController>(
      () => SavingsListController(),
    );
  }
}
