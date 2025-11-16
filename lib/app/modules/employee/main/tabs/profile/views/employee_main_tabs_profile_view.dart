import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/employee_main_tabs_profile_controller.dart';

class EmployeeMainTabsProfileView
    extends GetView<EmployeeMainTabsProfileController> {
  const EmployeeMainTabsProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EmployeeMainTabsProfileView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EmployeeMainTabsProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
