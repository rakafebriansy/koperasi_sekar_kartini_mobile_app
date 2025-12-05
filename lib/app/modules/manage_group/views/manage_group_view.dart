import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/list/list_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_form_wrapper.dart';

import '../controllers/manage_group_controller.dart';

class ManageGroupView extends GetView<ManageGroupController> {
  const ManageGroupView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppFormWrapper(
      ableToBack: true,
      title: 'Detail Kelompok',
      child: Obx(
        () => SingleChildScrollView(
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 8.sp),
              AppTextFormGroup(
                controller: controller.numberCtrl,
                label: 'Nomor',
                maxLines: 1,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 8.sp),
              poppins(
                'Wilayah Kerja',
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              DropdownSearch<String>(
                enabled: controller.workAreas.isNotEmpty,
                selectedItem: controller.selectedWorkArea.value?.name,
                items: (filter, infiniteScrollProps) =>
                    controller.workAreas.names,
                decoratorProps: DropDownDecoratorProps(
                  baseStyle: GoogleFonts.poppins(fontSize: 14.sp),
                  decoration: buildAppTextInputDecoration(hintText: ''),
                ),
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
              SizedBox(height: 8.sp),
              poppins(
                'Status',
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              DropdownSearch<String>(
                enabled: true,
                selectedItem: controller.isActiveString,
                items: (filter, infiniteScrollProps) => [
                  'Aktif',
                  'Tidak Aktif',
                ],
                decoratorProps: DropDownDecoratorProps(
                  baseStyle: GoogleFonts.poppins(fontSize: 14.sp),
                  decoration: buildAppTextInputDecoration(hintText: ''),
                ),
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
              SizedBox(height: 8.sp),
              poppins(
                'Penanggung Jawab Kelompok',
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              DropdownSearch<String>(
                enabled: DummyHelper.users.isNotEmpty,
                selectedItem: controller.selectedChairman.value?.name,
                items: (filter, infiniteScrollProps) =>
                    DummyHelper.users.names,
                decoratorProps: DropDownDecoratorProps(
                  baseStyle: GoogleFonts.poppins(fontSize: 14.sp),
                  decoration: buildAppTextInputDecoration(hintText: ''),
                ),
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
              SizedBox(height: 8.sp),
              poppins(
                'Petugas Pendamping Kelompok',
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              DropdownSearch<String>(
                enabled: DummyHelper.users.isNotEmpty,
                selectedItem: controller.selectedFacilitator.value?.name,
                items: (filter, infiniteScrollProps) =>
                    DummyHelper.users.names,
                decoratorProps: DropDownDecoratorProps(
                  baseStyle: GoogleFonts.poppins(fontSize: 14.sp),
                  decoration: buildAppTextInputDecoration(hintText: ''),
                ),
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
              SizedBox(height: 8.sp),
              AppTextFormGroup(
                controller: controller.descCtrl,
                label: 'Ketetapan',
                maxLines: 3,
              ),
              SizedBox(height: 18.sp),
              SizedBox(
                width: double.infinity,
                child: AppFilledButton(
                  label: 'Lanjut',
                  // onTap: controller.submitButton,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 12.sp),
            ],
          ),
        ),
      ),
    );
  }
}
