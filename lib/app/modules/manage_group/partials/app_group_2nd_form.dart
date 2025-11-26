import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/manage_group/controllers/manage_group_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/list/list_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';

class AppGroup2ndForm extends StatelessWidget {
  const AppGroup2ndForm({super.key, required this.controller});

  final ManageGroupController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        poppins('Penanggung Jawab Kelompok', fontSize: 14.sp, fontWeight: FontWeight.w600),
        DropdownSearch<String>(
          enabled: DummyHelper.dummyUsers.isNotEmpty,
          selectedItem: controller.selectedChairman.value?.name,
          items: (filter, infiniteScrollProps) =>
              DummyHelper.dummyUsers.names,
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
        poppins('Petugas Pendamping Kelompok', fontSize: 14.sp, fontWeight: FontWeight.w600),
        DropdownSearch<String>(
          enabled: DummyHelper.dummyUsers.isNotEmpty,
          selectedItem: controller.selectedFacilitator.value?.name,
          items: (filter, infiniteScrollProps) =>
              DummyHelper.dummyUsers.names,
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
          controller: controller.regulationCtrl,
          label: 'Ketetapan',
          maxLines: 3,
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
