import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/app_keys_helper.dart';

abstract class SnackbarHelper {
  static void showSnackbar({required String messageText}) {
    if (Get.context == null) return;

    Get.closeCurrentSnackbar();
    Get.showSnackbar(
      GetSnackBar(
        message: messageText,
        duration: const Duration(seconds: 4),
        animationDuration: Durations.medium3,
      ),
    );
  }

  static void showDefaultSnackBar(String message, {double bottomOffset = 36}) {
    rootScaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: bottomOffset,
        ),
      ),
    );
  }
}
