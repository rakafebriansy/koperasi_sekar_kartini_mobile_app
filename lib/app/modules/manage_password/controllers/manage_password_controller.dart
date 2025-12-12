import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';

class ManagePasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();

  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController newPasswordCtrl = TextEditingController();
  TextEditingController confirmNewPasswordCtrl = TextEditingController();

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  Future<void> updatePassword() async {
    if (formKey.currentState!.validate()) {
      _isSubmitted.value = true;

      try {
        await ApiHelper.instance.fetchNonReturnable(
          request: (api) => api.changePassword(
            password: passwordCtrl.text,
            newPassword: newPasswordCtrl.text,
          ),
        );

        Get.back(result: true);
        Get.snackbar('INFO', 'Berhasil memperbarui kata sandi!');
      } catch (e) {
        debugPrint(e.toString());
        ErrorHelper.handleError(e, canUseNavigator: false);
      } finally {
        _isSubmitted.value = false;
      }
    }
  }
}
