import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/employee_detail/partials/app_employee_1st_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/employee_detail/partials/app_employee_2nd_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/employee_detail/partials/app_employee_3rd_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_form_wrapper.dart';

import '../controllers/employee_employee_detail_controller.dart';

class EmployeeEmployeeDetailView
    extends GetView<EmployeeEmployeeDetailController> {
  const EmployeeEmployeeDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppFormWrapper(
      ableToBack: true,
      title: 'Detail Karyawan',
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
                    AppEmployee1stForm(controller: controller),
                    AppEmployee2ndForm(controller: controller),
                    AppEmployee3rdForm(controller: controller),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
