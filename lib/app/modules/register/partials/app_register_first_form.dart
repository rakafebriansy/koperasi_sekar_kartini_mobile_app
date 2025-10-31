import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/register/controllers/register_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_constants.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/builders/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/region_model/list_region_model_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';

class AppRegisterFirstForm extends StatelessWidget {
  const AppRegisterFirstForm({super.key, required this.controller});

  final RegisterController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppTextFormGroup(controller: controller.regNumberCtrl, label: 'NIK'),
        SizedBox(height: 8.sp),
        AppTextFormGroup(
          controller: controller.nameCtrl,
          label: 'Nama Lengkap',
        ),
        SizedBox(height: 8.sp),
        Text(
          'Wilayah Kerja',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        DropdownSearch<String>(
          enabled: controller.regionModelData.isNotEmpty,
          key: AppConstants.appFormKey.register_dropdownSearch,
          selectedItem: controller.selectedRegionModel.value?.name,
          items: (filter, infiniteScrollProps) =>
              controller.regionModelData.names,
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
                child: Text(item, style: GoogleFonts.poppins(fontSize: 14.sp)),
              ),
            ),
          ),
        ),
        SizedBox(height: 8.sp),
        AppTextFormGroup(
          controller: controller.nameCtrl,
          label: 'Alamat Lengkap',
          maxLines: 3,
        ),
      ],
    );
  }
}
