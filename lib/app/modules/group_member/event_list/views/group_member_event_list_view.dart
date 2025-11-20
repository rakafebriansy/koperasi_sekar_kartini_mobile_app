import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/group_member_event_list_controller.dart';

class GroupMemberEventListView extends GetView<GroupMemberEventListController> {
  const GroupMemberEventListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GroupMemberEventListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GroupMemberEventListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
