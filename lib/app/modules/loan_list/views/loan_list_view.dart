import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/loan_list_controller.dart';

class LoanListView extends GetView<LoanListController> {
  const LoanListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoanListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LoanListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
