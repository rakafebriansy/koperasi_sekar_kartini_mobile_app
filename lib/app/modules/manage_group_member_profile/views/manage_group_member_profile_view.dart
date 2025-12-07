import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_default_wrapper.dart';

import '../controllers/manage_group_member_profile_controller.dart';

class ManageGroupMemberProfileView
    extends GetView<ManageGroupMemberProfileController> {
  const ManageGroupMemberProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppDefaultWrapper(
        ableToBack: true,
        title: poppins('Detail Anggota', fontWeight: FontWeight.w600),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IndexedStack(
                index: controller.selectedScreen,
                children: [
                  // AppRegister1stForm(controller: controller),
                  // AppRegister2ndForm(controller: controller),
                  // AppRegister3rdForm(controller: controller),
                  // AppRegister4thForm(controller: controller),
                  // AppRegister5thForm(controller: controller),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
