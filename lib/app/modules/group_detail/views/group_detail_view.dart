import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_detail/partials/app_group_fund_amount_list.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_detail/partials/app_joint_liability_fund_amount_list.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_detail/partials/app_social_fund_amount_list.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_detail/widgets/group_info_cell.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_default_tabbar.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_default_wrapper.dart';

import '../controllers/group_detail_controller.dart';

class GroupDetailView extends GetView<GroupDetailController> {
  const GroupDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    GroupModel group = DummyHelper.dummyGroups[0];
    return AppDefaultWrapper(
      ableToBack: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10.sp,
        children: [
          Column(
            spacing: 10.sp,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 10.sp,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: buildInkWellButtonStyle(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.sp,
                        vertical: 8.sp,
                      ),
                      foregroundColor: AppColor.bg.primary,
                      backgroundColor: AppColor.bg.lightPrimary,
                      overlayColor: AppColor.bg.transparentPrimary.withOpacity(
                        0.2,
                      ),
                      borderRadiusCircularSize: 12.sp,
                    ),
                    onPressed: () {},
                    child: poppins(
                      'Detail Anggota',
                      color: AppColor.bg.primary,
                    ),
                  ),
                  ElevatedButton(
                    style: buildInkWellButtonStyle(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.sp,
                        vertical: 8.sp,
                      ),
                      foregroundColor: AppColor.bg.primary,
                      backgroundColor: AppColor.bg.lightPrimary,
                      overlayColor: AppColor.bg.transparentPrimary.withOpacity(
                        0.2,
                      ),
                      borderRadiusCircularSize: 12.sp,
                    ),
                    onPressed: () {},
                    child: poppins('Atur Rapot', color: AppColor.bg.primary),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(18.sp),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.sp, color: AppColor.bg.gray),
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 16.sp,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        poppins(
                          'Kelompok ${group.number}',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 2.sp),
                        poppins(
                          group.workArea.districtName,
                          color: AppColor.text.gray,
                        ),
                      ],
                    ),
                    Column(
                      spacing: 3.sp,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GroupInfoCell(
                          icon: Icon(Icons.phone, color: AppColor.bg.primary),
                          field: 'Nomor',
                          value: '087665253441',
                        ),
                        GroupInfoCell(
                          icon: Icon(
                            Icons.person_4,
                            color: AppColor.bg.primary,
                          ),
                          field: 'PPK',
                          value: group.facilitator!.name,
                        ),
                        GroupInfoCell(
                          icon: Icon(Icons.person, color: AppColor.bg.primary),
                          field: 'PJK',
                          value: group.chairman!.name,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 2.sp, 0, 0),
                child: poppins(
                  'Riwayat',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
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
      title: poppins('Detail Kelompok', fontWeight: FontWeight.w600),
    );
  }
}
