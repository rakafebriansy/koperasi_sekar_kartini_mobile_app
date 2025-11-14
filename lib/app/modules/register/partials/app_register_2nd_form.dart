import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/register/controllers/register_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/builders/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_date_input_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';

class AppRegister2ndForm extends StatelessWidget {
  const AppRegister2ndForm({super.key, required this.controller});

  final RegisterController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          poppins(
            'Tanggal Lahir',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          AppDateInputField(controller: controller.datetimeCtrl),
          SizedBox(height: 8.sp),
          AppTextFormGroup(controller: controller.jobCtrl, label: 'Pekerjaan'),
          SizedBox(height: 8.sp),
          AppTextFormGroup(controller: controller.emailCtrl, label: 'Email'),
          SizedBox(height: 8.sp),
          AppTextFormGroup(
            controller: controller.phoneCtrl,
            label: 'Nomor Telepon',
            keyboardType: TextInputType.number,
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
