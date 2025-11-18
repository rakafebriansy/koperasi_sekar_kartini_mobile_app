import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/main/controllers/employee_main_controller.dart';

class EmployeeMainTabsGroupController extends GetxController {
  TextEditingController searchCtrl = TextEditingController();

  EmployeeMainController mainController = Get.find<EmployeeMainController>();
}
