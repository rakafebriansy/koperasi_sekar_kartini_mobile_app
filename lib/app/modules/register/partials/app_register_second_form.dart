import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/register/controllers/register_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_date_input_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';

class AppRegisterSecondForm extends StatelessWidget {
  const AppRegisterSecondForm({super.key, required this.controller});

  final RegisterController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Tanggal Lahir',
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2.sp, color: AppColor.primary),
                  borderRadius: BorderRadius.circular(999.sp),
                ),
                width: 48.sp,
                height: 48.sp,
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      controller.selectedScreen.value--;
                    },
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: AppColor.primary,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.sp),
              Expanded(
                child: AppFilledButton(
                  label: 'Lanjut',
                  onTap: () {
                    controller.selectedScreen.value++;
                  },
                  width: double.infinity,
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
