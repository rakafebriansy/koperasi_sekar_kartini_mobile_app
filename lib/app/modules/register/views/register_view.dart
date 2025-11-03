import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/register/partials/app_register_first_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/register/partials/app_register_second_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/register/partials/app_register_third_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_link_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_default_wrapper.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppDefaultWrapper(
      actions: [
        SizedBox(
          width: 60.sp,
          child: Obx(
            () => LinearProgressIndicator(
              borderRadius: BorderRadius.circular(40.sp),
              value: controller.progress,
              color: Colors.green,
              backgroundColor: Colors.grey[300],
              minHeight: 8,
            ),
          ),
        ),
      ],
      ableToBack: false,
      title: Text(
        'Register',
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
      ),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        controller: controller.scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.getCurrentTitle,
              style: GoogleFonts.poppins(
                fontSize: 36.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
              ),
            ),
            SizedBox(height: 12.sp),
            Text(
              controller.getCurrentSubtitle,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: AppColor.primary,
              ),
            ),
            SizedBox(height: 16.sp),
            Obx(
              () => IndexedStack(
                index: controller.selectedScreen.value,
                children: [
                  AppRegisterFirstForm(controller: controller),
                  AppRegisterSecondForm(controller: controller),
                  AppRegisterThirdForm(controller: controller),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
