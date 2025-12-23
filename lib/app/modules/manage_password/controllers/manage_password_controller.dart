import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';

class ManagePasswordController extends GetxController {
    final ApiHelper apiHelper;

  ManagePasswordController({required this.apiHelper});

  final formKey = GlobalKey<FormState>();

  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController newPasswordCtrl = TextEditingController();
  TextEditingController confirmNewPasswordCtrl = TextEditingController();

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  Future<void> updatePassword() async {
    if (!(formKey.currentState?.validate() ?? true)) return;
    _isSubmitted.value = true;

    try {
      await apiHelper.fetchNonReturnable(
        request: (api) => api.changePassword(
          password: passwordCtrl.text,
          newPassword: newPasswordCtrl.text,
        ),
      );

      Get.back(result: true);
      showSnackbar('INFO', 'Berhasil memperbarui kata sandi!');
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isSubmitted.value = false;
    }
  }
}
