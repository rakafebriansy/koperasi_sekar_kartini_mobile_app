import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_home_wrapper.dart';

import '../controllers/main_tabs_profile_controller.dart';

class MainTabsProfileView extends GetView<MainTabsProfileController> {
  const MainTabsProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppHomeWrapper(
      child: Center(child: Text('data')),
    );
  }
}
