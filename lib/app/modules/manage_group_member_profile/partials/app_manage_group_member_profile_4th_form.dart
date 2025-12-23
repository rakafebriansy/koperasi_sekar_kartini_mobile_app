import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/manage_group_member_profile/controllers/manage_group_member_profile_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_big_edit_image_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_upload_image_form_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/file_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';

class AppManageGroupMemberProfile4thForm extends StatelessWidget {
  const AppManageGroupMemberProfile4thForm({
    super.key,
    required this.controller,
  });

  final ManageGroupMemberProfileController controller;
  @override
  Widget build(BuildContext context) {
    final role = controller.authController.currentUser!.role;
    return Obx(
      () => Form(
        key: controller.fourthFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            poppins('Foto KTA', fontSize: 14.sp, fontWeight: FontWeight.w600),
            SizedBox(height: 4.sp),
            AppUploadImageFormField(
              builder: (onPick) {
                return AppBigEditImageField(
                  onPick: onPick,
                  readOnly: role != 'group_member',
                  readOnlyValue: (role != 'group_member')
                      ? controller.user!.memberCardPhoto
                      : null,
                );
              },
              onPick: (file) async {
                controller.setIdCardImage(file);
              },
              validator: (value) => value.isRequired('Foto KTA'),
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
                  child: role == 'group_member'
                      ? AppFilledButton(
                          width: double.infinity,
                          label: 'Daftar',
                          onTap: controller.isSubmitted
                              ? null
                              : controller.submitButton,
                        )
                      : AppFilledButton(
                          width: double.infinity,
                          label: controller.user!.isActive
                              ? 'Nonaktifkan'
                              : 'Aktifkan',
                          onTap: controller.isSubmitted
                              ? null
                              : controller.submitButton,
                        ),
                ),
              ],
            ),
            SizedBox(height: 12.sp),
          ],
        ),
      ),
    );
  }
}
