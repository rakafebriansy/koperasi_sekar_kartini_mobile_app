import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_tabs_group_controller.dart';

class MainTabsGroupView extends GetView<MainTabsGroupController> {
  const MainTabsGroupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainTabsGroupView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MainTabsGroupView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
