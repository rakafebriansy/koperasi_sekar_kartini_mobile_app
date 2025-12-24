import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/messaging/fcm_service/fcm_service.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';

class LoginController extends GetxController {
  final ApiHelper apiHelper;
  final AuthController authController;
  final FcmService fcmService;

  final formKey = GlobalKey<FormState>();

  LoginController({
    required this.apiHelper,
    required this.authController,
    required this.fcmService,
  });

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  TextEditingController phoneCtrl = TextEditingController(
    // text: !kReleaseMode
    //     ?
    //     '081200000001'
    //     // '0812345778'
    //     : '',
  );
  TextEditingController passwordCtrl = TextEditingController(
    // text: !kReleaseMode ? 'password' : '',
  );

  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    phoneCtrl.dispose();
    passwordCtrl.dispose();
    scrollController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    _isSubmitted.value = true;

    try {
      if (!(formKey.currentState?.validate() ?? true)) return;

      final user = await apiHelper.fetch<UserModel>(
        request: (api) =>
            api.login(phoneNumber: phoneCtrl.text, password: passwordCtrl.text),
      );

      authController.saveUserData(user: user);
      await fcmService.sendToken();

      if (user.role == 'group_member') {
        Get.offAllNamed(Routes.GROUP_MEMBER_MAIN);
      } else if (user.role == 'employee' || user.role == 'admin') {
        Get.offAllNamed(Routes.EMPLOYEE_MAIN);
      } else {
        throw Exception('Role tidak ditemukan');
      }
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e, canUseNavigator: false);
    } finally {
      _isSubmitted.value = false;
    }
  }
}
