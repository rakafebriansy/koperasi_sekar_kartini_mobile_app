import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/employee_main_tabs_home_controller.dart';

class EmployeeMainTabsHomeView extends GetView<EmployeeMainTabsHomeController> {
  const EmployeeMainTabsHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EmployeeMainTabsHomeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EmployeeMainTabsHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
