import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/savings_list_controller.dart';

class SavingsListView extends GetView<SavingsListController> {
  const SavingsListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SavingsListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SavingsListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
