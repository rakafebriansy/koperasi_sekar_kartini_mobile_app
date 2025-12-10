import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/num/num_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';

class AppSocialFundAmountList extends StatelessWidget {
  const AppSocialFundAmountList({super.key, required this.controller});

  final GetxController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 12.sp,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 4.sp),
          ...List.generate(6, (context) => _FundCard()),
          SizedBox(height: 4.sp),
        ],
      ),
    );
  }
}

class _FundCard extends StatelessWidget {
  const _FundCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.border.lightGray),
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Column(
        spacing: 12.sp,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10.sp,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.bg.lightPrimary,
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                    padding: EdgeInsets.all(8.sp),
                    child: Icon(Icons.arrow_downward_rounded),
                  ),
                  poppins('Dana Sosial', fontWeight: FontWeight.w600),
                ],
              ),
              poppins('30/10/2019', color: AppColor.text.gray),
            ],
          ),
          Column(
            spacing: 4.sp,
            children: [
              _FundInfoCell(
                icon: SvgPicture.asset(AppAsset.svgs.calendarPrimary),
                field: 'Bulan',
                value: poppins('Oktober'),
              ),
              _FundInfoCell(
                icon: SvgPicture.asset(AppAsset.svgs.morePrimary),
                field: 'Total Kas',
                value: poppins(
                  300000.toIdr(decimalDigits: 2),
                  fontWeight: FontWeight.bold,
                  color: AppColor.bg.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FundInfoCell extends StatelessWidget {
  const _FundInfoCell({
    
    required this.icon,
    required this.field,
    required this.value,
  });

  final SvgPicture icon;
  final String field;
  final Text value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4.sp,
          children: [
            icon,
            poppins(field, color: AppColor.text.gray),
          ],
        ),
        value,
      ],
    );
  }
}
