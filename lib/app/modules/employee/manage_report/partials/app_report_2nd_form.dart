import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_report/controllers/employee_manage_report_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';

class AppReport2ndForm extends StatelessWidget {
  const AppReport2ndForm({super.key, required this.controller});

  final EmployeeManageReportController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppTextFormGroup(
          controller: controller.administrationOrderPercentageCtrl,
          label: 'Tertib Administrasi %',
          maxLines: 1,
        ),
        SizedBox(height: 8.sp),
        AppTextFormGroup(
          controller: controller.depositOrderPercentageCtrl,
          label: 'Tertib Setor %',
          maxLines: 1,
        ),
        SizedBox(height: 8.sp),
        AppTextFormGroup(
          controller: controller.attendancePercentageCtrl,
          label: 'Kehadiran %',
          maxLines: 1,
        ),
        SizedBox(height: 8.sp),
        AppTextFormGroup(
          controller: controller.finalOrganizationScoreCtrl,
          label: 'Nilai Akhir %',
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
