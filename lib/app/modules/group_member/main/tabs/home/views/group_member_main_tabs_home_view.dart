import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/int/int_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_event_card.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_notification_bar.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_home_wrapper.dart';

import '../controllers/group_member_main_tabs_home_controller.dart';

class GroupMemberMainTabsHomeView
    extends GetView<GroupMemberMainTabsHomeController> {
  const GroupMemberMainTabsHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppHomeWrapper(
      child: SingleChildScrollView(
        child: Column(
          spacing: 16.sp,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 16.sp,
              children: [
                Expanded(
                  child: _InfoCard(
                    title: 'Simpanan',
                    amount: 1_124_500,
                    route: Routes.GROUP_MEMBER_SAVINGS_LIST,
                  ),
                ),
                Expanded(
                  child: _InfoCard(
                    title: 'Pinjaman',
                    amount: 724_500,
                    route: Routes.GROUP_MEMBER_LOAN_LIST,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: poppins(
                'Notifikasi',
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 10.sp,
              children: [
                AppNotificationBar(
                  message: 'Anda terlambat 3 hari dalam membayar kas!',
                  dateTime: DateTime.now(),
                  type: NotificationBarType.danger,
                  onTap: () {},
                ),
                AppNotificationBar(
                  message:
                      'Reminder : 1 hari  menuju Pertemuan Rutin bulan Oktober 2025',
                  dateTime: DateTime.now(),
                  type: NotificationBarType.info,
                  onTap: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                poppins(
                  'Kegiatan',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  spacing: 6.sp,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton.icon(
                      style: buildInkWellButtonStyle(
                        foregroundColor: AppColor.bg.primary,
                        backgroundColor: AppColor.bg.lightPrimary,
                        overlayColor: AppColor.bg.transparentPrimary.withValues(
                          alpha: 0.2,
                        ),
                        borderRadiusCircularSize: 12.sp,
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.MANAGE_EVENT);
                      },
                      label: poppins('Tambah', color: AppColor.bg.primary),
                      icon: Icon(Icons.add, color: AppColor.bg.primary),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(99.sp),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.EVENT_LIST);
                        },
                        borderRadius: BorderRadius.circular(99.sp),
                        child: Container(
                          height: 36.sp,
                          width: 36.sp,
                          decoration: BoxDecoration(
                            color: AppColor.bg.lightPrimary,
                            borderRadius: BorderRadius.circular(99.sp),
                          ),
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            color: AppColor.bg.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 10.sp,
              children: [
                ...DummyHelper.events
                    .map(
                      (event) => AppEventCard(
                        model: event,
                        onTap: () {
                          Get.toNamed(Routes.EVENT_DETAIL);
                        },
                      ),
                    )
                    .toList(),
                SizedBox(height: 10.sp),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.title,
    required this.amount,
    required this.route,
    this.navigationCallback,
  });

  final String title;
  final int amount;
  final String route;
  final Function? navigationCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: AppColor.bg.transparentPrimary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.sp,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(6.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.sp),
                  color: AppColor.bg.primary,
                ),
                child: SvgPicture.asset(AppAsset.svgs.moneyWhite),
              ),
              SizedBox(width: 8.sp),
              poppins(title),
            ],
          ),
          poppins(
            amount.toIdr(),
            fontWeight: FontWeight.bold,
            color: AppColor.bg.primary,
            fontSize: 14.sp,
          ),
          AppFilledButton(
            label: 'Lihat Detail',
            onTap: () async {
              await Get.toNamed(route);
              if (navigationCallback != null) navigationCallback!();
            },
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            height: 32.sp,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
