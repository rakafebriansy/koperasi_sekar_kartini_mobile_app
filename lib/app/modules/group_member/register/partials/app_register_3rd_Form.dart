import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/register/controllers/register_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';

class AppRegister3rdForm extends StatelessWidget {
  const AppRegister3rdForm({super.key, required this.controller});

  final RegisterController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextFormGroup(
            controller: controller.passwordCtrl,
            label: 'Kata Sandi',
            maxLines: 1,
          ),
          SizedBox(height: 8.sp),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                    child: Icon(Icons.check, size: 10.sp),
                    radius: 8.sp,
                    backgroundColor: AppColor.bg.gray,
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
          ),
          SizedBox(height: 18.sp),
          AppFilledButton(
            label: 'Lanjut',
            onTap: () {
              controller.nextScreen();
            },
            width: double.infinity,
          ),
          SizedBox(height: 12.sp),
        ],
      ),
    );
  }
}
