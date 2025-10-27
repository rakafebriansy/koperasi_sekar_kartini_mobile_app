import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_tabs_profile_controller.dart';

class MainTabsProfileView extends GetView<MainTabsProfileController> {
  const MainTabsProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainTabsProfileView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MainTabsProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
