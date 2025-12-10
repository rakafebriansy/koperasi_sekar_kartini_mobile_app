import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/num/num_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_date_input_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_default_wrapper.dart';

import '../controllers/savings_list_controller.dart';

class SavingsListView extends GetView<SavingsListController> {
  const SavingsListView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppDefaultWrapper(
      withPadding: false,
      ableToBack: true,
      title: poppins('Riwayat Simpanan', fontWeight: FontWeight.w600),
      child: Container(
        padding: EdgeInsets.all(16.sp),
        height: getScreenHeight(context),
        child: Column(
          spacing: 12.sp,
          children: [
            Row(
              spacing: 10.sp,
              children: [
                Expanded(
                  // child: AppTextFormField(
                  //   controller: controller.searchCtrl,
                  //   hintText: 'Cari',
                  //   prefixIcon: SvgPicture.asset(
                  //     AppAsset.svgs.searchGray,
                  //     height: 16.sp,
                  //   ),
                  // ),
                  child: AppDateInputField(
                    prefixIcon: SvgPicture.asset(
                      AppAsset.svgs.searchGray,
                      height: 16.sp,
                    ),
                    controller: controller.searchCtrl,
                    placeholder: 'Cari...',
                  ),
                ),
                // Material(
                //   borderRadius: BorderRadius.circular(12.sp),
                //   color: Colors.white,
                //   child: InkWell(
                //     borderRadius: BorderRadius.circular(12.sp),
                //     onTap: () {},
                //     child: Container(
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //           width: 1.sp,
                //           color: AppColor.border.lightGray,
                //         ),
                //         borderRadius: BorderRadius.circular(12.sp),
                //       ),
                //       padding: EdgeInsets.all(16.sp),
                //       child: Center(
                //         child: SvgPicture.asset(
                //           AppAsset.svgs.calendarPrimary,
                //           height: 16.sp,
                //           width: 16.sp,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 16.sp,
                  children: List.generate(6, (context) => _LoanCard()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoanCard extends StatelessWidget {
  const _LoanCard({super.key});

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
                  poppins('Simpanan Pokok', fontWeight: FontWeight.w600),
                ],
              ),
              poppins('30/10/2019', color: AppColor.text.gray),
            ],
          ),
          Column(
            spacing: 4.sp,
            children: [
              _LoanInfoCell(
                icon: SvgPicture.asset(AppAsset.svgs.calendarPrimary),
                field: 'Bulan',
                value: poppins('Oktober'),
              ),
              _LoanInfoCell(
                icon: SvgPicture.asset(AppAsset.svgs.morePrimary),
                field: 'Total Simpanan',
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

class _LoanInfoCell extends StatelessWidget {
  const _LoanInfoCell({
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
