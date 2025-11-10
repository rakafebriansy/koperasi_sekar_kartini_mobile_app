import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_home_wrapper.dart';

import '../controllers/main_tabs_group_controller.dart';

class MainTabsGroupView extends GetView<MainTabsGroupController> {
  const MainTabsGroupView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppHomeWrapper(
      child: Text('data')
    );
  }
}
