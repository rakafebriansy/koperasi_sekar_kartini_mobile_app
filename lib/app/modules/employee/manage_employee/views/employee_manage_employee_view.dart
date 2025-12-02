import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_employee/partials/app_employee_1st_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_employee/partials/app_employee_2nd_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_form_wrapper.dart';

import '../controllers/employee_manage_employee_controller.dart';

class EmployeeManageEmployeeView
    extends GetView<EmployeeManageEmployeeController> {
  const EmployeeManageEmployeeView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppFormWrapper(
      ableToBack: true,
      title: 'Detail Karyawan',
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        controller: controller.scrollController,
        child: Obx(
          () => IndexedStack(
            index: controller.selectedScreen,
            children: [
              AppEmployee1stForm(controller: controller),
              AppEmployee2ndForm(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
