import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/user_savings_list_controller.dart';

class UserSavingsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserSavingsListController>(
      () => UserSavingsListController(apiHelper: ApiHelper()),
    );
  }
}
