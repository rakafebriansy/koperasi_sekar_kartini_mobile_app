import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_employee/controllers/employee_manage_employee_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/action_type/action_type_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/file_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/text_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_standard_upload_image_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_upload_image_form_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';

class AppEmployee2ndForm extends StatelessWidget {
  const AppEmployee2ndForm({super.key, required this.controller});

  final EmployeeManageEmployeeController controller;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.secondFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextFormGroup(
            controller: controller.addressCtrl,
            label: 'Alamat Lengkap',
            maxLines: 2,
            placeholder: 'Masukkan alamat',
            validator: (value) => value.isRequired('Alamat Lengkap'),
          ),
          SizedBox(height: 8.sp),
          poppins('Foto KTP', fontSize: 14.sp, fontWeight: FontWeight.w600),
          AppUploadImageFormField(
            builder: (onPick) {
              return AppStandardUploadImageField(
                onPick: onPick,
                textButton: 'Ubah',
              );
            },
            onPick: (file) async {
              controller.setIdCardImage(file);
            },
            validator: (value) =>
                controller.action != null && controller.action!.isCreateAction
                ? value.isRequired('Pas Foto')
                : null,
          ),
          SizedBox(height: 8.sp),
          poppins('Foto Diri', fontSize: 14.sp, fontWeight: FontWeight.w600),
          SizedBox(height: 4.sp),
          AppUploadImageFormField(
            builder: (onPick) {
              return AppStandardUploadImageField(
                onPick: onPick,
                textButton: 'Ubah',
              );
            },
            onPick: (file) async {
              controller.setSelfImage(file);
            },
            validator: (value) =>
                controller.action != null && controller.action!.isCreateAction
                ? value.isRequired('Foto Diri')
                : null,
          ),
          SizedBox(height: 8.sp),
          poppins('Foto Kartu Anggota', fontSize: 14.sp, fontWeight: FontWeight.w600),
          SizedBox(height: 4.sp),
          AppUploadImageFormField(
            builder: (onPick) {
              return AppStandardUploadImageField(
                onPick: onPick,
                textButton: 'Ubah',
              );
            },
            onPick: (file) async {
              controller.setMemberCardImage(file);
            },
          ),
          SizedBox(height: 18.sp),
          Row(
            spacing: 12.sp,
            children: [
              if (controller.selectedScreen > 0)
                Material(
                  child: InkWell(
                    onTap: controller.prevScreen,
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
                child: Obx(
                  () => AppFilledButton(
                    label: 'Simpan',
                    onTap:
                        controller.isSubmitted ||
                            (controller.authController.currentUser != null &&
                                controller.authController.currentUser!.role !=
                                    'admin')
                        ? null
                        : controller.submitButton,
                    width: double.infinity,
                  ),
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
