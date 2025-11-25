import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_default_tabbar.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_group_info_cell.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_group_fund_amount_list.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_joint_liability_fund_amount_list.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_social_fund_amount_list.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_default_wrapper.dart';

import '../controllers/group_member_fund_list_controller.dart';

class GroupMemberFundListView extends GetView<GroupMemberFundListController> {
  const GroupMemberFundListView({super.key});
  @override
  Widget build(BuildContext context) {
    GroupModel group = DummyHelper.dummyGroups[0];
    return AppDefaultWrapper(
      ableToBack: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10.sp,
        children: [
          Expanded(
            child: AppDefaultTabbar(
              views: [
                AppJointLiabilityFundAmountList(controller: controller),
                AppGroupFundAmountList(controller: controller),
                AppSocialFundAmountList(controller: controller),
              ],
              tabLabels: ['Kas T.R.', 'Kas Kel.', 'Dana Sosial'],
            ),
          ),
        ],
      ),
      title: poppins('Pembayaran Kas', fontWeight: FontWeight.w600),
    );
  }
}
