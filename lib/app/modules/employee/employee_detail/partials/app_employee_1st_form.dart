import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/employee_detail/controllers/employee_employee_detail_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_date_input_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';

class AppEmployee1stForm extends StatelessWidget {
  const AppEmployee1stForm({super.key, required this.controller});

  final EmployeeEmployeeDetailController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppTextFormGroup(
          controller: controller.nationalIdCtrl,
          label: 'NIK',
          maxLines: 1,
        ),
        SizedBox(height: 8.sp),
        AppTextFormGroup(
          controller: controller.nameCtrl,
          label: 'Nama Lengkap',
          maxLines: 1,
        ),
        SizedBox(height: 8.sp),
        poppins('Tanggal Lahir', fontSize: 14.sp, fontWeight: FontWeight.w600),
        AppDateInputField(controller: controller.birthDateCtrl),
        SizedBox(height: 8.sp),
        AppTextFormGroup(
          controller: controller.addressCtrl,
          label: 'Alamat Lengkap',
          maxLines: 2,
        ),
        SizedBox(height: 18.sp),
        Row(
          spacing: 12.sp,
          children: [
            if (controller.selectedScreen > 0)
              Material(
                child: InkWell(
                  child: Container(
                    width: 48.sp,
                    height: 48.sp,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.instance.primary,
                        width: 2.sp,
                      ),
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_outlined,
                        size: 24.sp,
                        color: AppColor.instance.primary,
                      ),
                    ),
                  ),
                ),
              ),
            Expanded(
              child: AppFilledButton(
                label: 'Lanjut',
                onTap: () {
                  controller.nextScreen();
                },
                width: double.infinity,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.sp),
      ],
    );
  }
}
