import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/main/tabs/employee/views/employee_main_tabs_employee_view.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/main/tabs/group/views/employee_main_tabs_group_view.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/main/tabs/home/views/employee_main_tabs_home_view.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/main/tabs/profile/views/employee_main_tabs_profile_view.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../controllers/employee_main_controller.dart';

class EmployeeMainView extends GetView<EmployeeMainController> {
  const EmployeeMainView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PersistentTabView(
        resizeToAvoidBottomInset: true,
        tabs: [
          PersistentTabConfig(
            screen: EmployeeMainTabsHomeView(),
            item: ItemConfig(
              inactiveIcon: Icon(
                Icons.home_outlined,
                color: AppColor.bg.primary.withValues(alpha: 0.7),
              ),
              icon: Icon(
                Icons.home,
                color: AppColor.bg.primary.withValues(alpha: 0.7),
              ),
              textStyle: GoogleFonts.poppins(color: AppColor.bg.primary),
              title: "Beranda",
              activeForegroundColor: AppColor.bg.primary,
            ),
          ),
          PersistentTabConfig(
            screen: EmployeeMainTabsGroupView(),
            item: ItemConfig(
              inactiveIcon: Icon(
                Icons.view_module_outlined,
                color: AppColor.bg.primary.withValues(alpha: 0.7),
              ),
              icon: Icon(
                Icons.view_module,
                color: AppColor.bg.primary.withValues(alpha: 0.7),
              ),
              textStyle: GoogleFonts.poppins(color: AppColor.bg.primary),
              title: "Kelompok",
              activeForegroundColor: AppColor.bg.primary,
            ),
          ),
          PersistentTabConfig(
            screen: EmployeeMainTabsEmployeeView(),
            item: ItemConfig(
              inactiveIcon: Icon(
                Icons.group_outlined,
                color: AppColor.bg.primary.withValues(alpha: 0.7),
              ),
              icon: Icon(
                Icons.group,
                color: AppColor.bg.primary.withValues(alpha: 0.7),
              ),
              textStyle: GoogleFonts.poppins(color: AppColor.bg.primary),
              title: "Karyawan",
              activeForegroundColor: AppColor.bg.primary,
            ),
          ),
          PersistentTabConfig(
            screen: EmployeeMainTabsProfileView(),
            item: ItemConfig(
              inactiveIcon: Icon(
                Icons.person_outlined,
                color: AppColor.bg.primary.withValues(alpha: 0.7),
              ),
              icon: Icon(
                Icons.person,
                color: AppColor.bg.primary.withValues(alpha: 0.7),
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
