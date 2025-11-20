import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/detail/controllers/employee_employee_detail_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';

class AppEmployee2ndForm extends StatelessWidget {
  const AppEmployee2ndForm({super.key, required this.controller});

  final EmployeeEmployeeDetailController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppTextFormGroup(
          controller: controller.phoneCtrl,
          label: 'Nomor Telepon',
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 8.sp),
        AppTextFormGroup(
          controller: controller.jobCtrl,
          label: 'Posisi',
          maxLines: 1,
        ),
        SizedBox(height: 18.sp),
        AppTextFormGroup(
          controller: controller.emailCtrl,
          label: 'Email',
          maxLines: 1,
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
