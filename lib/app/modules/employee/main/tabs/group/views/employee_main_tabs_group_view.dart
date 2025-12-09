import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/main/tabs/group/partials/app_candidate_group_member_list.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/main/tabs/group/partials/app_group_list.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/main/tabs/group/partials/app_group_member_list.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_default_tabbar.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_text_form_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_home_wrapper.dart';

import '../controllers/employee_main_tabs_group_controller.dart';

class EmployeeMainTabsGroupView
    extends GetView<EmployeeMainTabsGroupController> {
  const EmployeeMainTabsGroupView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppHomeWrapper(
      withPadding: false,
      ableToBack: false,
      child: AppDefaultTabbar(
        tabBarPadding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 14.sp),
        header: Padding(
          padding: EdgeInsets.fromLTRB(16.sp, 8.sp, 16.sp, 0.sp),
          child: Obx(
            () => AppTextFormField(
              onChanged: (val) => controller.changeSearchText(val),
              controller: controller.searchCtrl,
              hintText: controller.searchPlaceholder,
              prefixIcon: Icon(
                Icons.search,
                size: 20.sp,
                color: AppColor.border.darkGray,
              ),
            ),
          ),
        ),
        onTabChanged: (index) {
          controller.changeTabIndex(index);
        },
        views: [
          AppGroupList(controller: controller),
          AppGroupMemberList(controller: controller),
          AppCandidateGroupMemberList(controller: controller),
        ],
        tabLabels: ['Kelompok', 'Anggota', 'Nonaktif'],
      ),
    );
  }
}
