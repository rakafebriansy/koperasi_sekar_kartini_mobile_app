import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/builders/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/int/int_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_home_wrapper.dart';

import '../controllers/main_tabs_group_controller.dart';

class MainTabsGroupView extends GetView<MainTabsGroupController> {
  const MainTabsGroupView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppHomeWrapper(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 12.sp,
              children: [
                _RoundIconButton(
                  SvgPicture.asset(
                    AppAsset.svgs.exclamationMarkPrimary,
                    width: 20.sp,
                    height: 20.sp,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  padding: EdgeInsets.all(12.sp),
                  child: Row(
                    spacing: 12.sp,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //TODO: dynamic
                      Container(
                        width: 40.sp,
                        height: 40.sp,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Center(
                          child: poppins(
                            '1',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      poppins(
                        'Kelompok 1',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                      SizedBox(width: 4.sp),
                    ],
                  ),
                ),
                _RoundIconButton(
                  SvgPicture.asset(
                    AppAsset.svgs.editPrimary,
                    width: 16.sp,
                    height: 16.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton(this.icon, {super.key});

  final SvgPicture icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.lightPrimary,
        border: Border.all(color: AppColor.primary, width: 2.sp),
        borderRadius: BorderRadius.circular(999),
      ),
      height: 40.sp,
      width: 40.sp,
      child: Center(child: icon),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    super.key,
    required this.title,
    required this.amount,
    required this.route,
  });

  final String title;
  final int amount;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              poppins(title),
            ],
          ),
          poppins(
            amount.toIdr(),
            fontWeight: FontWeight.bold,
            color: AppColor.primary,
            fontSize: 14.sp,
          ),
          AppFilledButton(
            label: 'Lihat Detail',
            onTap: () async {
              await Get.toNamed(route);
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
