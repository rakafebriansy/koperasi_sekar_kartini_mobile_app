import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';

class LoginController extends GetxController {
  final RxBool _isSubmitted = RxBool(false);
  bool get isSubmitted => _isSubmitted.value;

  TextEditingController phoneCtrl = TextEditingController(
    text: !kReleaseMode ? '087712345678' : '',
  );
  TextEditingController passwordCtrl = TextEditingController(
    text: !kReleaseMode ? 'password' : '',
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
      final user = await ApiHelper.fetch<UserModel>(
        request: (api) => api.login({
          'phone_number': phoneCtrl.text,
          'password': passwordCtrl.text,
        }),
      );

      print(user?.name);
    } catch (e) {
      print(e.toString());
      ErrorHelper.handleError(e);
    } finally {
      _isSubmitted.value = false;
    }
  }
}
