import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/text_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_form_wrapper.dart';

import '../controllers/manage_password_controller.dart';

class ManagePasswordView extends GetView<ManagePasswordController> {
  const ManagePasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppFormWrapper(
      ableToBack: true,
      title: 'Ubah Kata Sandi',
      child: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextFormGroup(
                controller: controller.passwordCtrl,
                label: 'Kata Sandi',
                maxLines: 1,
                obscureText: true,
                validator: (value) =>
                    value.isRequired('Kata Sandi'),
              ),
              SizedBox(height: 18.sp),
              Divider(height: 1.sp, color: AppColor.border.lightGray),
              SizedBox(height: 12.sp),
              AppTextFormGroup(
                controller: controller.newPasswordCtrl,
                label: 'Kata Sandi Baru',
                maxLines: 1,
                obscureText: true,
                validator: (value) =>
                    value.isRequired('Kata Sandi Baru') ??
                    value.minLength(8, 'Kata Sandi Baru') ??
                    value.isPasswordStrong(),
              ),
              SizedBox(height: 8.sp),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 4.sp),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 8.sp,
                        backgroundColor: AppColor.bg.gray,
                        child: Icon(Icons.check, size: 10.sp),
                      ),
                      SizedBox(width: 8.sp),
                      poppins(
                        'Minimal 8 karakter',
                        color: AppColor.bg.primary,
                        fontSize: 12.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 4.sp),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 8.sp,
                        backgroundColor: AppColor.bg.gray,
                        child: Icon(Icons.check, size: 10.sp),
                      ),
                      SizedBox(width: 8.sp),
                      poppins(
                        'Mengandung angka',
                        color: AppColor.bg.primary,
                        fontSize: 12.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 4.sp),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 8.sp,
                        backgroundColor: AppColor.bg.gray,
                        child: Icon(Icons.check, size: 10.sp),
                      ),
                      SizedBox(width: 8.sp),
                      poppins(
                        'Mengandung karakter unik dan huruf besar',
                        color: AppColor.bg.primary,
                        fontSize: 12.sp,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8.sp),
              AppTextFormGroup(
                controller: controller.confirmNewPasswordCtrl,
                label: 'Konfirmasi Kata Sandi Baru',
                maxLines: 1,
                obscureText: true,
                validator: (value) =>
                    value.isRequired('Konfirmasi Kata Sandi Baru') ??
                    value.confirmWith(controller.newPasswordCtrl.text),
              ),
              SizedBox(height: 18.sp),
              Obx(
                () => AppFilledButton(
                  width: double.infinity,
                  label: 'Simpan',
                  onTap: controller.isSubmitted ? null : controller.updatePassword,
                ),
              ),
              SizedBox(height: 12.sp),
            ],
          ),
        ),
      ),
    );
  }
}
