import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/register/partials/app_register_first_form.dart';
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
            IndexedStack(
              index: controller.selectedScreen.value,
              children: [
                AppRegisterFirstForm(controller: controller)
                ],
            ),
            SizedBox(height: 18.sp),
            AppFilledButton(
              label: 'Lanjut',
              onClick: () {},
              width: double.infinity,
            ),
            SizedBox(height: 12.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sudah punya akun?',
                  style: GoogleFonts.poppins(fontSize: 12.sp),
                ),
                SizedBox(width: 6.sp),
                AppLinkButton(
                  link: Routes.LOGIN,
                  label: 'Login',
                  isPath: true,
                  fontSize: 12.sp,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
