import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/main/tabs/group/views/main_tabs_group_view.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/main/tabs/home/views/main_tabs_home_view.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/main/tabs/profile/views/main_tabs_profile_view.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  MainView({super.key});

  final double scrollOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PersistentTabView(
        resizeToAvoidBottomInset: true,
        tabs: [
          PersistentTabConfig(
            screen: MainTabsHomeView(),
            item: ItemConfig(icon: Icon(Icons.home), title: "Beranda"),
          ),
          PersistentTabConfig(
            screen: MainTabsGroupView(),
            item: ItemConfig(icon: Icon(Icons.view_module), title: "Kelompok"),
          ),
          PersistentTabConfig(
            screen: MainTabsProfileView(),
            item: ItemConfig(icon: Icon(Icons.person), title: "Profil"),
          ),
        ],
        navBarBuilder: (navBarConfig) =>
            Style9BottomNavBar(navBarConfig: navBarConfig),
      ),
    );
  }
}
