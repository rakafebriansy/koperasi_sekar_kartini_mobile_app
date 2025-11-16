import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/employee_main_tabs_employee_controller.dart';

class EmployeeMainTabsEmployeeView
    extends GetView<EmployeeMainTabsEmployeeController> {
  const EmployeeMainTabsEmployeeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EmployeeMainTabsEmployeeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EmployeeMainTabsEmployeeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
