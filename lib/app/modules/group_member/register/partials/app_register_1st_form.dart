import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/register/controllers/register_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/text_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_link_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/list/list_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';

class AppRegister1stForm extends StatelessWidget {
  const AppRegister1stForm({super.key, required this.controller});

  final RegisterController controller;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.firstFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextFormGroup(
            controller: controller.identityNumberCtrl,
            label: 'NIK',
            placeholder: 'Masukkan NIK',
            maxLines: 1,
            validator: (value) => value.isRequired('NIK') ?? value.exactLength(16, 'NIK'),
          ),
          SizedBox(height: 8.sp),
          AppTextFormGroup(
            controller: controller.nameCtrl,
            label: 'Nama Lengkap',
            maxLines: 1,
            placeholder: 'Masukkan nama',
            validator: (value) => value.isRequired('Nama Lengkap') ?? value.minLength(3, 'Nama Lengkap'),
          ),
          SizedBox(height: 8.sp),
          poppins(
            'Wilayah Kerja',
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
          DropdownSearch<String>(
            validator: (value) => value.isRequired('Wilayah Kerja'),
            enabled: DummyHelper.workAreas.isNotEmpty,
            selectedItem: controller.selectedWorkArea.value?.name,
            items: (filter, infiniteScrollProps) => DummyHelper.workAreas.names,
            decoratorProps: DropDownDecoratorProps(
              baseStyle: GoogleFonts.poppins(fontSize: 14.sp),
              decoration: buildAppTextInputDecoration(hintText: 'Pilih wilayah kerja'),
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
            controller: controller.addressCtrl,
            label: 'Alamat Lengkap',
            maxLines: 2,
            placeholder: 'Masukkan alamat',
            validator: (value) => value.isRequired('Alamat Lengkap'),
          ),
          SizedBox(height: 18.sp),
          AppFilledButton(
            width: double.infinity,
            label: 'Lanjut',
            onTap: controller.submitButton,
          ),
          SizedBox(height: 12.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  poppins('Sudah punya akun?', fontSize: 12.sp),
                  SizedBox(width: 6.sp),
                  AppLinkButton(
                    link: Routes.LOGIN,
                    label: 'Login',
                    isPath: true,
                    fontSize: 12.sp,
                  ),
                ],)
        ],
      ),
    );
  }
}
