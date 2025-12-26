import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_report/controllers/employee_manage_report_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/list/list_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/text_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';

class AppReport4thForm extends StatelessWidget {
  const AppReport4thForm({super.key, required this.controller});

  final EmployeeManageReportController controller;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.fourthFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextFormGroup(
            controller: controller.meetingDepositPercentageCtrl,
            label: 'Setor di Pertemuan (%)',
            maxLines: 1,
            validator: (val) => val.isRequired('Setor di Pertemuan (%)'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
          ),
          SizedBox(height: 8.sp),
          AppTextFormGroup(
            controller: controller.receivableScoreCtrl,
            label: 'Nilai Piutang (%)',
            maxLines: 1,
            validator: (val) => val.isRequired('Nilai Piutang (%)'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
          ),
          SizedBox(height: 8.sp),
          AppTextFormGroup(
            controller: controller.financialFinalScorePercentageCtrl,
            label: 'Nilai Akhir Keuangan (%)',
            maxLines: 1,
            validator: (val) => val.isRequired('Nilai Akhir Keuangan (%)'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
          ),
          SizedBox(height: 8.sp),
          AppTextFormGroup(
            controller: controller.combinedFinalScorePercentageCtrl,
            label: 'Nilai Gabungan (%)',
            maxLines: 1,
            validator: (val) => val.isRequired('Nilai Gabungan (%)'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
          ),
          SizedBox(height: 8.sp),
          poppins('Kriteria', fontSize: 14.sp, fontWeight: FontWeight.w600),
          DropdownSearch<String>(
            enabled: true,
            selectedItem:
                controller.selectedCriteria?.displayName ?? 'Pilih Kriteria',
            items: (filter, infiniteScrollProps) => controller.criterias.names,
            onChanged: (value) => controller.selectCriteria(value),
            decoratorProps: DropDownDecoratorProps(
              baseStyle: GoogleFonts.poppins(fontSize: 14.sp),
              decoration: buildAppTextInputDecoration(hintText: ''),
            ),
            popupProps: PopupProps.menu(
              fit: FlexFit.loose,
              constraints: BoxConstraints(maxHeight: 200.sp),
              itemBuilder: (context, item, isSelected, onTap) => InkWell(
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.sp,
                    vertical: 12.sp,
                  ),
                  child: poppins(item, fontSize: 14.sp),
                ),
              ),
            ),
            validator: (value) => value.isDropdownRequired(
              'Kriteria',
              controller.selectedCriteria?.displayName,
            ),
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
                  label: 'Simpan',
                  onTap: controller.isSubmitted
                      ? null
                      : controller.submitButton,
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
