import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/main/tabs/group/views/group_member_main_tabs_group_view.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/main/tabs/home/views/group_member_main_tabs_home_view.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/main/tabs/profile/views/group_member_main_tabs_profile_view.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../controllers/group_member_main_controller.dart';

class GroupMemberMainView extends GetView<GroupMemberMainController> {
  GroupMemberMainView({super.key});

  final double scrollOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PersistentTabView(
        resizeToAvoidBottomInset: true,
        tabs: [
          PersistentTabConfig(
            screen: GroupMemberMainTabsHomeView(),
            item: ItemConfig(
              inactiveIcon: Icon(
                Icons.home_outlined,
                color: AppColor.bg.primary.withOpacity(0.7),
              ),
              icon: Icon(
                Icons.home,
                color: AppColor.bg.primary.withOpacity(0.7),
              ),
              textStyle: GoogleFonts.poppins(color: AppColor.bg.primary),
              title: "Beranda",
              activeForegroundColor: AppColor.bg.primary,
            ),
          ),
          PersistentTabConfig(
            screen: GroupMemberMainTabsGroupView(),
            item: ItemConfig(
              inactiveIcon: Icon(
                Icons.view_module_outlined,
                color: AppColor.bg.primary.withOpacity(0.7),
              ),
              icon: Icon(
                Icons.view_module,
                color: AppColor.bg.primary.withOpacity(0.7),
              ),
              textStyle: GoogleFonts.poppins(color: AppColor.bg.primary),
              title: "Kelompok",
              activeForegroundColor: AppColor.bg.primary,
            ),
          ),
          PersistentTabConfig(
            screen: GroupMemberMainTabsProfileView(),
            item: ItemConfig(
              inactiveIcon: Icon(
                Icons.person_outlined,
                color: AppColor.bg.primary.withOpacity(0.7),
              ),
              icon: Icon(
                Icons.person,
                color: AppColor.bg.primary.withOpacity(0.7),
              ),
              textStyle: GoogleFonts.poppins(color: AppColor.bg.primary),
              title: "Profil",
              activeForegroundColor: AppColor.bg.primary,
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) =>
            Style9BottomNavBar(navBarConfig: navBarConfig),
      ),
    );
  }
}
