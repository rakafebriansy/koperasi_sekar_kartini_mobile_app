import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/main/tabs/group/partials/app_candidate_group_member_list.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/main/tabs/group/partials/app_group_list.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/main/tabs/group/partials/app_group_member_list.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
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
          child: AppTextFormField(
            controller: controller.searchCtrl,
            hintText: 'Cari',
            prefixIcon: SvgPicture.asset(
              AppAsset.svgs.searchGray,
              height: 16.sp,
            ),
          ),
        ),
        views: [
          AppGroupList(controller: controller.mainController),
          AppGroupMemberList(controller: controller.mainController),
          AppCandidateGroupMemberList(controller: controller.mainController),
        ],
        tabLabels: ['Kelompok', 'Anggota', 'Calon'],
      ),
    );
  }
}
