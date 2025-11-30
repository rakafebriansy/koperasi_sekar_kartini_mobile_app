import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';

abstract class DialogHelper {
  static Future<void> showFailedDialog(String messageText,
      {String? titleText}) async {
    if (Get.context == null) return;

    return Get.dialog(
      Dialog(
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24.sp))),
        child: ListView(
          shrinkWrap: true,
          padding:  EdgeInsets.fromLTRB(32.sp, 0.sp, 32.sp, 32.sp),
          children: [
            Padding(
              padding: EdgeInsets.all(12.sp),
              child: Image.asset(AppAsset.images.illustrationFailedDialog2),
            ),
             SizedBox(height: 24.sp),
            Text(
              titleText ?? 'Error',
              style: Get.textTheme.titleLarge!.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
             SizedBox(height: 4.sp),
            Text(messageText, style: Get.context!.textTheme.bodyLarge),
             SizedBox(height: 8.sp),
            OutlinedButton(
              onPressed: Get.back,
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
