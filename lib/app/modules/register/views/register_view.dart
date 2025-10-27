import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_constants.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/builders/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/region_model/list_region_model_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_link_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_default_wrapper.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppDefaultWrapper(
      ableToBack: false,
      title: Text(
        'Register',
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
      ),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        controller: controller.scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hallo!',
              style: GoogleFonts.poppins(
                fontSize: 36.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
              ),
            ),
            SizedBox(height: 12.sp),
            Text(
              'Daftarkan dirimu menjadi bagian dari Koperasi Konsumen Wanita Sekar Kartini Jember!',
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: AppColor.primary,
              ),
            ),
            SizedBox(height: 16.sp),
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
                baseStyle: GoogleFonts.poppins(
                  fontSize: 14.sp,
                ),
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
                    child: Text(
                      item,
                      style: GoogleFonts.poppins(fontSize: 14.sp),
                    ),
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
            SizedBox(height: 18.sp),
            AppFilledButton(
              label: 'Lanjut',
              onClick: () {},
              width: double.infinity,
            ),
            SizedBox(height: 12.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sudah punya akun?',
                  style: GoogleFonts.poppins(fontSize: 12.sp),
                ),
                SizedBox(width: 6.sp),
                AppLinkButton(
                  link: Routes.LOGIN,
                  label: 'Login',
                  isPath: true,
                  fontSize: 12.sp,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
