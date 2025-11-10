import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/builders/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_event_card.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_notification_card.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_home_wrapper.dart';

import '../controllers/main_tabs_home_controller.dart';

class MainTabsHomeView extends GetView<MainTabsHomeController> {
  const MainTabsHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppHomeWrapper(
      child: Column(
        spacing: 16.sp,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 16.sp,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(14.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.sp),
                    color: AppColor.transparentPrimary,
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
                              color: AppColor.primary,
                            ),
                            child: SvgPicture.asset(AppAsset.svgs.moneyWhite),
                          ),
                          SizedBox(width: 8.sp),
                          Text('Simpanan', style: GoogleFonts.poppins()),
                        ],
                      ),
                      Text(
                        'Rp 1.124.500',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: AppColor.primary,
                          fontSize: 14.sp,
                        ),
                      ),
                      AppFilledButton(
                        label: 'Lihat Detail',
                        onTap: () {},
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        height: 32.sp,
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(14.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.sp),
                    color: AppColor.transparentPrimary,
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
                              color: AppColor.primary,
                            ),
                            child: SvgPicture.asset(AppAsset.svgs.moneyWhite),
                          ),
                          SizedBox(width: 8.sp),
                          Text('Pinjaman', style: GoogleFonts.poppins()),
                        ],
                      ),
                      Text(
                        'Rp 1.124.500',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: AppColor.primary,
                          fontSize: 14.sp,
                        ),
                      ),
                      AppFilledButton(
                        label: 'Lihat Detail',
                        onTap: () {},
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        height: 32.sp,
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Notifikasi',
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 10.sp,
            children: [
              AppNotificationCard(
                message: 'Anda terlambat 3 hari dalam membayar kas!',
                dateTime: DateTime.now(),
                type: NotificationBarType.danger,
                onTap: () {},
              ),
              AppNotificationCard(
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
              Text(
                'Kegiatan',
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                spacing: 6.sp,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                    style: buildInkWellButtonStyle(
                      foregroundColor: AppColor.primary,
                      backgroundColor: AppColor.lightPrimary,
                      overlayColor: AppColor.transparentPrimary.withOpacity(
                        0.2,
                      ),
                      borderRadiusCircularSize: 12.sp,
                    ),
                    onPressed: () {},
                    label: Text(
                      'Tambah',
                      style: GoogleFonts.poppins(color: AppColor.primary),
                    ),
                    icon: Icon(Icons.add, color: AppColor.primary),
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(99.sp),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(99.sp),
                      child: Container(
                        height: 36.sp,
                        width: 36.sp,
                        decoration: BoxDecoration(
                          color: AppColor.lightPrimary,
                          borderRadius: BorderRadius.circular(99.sp),
                        ),
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: 10.sp,
                children: [
                  ...DummyHelper.dummyEvents
                      .map((event) => AppEventCard(model: event, onTap: () {}))
                      .toList(),
                  SizedBox(height: 10.sp),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
