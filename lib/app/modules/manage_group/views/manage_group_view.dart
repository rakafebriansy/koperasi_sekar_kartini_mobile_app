import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/manage_group/partials/app_group_1st_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/manage_group/partials/app_group_2nd_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_form_wrapper.dart';

import '../controllers/manage_group_controller.dart';

class ManageGroupView extends GetView<ManageGroupController> {
  const ManageGroupView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppFormWrapper(
      ableToBack: true,
      title: 'Detail Kelompok',
      child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          controller: controller.scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                ()=> IndexedStack(
                  index: controller.selectedScreen,
                  children: [
                    AppGroup1stForm(controller: controller),
                    AppGroup2ndForm(controller: controller),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
