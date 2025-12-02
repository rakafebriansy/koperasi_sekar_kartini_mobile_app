import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_employee/controllers/employee_manage_employee_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
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
            controller: controller.phoneCtrl,
            label: 'Nomor Telepon',
            keyboardType: TextInputType.number,
            validator: (value) =>
                value.isRequired('Nomor Telepon') ?? value.isPhoneNumber(),
          ),
          SizedBox(height: 8.sp),
          AppTextFormGroup(
            controller: controller.occupationCtrl,
            label: 'Posisi',
            placeholder: 'Masukkan posisi',
            maxLines: 1,
            validator: (value) => value.isRequired('Pekerjaan'),
          ),
          SizedBox(height: 8.sp),
          poppins('Foto KTP', fontSize: 14.sp, fontWeight: FontWeight.w600),
          AppUploadImageFormField(
            builder: (onPick) {
              return AppStandardUploadImageField(onPick: onPick);
            },
            onPick: (file) async {
              controller.setIdCardImage(file);
            },
            validator: (value) => value.isRequired('Pas Foto'),
          ),
          SizedBox(height: 8.sp),
          poppins('Pas Foto', fontSize: 14.sp, fontWeight: FontWeight.w600),
          AppUploadImageFormField(
            builder: (onPick) {
              return AppStandardUploadImageField(onPick: onPick);
            },
            onPick: (file) async {
              print('object');
              controller.setSelfImage(file);
            },
            validator: (value) => value.isRequired('Pas Foto'),
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
                    onTap: controller.isSubmitted
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
