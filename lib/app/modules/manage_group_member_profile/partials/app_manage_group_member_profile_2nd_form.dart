import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/manage_group_member_profile/controllers/manage_group_member_profile_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/text_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';

class AppManageGroupMemberProfile2ndForm extends StatelessWidget {
  const AppManageGroupMemberProfile2ndForm({super.key, required this.controller});

  final ManageGroupMemberProfileController controller;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.secondFormKey,
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
                value.isRequired('Kata Sandi') ??
                value.minLength(8, 'Kata Sandi') ??
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
                    child: Icon(Icons.check, size: 10.sp),
                    radius: 8.sp,
                    backgroundColor: AppColor.bg.gray,
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
            controller: controller.confirmPasswordCtrl,
            label: 'Konfirmasi Kata Sandi',
            maxLines: 1,
            obscureText: true,
            validator: (value) =>
                value.isRequired('Konfirmasi Kata Sandi') ??
                value.confirmWith(controller.passwordCtrl.text),
          ),
          SizedBox(height: 18.sp),
          Row(
            spacing: 12.sp,

            children: [
              if (controller.selectedScreen > 0)
                Material(
                  child: InkWell(
                    onTap: () {
                      controller.prevScreen();
                    },
                    child: Container(
                      width: 48.sp,
                      height: 48.sp,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColor.bg.primary,
                          width: 2.sp,
                        ),
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_outlined,
                          size: 24.sp,
                          color: AppColor.bg.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: AppFilledButton(
                  width: double.infinity,
                  label: 'Lanjut',
                  onTap: controller.submitButton,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.sp),
        ],
      ),
    );
  }
}
