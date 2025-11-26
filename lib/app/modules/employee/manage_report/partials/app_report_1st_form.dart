import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_report/controllers/employee_manage_report_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';

class AppReport1stForm extends StatelessWidget {
  const AppReport1stForm({super.key, required this.controller});

  final EmployeeManageReportController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        poppins('Bulan', fontSize: 14.sp, fontWeight: FontWeight.w600),
        DropdownSearch<String>(
          enabled: true,
          selectedItem: controller.selectedMonth.value,
          items: (filter, infiniteScrollProps) => [
            'Januari',
            'Februari',
            'Maret',
            'April',
            'Mei',
            'Juni',
            'Juli',
            'Agustus',
            'September',
            'Oktober',
            'Desember',
          ],
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
        ),
        SizedBox(height: 8.sp),
        poppins('Triwulan', fontSize: 14.sp, fontWeight: FontWeight.w600),
        DropdownSearch<String>(
          enabled: true,
          selectedItem: controller.selectedTriwulan.value,
          items: (filter, infiniteScrollProps) => [
            'Triwulan I',
            'Triwulan II',
            'Triwulan III',
            'Triwulan IV',
          ],
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
        ),
        SizedBox(height: 8.sp),
        AppTextFormGroup(
          controller: controller.incomingMemberCtrl,
          label: 'Anggota Masuk',
          maxLines: 1,
        ),
        SizedBox(height: 8.sp),
        AppTextFormGroup(
          controller: controller.incomingMemberCtrl,
          label: 'Anggota Keluar',
          maxLines: 1,
        ),
        SizedBox(height: 8.sp),

        AppTextFormGroup(
          controller: controller.totalMembersCtrl,
          label: 'Total Anggota Kelompok',
          maxLines: 1,
        ),
        SizedBox(height: 18.sp),
        SizedBox(
          width: double.infinity,
          child: AppFilledButton(
            label: 'Lanjut',
            onTap: () {
              controller.nextScreen();
            },
            width: double.infinity,
          ),
        ),
        SizedBox(height: 12.sp),
      ],
    );
  }
}
