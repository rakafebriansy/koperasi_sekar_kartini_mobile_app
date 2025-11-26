import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_report/partials/app_report_1st_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_report/partials/app_report_2nd_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_report/partials/app_report_3rd_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_report/partials/app_report_4th_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_report/partials/app_report_5th_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_report/partials/app_report_6th_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_form_wrapper.dart';

import '../controllers/employee_manage_report_controller.dart';

class EmployeeManageReportView extends GetView<EmployeeManageReportController> {
  const EmployeeManageReportView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppFormWrapper(
      ableToBack: true,
      title: 'Detail Rapot',
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
                    AppReport1stForm(controller: controller),
                    AppReport2ndForm(controller: controller),
                    AppReport3rdForm(controller: controller),
                    AppReport4thForm(controller: controller),
                    AppReport5thForm(controller: controller),
                    AppReport6thForm(controller: controller),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
