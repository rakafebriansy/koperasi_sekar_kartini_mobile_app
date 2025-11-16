import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/employee_main_tabs_group_controller.dart';

class EmployeeMainTabsGroupView
    extends GetView<EmployeeMainTabsGroupController> {
  const EmployeeMainTabsGroupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EmployeeMainTabsGroupView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EmployeeMainTabsGroupView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
