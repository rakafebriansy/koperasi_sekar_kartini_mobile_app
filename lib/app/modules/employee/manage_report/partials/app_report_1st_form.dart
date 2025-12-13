import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_report/controllers/employee_manage_report_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/action_type/action_type_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/list/list_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/text_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_date_input_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';

class AppReport1stForm extends StatelessWidget {
  const AppReport1stForm({super.key, required this.controller});

  final EmployeeManageReportController controller;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.firstFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: poppins(
              'Keterangan',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 4.sp),
          Row(crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8.sp,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    poppins(
                      'Triwulan',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 4.sp),
                    DropdownSearch<String>(
                      enabled: controller.action!.isCreateAction,
                      selectedItem:
                          controller.selectedQuarter?.displayName ??
                          'Pilih Triwulan',
                      items: (filter, infiniteScrollProps) =>
                          controller.quarters.names,
                      decoratorProps: DropDownDecoratorProps(
                        baseStyle: GoogleFonts.poppins(fontSize: 14.sp),
                        decoration: buildAppTextInputDecoration(hintText: ''),
                      ),
                      onChanged: (value) => controller.selectQuarter(value),
                      validator: (value) =>
                          value.isDropdownRequired('Triwulan', controller.selectedQuarter?.displayName),
                      popupProps: PopupProps.menu(
                        fit: FlexFit.loose,
                        constraints: BoxConstraints(maxHeight: 200.sp),
                        itemBuilder: (context, item, isSelected, onTap) =>
                            InkWell(
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
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    poppins(
                      'Tahun',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 4.sp),
                    AppDateInputField(
                      enabled: controller.action?.isCreateAction,
                      controller: controller.yearCtrl,
                      label: 'Tahun',
                      placeholder: 'Pilih Tahun',
                      type: DateInputType.year,
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 12.sp),
          Divider(height: 1.sp, color: AppColor.border.lightGray),
          SizedBox(height: 8.sp),
          Align(
            alignment: Alignment.center,
            child: poppins(
              'Perkembangan Anggota',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 4.sp),
          AppTextFormGroup(
            controller: controller.memberGrowthInCtrl,
            label: 'Anggota Masuk',
            maxLines: 1,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
          SizedBox(height: 8.sp),
          AppTextFormGroup(
            controller: controller.memberGrowthOutCtrl,
            label: 'Anggota Keluar',
            maxLines: 1,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
          SizedBox(height: 12.sp),
          Divider(height: 1.sp, color: AppColor.border.lightGray),
          SizedBox(height: 8.sp),
          AppTextFormGroup(
            controller: controller.administrativeCompliancePercentageCtrl,
            label: 'Tertib Administrasi (%)',
            maxLines: 1,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
          SizedBox(height: 8.sp),
          AppTextFormGroup(
            controller: controller.depositCompliancePercentageCtrl,
            label: 'Tertib Setor (%)',
            maxLines: 1,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
          SizedBox(height: 18.sp),
          SizedBox(
            width: double.infinity,
            child: AppFilledButton(
              label: 'Lanjut',
              onTap: controller.submitButton,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 12.sp),
        ],
      ),
    );
  }
}
