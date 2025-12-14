import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/report/report_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_date_input_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_text_form_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_default_wrapper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

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
        height: getScreenHeight(context),
        child: Column(
          spacing: 12.sp,
          children: [
            Row(
              spacing: 10.sp,
              children: [
                Expanded(
                  child: AppDateInputField(
                    prefixIcon: SvgPicture.asset(
                      AppAsset.svgs.searchGray,
                      height: 16.sp,
                    ),
                    controller: controller.searchCtrl,
                    placeholder: 'Cari...',
                    type: DateInputType.year,
                    onChanged: (value) => controller.onSearchChanged(value),
                  ),
                ),
                if (AuthController.find.currentUser!.role != 'group_member')
                  Material(
                    borderRadius: BorderRadius.circular(12.sp),
                    color: Colors.white,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12.sp),
                      onTap: () async {
                        final result = await Get.toNamed(
                          Routes.EMPLOYEE_MANAGE_REPORT,
                          arguments: ArgsWrapper(
                            data: controller.group,
                            action: ActionType.create,
                          ),
                        );
                        if (result == true) {
                          controller.fetchListReport(controller.group!.id);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.sp,
                            color: AppColor.border.lightGray,
                          ),
                          borderRadius: BorderRadius.circular(12.sp),
                        ),
                        padding: EdgeInsets.all(10.sp),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 28.sp,
                            color: AppColor.border.gray,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Divider(height: 1, color: AppColor.border.lightGray),
            Expanded(
              child: SingleChildScrollView(
                child: Obx(
                  () => controller.isFetching
                      ? SizedBox(
                          height: getScreenHeight(context, scale: 0.7),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : controller.reports.isEmpty
                      ? SizedBox(
                          height: getScreenHeight(context, scale: 0.6),
                          child: Center(child: poppins('Tidak ada data')),
                        )
                      : Column(
                          spacing: 16.sp,
                          children: List.generate(
                            controller.reports.length,
                            (index) => _ReportCard(
                              report: controller.reports[index],
                              onTap: () async {
                                final result = await Get.toNamed(
                                  Routes.EMPLOYEE_MANAGE_REPORT,
                                  arguments: ArgsWrapper(
                                    data: controller.reports[index],
                                    action: ActionType.update,
                                  ),
                                );
                                if (result == true) {
                                  controller.fetchListReport(
                                    controller.group!.id,
                                  );
                                }
                              },
                            ),
                          ),
                        ),
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
  const _ReportCard({required this.report, required this.onTap});

  final ReportModel report;
  final VoidCallback onTap;

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
                            fontSize: 14.sp,
                          ),
                        ],
                      ),
                      poppins(
                        'Triwulan ${report.quarter.toInt()}, ${report.year}',
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
                      onTap: onTap,
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
