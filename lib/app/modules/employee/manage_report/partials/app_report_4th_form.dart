import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_report/controllers/employee_manage_report_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';

class AppReport4thForm extends StatelessWidget {
  const AppReport4thForm({super.key, required this.controller});

  final EmployeeManageReportController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppTextFormGroup(
          controller: controller.cashParticipationCtrl,
          label: 'Partisipasi Tunai',
          maxLines: 1,
        ),
        SizedBox(height: 8.sp),
        AppTextFormGroup(
          controller: controller.savingParticipationCtrl,
          label: 'Partisipasi Simpanan',
          maxLines: 1,
        ),
        SizedBox(height: 8.sp),
        AppTextFormGroup(
          controller: controller.depositOrderPercentageCtrl,
          label: 'Setor di Pertemuan %',
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
