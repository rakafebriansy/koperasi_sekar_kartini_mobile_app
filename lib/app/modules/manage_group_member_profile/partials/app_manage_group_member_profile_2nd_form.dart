import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/manage_group_member_profile/controllers/manage_group_member_profile_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/text_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_date_input_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';

class AppManageGroupMemberProfile2ndForm extends StatelessWidget {
  const AppManageGroupMemberProfile2ndForm({super.key, required this.controller});

  final ManageGroupMemberProfileController controller;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.secondFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          poppins(
            'Tanggal Lahir',
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
          AppDateInputField(
            controller: controller.birthDateCtrl,
            placeholder: 'Masukkan tanggal lahir',
            label: 'Tanggal Lahir',
          ),
          SizedBox(height: 8.sp),
          AppTextFormGroup(
            controller: controller.occupationCtrl,
            label: 'Pekerjaan',
            placeholder: 'Masukkan pekerjaan',
            maxLines: 1,
            validator: (value) => value.isRequired('Pekerjaan'),
          ),
          SizedBox(height: 8.sp),
          AppTextFormGroup(
            controller: controller.phoneCtrl,
            label: 'Nomor Telepon',
            keyboardType: TextInputType.number,
            maxLines: 1,
            placeholder: 'Masukkan no telp',
            validator: (value) =>
                value.isRequired('Nomor Telepon') ?? value.isPhoneNumber(),
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
                  width: double.infinity,
                  label: 'Lanjut',
                  onTap: controller.submitButton,
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
