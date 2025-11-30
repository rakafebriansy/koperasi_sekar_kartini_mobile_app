import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/manage_group/controllers/manage_group_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/list/list_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';

class AppGroup1stForm extends StatelessWidget {
  const AppGroup1stForm({super.key, required this.controller});

  final ManageGroupController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppTextFormGroup(
          controller: controller.nameCtrl,
          label: 'Nama Lengkap',
          maxLines: 1,
        ),
        SizedBox(height: 8.sp),
        AppTextFormGroup(
          controller: controller.numberCtrl,
          label: 'Nomor',
          maxLines: 1,
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 8.sp),
        poppins('Wilayah Kerja', fontSize: 14.sp, fontWeight: FontWeight.w600),
        DropdownSearch<String>(
          enabled: DummyHelper.workAreas.isNotEmpty,
          selectedItem: controller.selectedWorkArea.value?.name,
          items: (filter, infiniteScrollProps) =>
              DummyHelper.workAreas.names,
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

        poppins('Status', fontSize: 14.sp, fontWeight: FontWeight.w600),
        DropdownSearch<String>(
          enabled: true,
          selectedItem: controller.selectedStatus.value,
          items: (filter, infiniteScrollProps) => ['Aktif', 'Tidak Aktif'],
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
