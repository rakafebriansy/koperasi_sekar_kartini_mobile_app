import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_text_form_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_default_wrapper.dart';

import '../controllers/report_list_controller.dart';

class ReportListView extends GetView<ReportListController> {
  const ReportListView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppDefaultWrapper(
      withPadding: false,
      ableToBack: true,
      title: poppins('Daftar Rapor', fontWeight: FontWeight.w600),
      child: Container(
        padding: EdgeInsets.all(16.sp),
        height: MediaQuery.of(context).size.height,
        child: Column(
          spacing: 12.sp,
          children: [
            Row(
              spacing: 10.sp,
              children: [
                Expanded(
                  child: AppTextFormField(
                    controller: controller.searchCtrl,
                    hintText: 'Cari',
                    prefixIcon: SvgPicture.asset(
                      AppAsset.svgs.searchGray,
                      height: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
            Divider(height: 1, color: AppColor.border.lightGray),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 16.sp,
                  children: List.generate(6, (context) => _ReportCard()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReportCard extends StatelessWidget {
  const _ReportCard();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.sp),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.bg.primary,
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Positioned(
              top: -110,
              left: -70,
              child: Image.asset(AppAsset.images.subtract1, width: 340.sp),
            ),
            Padding(
              padding: EdgeInsets.all(14.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 14.sp,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 10.sp,
                        children: [
                          Container(
                            padding: EdgeInsets.all(6.sp),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.sp),
                            ),
                            child: SvgPicture.asset(AppAsset.svgs.moneyPrimary),
                          ),
                          poppins(
                            'Laporan kondisi kelompok',
                            color: Colors.white,
                          ),
                        ],
                      ),
                      poppins(
                        'Triwulan III',
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(99),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(99),
                      child: Container(
                        padding: EdgeInsets.all(8.sp),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1.sp),
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 28.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
