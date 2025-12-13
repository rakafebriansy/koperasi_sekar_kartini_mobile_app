import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_report/controllers/employee_manage_report_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';

class AppReport3rdForm extends StatelessWidget {
  const AppReport3rdForm({super.key, required this.controller});

  final EmployeeManageReportController controller;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.thirdFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: poppins(
              'Partisipasi Pinjaman',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 4.sp),
          AppTextFormGroup(
            controller: controller.loanParticipationPbCtrl,
            label: 'PB',
            maxLines: 1,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(height: 8.sp),
          AppTextFormGroup(
            controller: controller.loanParticipationBbmCtrl,
            label: 'BBM',
            maxLines: 1,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(height: 8.sp),
          AppTextFormGroup(
            controller: controller.loanParticipationStoreCtrl,
            label: 'Toko',
            maxLines: 1,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(height: 12.sp),
          Divider(height: 1.sp, color: AppColor.border.lightGray),
          SizedBox(height: 8.sp),
          Align(
            alignment: Alignment.center,
            child: poppins(
              'Saldo Pinjaman',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 4.sp),
          AppTextFormGroup(
            controller: controller.loanBalancePbCtrl,
            label: 'PB',
            maxLines: 1,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(height: 8.sp),
          AppTextFormGroup(
            controller: controller.loanBalanceBbmCtrl,
            label: 'BBM',
            maxLines: 1,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(height: 8.sp),
          AppTextFormGroup(
            controller: controller.loanBalanceStoreCtrl,
            label: 'Toko',
            maxLines: 1,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
