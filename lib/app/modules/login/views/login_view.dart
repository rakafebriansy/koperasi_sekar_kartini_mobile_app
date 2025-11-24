import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_link_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_default_wrapper.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppDefaultWrapper(
      ableToBack: false,
      title: poppins('Login', fontWeight: FontWeight.w600),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        controller: controller.scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            poppins(
              'Selamat',
              fontSize: 36.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.bg.primary,
            ),
            poppins(
              'Datang!',
              fontSize: 36.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.bg.primary,
            ),
            SizedBox(height: 12.sp),
            poppins(
              'Silakan Login untuk akses lebih lengkap',
              fontSize: 14.sp,
              color: AppColor.bg.primary,
            ),
            SizedBox(height: 16.sp),
            AppTextFormGroup(
              controller: controller.phoneCtrl,
              label: 'Nomor Telepon',
            ),
            SizedBox(height: 8.sp),
            AppTextFormGroup(
              controller: controller.passwordCtrl,
              label: 'Kata Sandi',
              obscureText: true,
            ),
            SizedBox(height: 18.sp),
            AppFilledButton(
              label: 'Login',
              onTap: () {},
              width: double.infinity,
            ),
            SizedBox(height: 12.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                poppins('Belum punya akun?', fontSize: 12.sp),
                SizedBox(width: 6.sp),
                AppLinkButton(
                  link: Routes.GROUP_MEMBER_REGISTER,
                  label: 'Register',
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
