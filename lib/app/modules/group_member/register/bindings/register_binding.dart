import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/register/static/register_caption.dart';

import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    var registerCaption = RegisterCaption();
    Get.lazyPut<RegisterController>(
      () => RegisterController(caption: registerCaption),
    );
  }
}
