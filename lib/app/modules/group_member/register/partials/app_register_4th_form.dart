import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/register/controllers/register_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/register/widgets/UploadImageFormField.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/file_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';

class AppRegister4thForm extends StatelessWidget {
  const AppRegister4thForm({super.key, required this.controller});

  final RegisterController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: controller.fourthFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            UploadImageFormField(
              onPick: (file) async {
                controller.setIdCardImage(file);
              },
              validator: (value) => value.isRequired('Foto KTP'),
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
      ),
    );
  }
}
