import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_notification_card.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_home_wrapper.dart';

import '../controllers/main_tabs_home_controller.dart';

class MainTabsHomeView extends GetView<MainTabsHomeController> {
  const MainTabsHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppHomeWrapper(
      child: SingleChildScrollView(
        child: Column(
          spacing: 16.sp,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                SizedBox(width: 16.sp),
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
              spacing: 8.sp,
              children: [
                AppNotificationCard(
                  message: 'Anda terlambat 3 hari dalam membayar kas!',
                  dateTime: DateTime.now(),
                  type: NotificationBarType.danger,
                ),
                AppNotificationCard(
                  message: 'Reminder : 1 hari  menuju Pertemuan Rutin bulan Oktober 2025',
                  dateTime: DateTime.now(),
                  type: NotificationBarType.info,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
