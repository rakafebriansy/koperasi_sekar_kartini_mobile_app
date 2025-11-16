import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/register/controllers/register_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/register/widgets/UploadImageField.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';

class AppRegister5thForm extends StatelessWidget {
  const AppRegister5thForm({super.key, required this.controller});

  final RegisterController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            UploadImageField(
              imageFile: controller.selfImage,
              func: controller.pickSelfImage,
            ),
            SizedBox(height: 20.sp),
            Container(
              child: AppFilledButton(
                width: double.infinity,
                label: 'Daftar',
                onTap: () {
print('ok');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
