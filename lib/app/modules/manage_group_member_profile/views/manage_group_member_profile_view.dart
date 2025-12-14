import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/manage_group_member_profile/partials/app_manage_group_member_profile_1st_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/manage_group_member_profile/partials/app_manage_group_member_profile_2nd_Form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/manage_group_member_profile/partials/app_manage_group_member_profile_3rd_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/manage_group_member_profile/partials/app_manage_group_member_profile_4th_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_form_wrapper.dart';

import '../controllers/manage_group_member_profile_controller.dart';

class ManageGroupMemberProfileView
    extends GetView<ManageGroupMemberProfileController> {
  const ManageGroupMemberProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppFormWrapper(
        ableToBack: true,
        title: 'Detail Anggota',
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: controller.user != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IndexedStack(
                      index: controller.selectedScreen,
                      children: [
                        AppManageGroupMemberProfile1stForm(
                          controller: controller,
                        ),
                        if (AuthController.find.currentUser!.role ==
                            'group_member')
                          AppManageGroupMemberProfile2ndForm(
                            controller: controller,
                          ),
                        AppManageGroupMemberProfile3rdForm(
                          controller: controller,
                        ),
                        AppManageGroupMemberProfile4thForm(
                          controller: controller,
                        ),
                      ],
                    ),
                  ],
                )
              : SizedBox(
                  height: getScreenHeight(context, scale: 0.76),
                  child: Center(child: CircularProgressIndicator()),
                ),
        ),
      ),
    );
  }
}
