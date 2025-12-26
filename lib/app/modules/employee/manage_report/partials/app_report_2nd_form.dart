import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_report/controllers/employee_manage_report_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/text_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';

class AppReport2ndForm extends StatelessWidget {
  const AppReport2ndForm({super.key, required this.controller});

  final EmployeeManageReportController controller;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.secondFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextFormGroup(
            controller: controller.attendancePercentageCtrl,
            label: 'Kehadiran Pertemuan Rutin (%)',
            maxLines: 1,
            validator: (val) => val.isRequired('Kehadiran Pertemuan Rutin (%)'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
          ),
          SizedBox(height: 8.sp),
          AppTextFormGroup(
            controller: controller.organizationFinalScorePercentageCtrl,
            label: 'Nilai Akhir Organisasi (%)',
            maxLines: 1,
            validator: (val) => val.isRequired('Nilai Akhir Organisasi (%)'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
          ),
          SizedBox(height: 12.sp),
          Divider(height: 1.sp, color: AppColor.border.lightGray),
          SizedBox(height: 8.sp),
          Align(
            alignment: Alignment.center,
            child: poppins(
              'Partisipasi Tunai',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 4.sp),
          AppTextFormGroup(
            controller: controller.savingsParticipationCtrl,
            label: 'Partisipasi Simpanan',
            maxLines: 1,
            validator: (val) => val.isRequired('Partisipasi Simpanan'),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(height: 8.sp),
          AppTextFormGroup(
            controller: controller.savingsParticipationPercentageCtrl,
            label: 'Partisipasi Simpanan (%)',
            maxLines: 1,
            validator: (val) => val.isRequired('Partisipasi Simpanan %'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
          ),
          SizedBox(height: 12.sp),
          Divider(height: 1.sp, color: AppColor.border.lightGray),
          SizedBox(height: 8.sp),
          Align(
            alignment: Alignment.center,
            child: poppins(
              'Partisipasi Tunai',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 8.sp),
          AppTextFormGroup(
            controller: controller.cashParticipationCtrl,
            label: 'Partisipasi Tunai',
            maxLines: 1,
            validator: (val) => val.isRequired('Partisipasi Tunai'),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(height: 4.sp),
          AppTextFormGroup(
            controller: controller.cashParticipationPercentageCtrl,
            label: 'Partisipasi Tunai (%)',
            maxLines: 1,
            validator: (val) => val.isRequired('Partisipasi Tunai %'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
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
                  onTap: controller.submitButton,
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
