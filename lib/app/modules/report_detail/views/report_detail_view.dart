import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/list/list_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/num/num_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_default_tabbar.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_default_wrapper.dart';

import '../controllers/report_detail_controller.dart';

class ReportDetailView extends GetView<ReportDetailController> {
  const ReportDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppDefaultWrapper(
      title: poppins('Detail Rapor', fontWeight: FontWeight.w600),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.sp,
          children: [
            Row(
              spacing: 10.sp,
              children: [
                Expanded(
                  child: DropdownSearch<String>(
                    enabled: controller.groupReportModels.isNotEmpty,
                    selectedItem:
                        controller.selectedGroupReport?.label ??
                        controller.groupReportModels.labels.first,
                    items: (filter, infiniteScrollProps) =>
                        controller.groupReportModels.labels,
                    decoratorProps: DropDownDecoratorProps(
                      baseStyle: GoogleFonts.poppins(fontSize: 14.sp),
                      decoration: buildAppTextInputDecoration(hintText: ''),
                    ),
                    popupProps: PopupProps.menu(
                      fit: FlexFit.loose,
                      constraints: BoxConstraints(maxHeight: 200.sp),
                      itemBuilder: (context, item, isSelected, onTap) =>
                          InkWell(
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.sp,
                                vertical: 12.sp,
                              ),
                              child: poppins(item, fontSize: 14.sp),
                            ),
                          ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(14.sp),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(14.sp),
                    child: Container(
                      padding: EdgeInsets.all(12.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.sp),
                        border: Border.all(
                          width: 1.5.sp,
                          color: AppColor.bg.gray,
                        ),
                      ),
                      child: Icon(Icons.more_vert),
                    ),
                  ),
                ),
              ],
            ),
            _ReportCard(),
            SizedBox(height: 16.sp),
            poppins(
              'Bidang Organisasi',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 8.sp,
              children: [
                Row(
                  spacing: 8.sp,
                  children: [
                    Expanded(
                      child: _ReportCell(
                        title: 'Anggota Masuk',
                        icon: Icon(
                          Icons.arrow_downward_rounded,
                          color: AppColor.bg.primary,
                          size: 18.sp,
                        ),
                        point: 1,
                        pointPercentage: 25,
                      ),
                    ),
                    Expanded(
                      child: _ReportCell(
                        title: 'Anggota Keluar',
                        icon: Icon(
                          Icons.arrow_upward_rounded,
                          color: AppColor.bg.primary,
                          size: 18.sp,
                        ),
                        point: 1,
                        pointPercentage: -25,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 8.sp,
                  children: [
                    Expanded(
                      child: _ReportCell(
                        title: 'Total Anggota',
                        icon: Icon(
                          Icons.group_rounded,
                          color: AppColor.bg.primary,
                          size: 18.sp,
                        ),
                        point: 15,
                        pointPercentage: 45,
                      ),
                    ),
                    Expanded(
                      child: _ReportCell(
                        title: 'Tertib Adm.',
                        icon: Icon(
                          Icons.format_list_bulleted_rounded,
                          color: AppColor.bg.primary,
                          size: 18.sp,
                        ),
                        point: 1,
                        pointPercentage: 25,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 8.sp,
                  children: [
                    Expanded(
                      child: _ReportCell(
                        title: 'Tertib Setor',
                        icon: Icon(
                          Icons.sync_alt,
                          color: AppColor.bg.primary,
                          size: 18.sp,
                        ),
                        pointPercentage: 100,
                      ),
                    ),
                    Expanded(
                      child: _ReportCell(
                        title: 'Kehadiran',
                        icon: Icon(
                          Icons.person_rounded,
                          color: AppColor.bg.primary,
                          size: 18.sp,
                        ),
                        pointPercentage: 80,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox.shrink(),
            poppins(
              'Bidang Keuangan',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 8.sp,
              children: [
                Row(
                  spacing: 8.sp,
                  children: [
                    Expanded(
                      child: _ReportCell(
                        title: 'Setor di Pert.',
                        icon: Icon(
                          Icons.swap_horiz_rounded,
                          color: AppColor.bg.primary,
                          size: 18.sp,
                        ),
                        pointPercentage: 94.1,
                      ),
                    ),
                    Expanded(
                      child: _ReportCell(
                        title: 'Nilai Piutang',
                        icon: Icon(
                          Icons.description,
                          color: AppColor.bg.primary,
                          size: 18.sp,
                        ),
                        pointPercentage: 100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(12.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                border: Border.all(color: AppColor.border.lightGray),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.sp,
                children: [
                  poppins(
                    'Partisipasi Pinjaman',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 96.sp,
                    child: AppDefaultTabbar(
                      views: [_TabBarInfo(), _TabBarInfo(), _TabBarInfo()],
                      tabLabels: ['PB', 'BBM', 'Toko'],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(12.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                border: Border.all(color: AppColor.border.lightGray),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.sp,
                children: [
                  poppins(
                    'Saldo Pinjaman',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 96.sp,
                    child: AppDefaultTabbar(
                      views: [_TabBarInfo(), _TabBarInfo(), _TabBarInfo()],
                      tabLabels: ['PB', 'BBM', 'Toko'],
                    ),
                  ),
                ],
              ),
            ),
            _ProfileBigCell(
              title: 'Partisipasi Tunai',
              subtitle: 'Tunai',
              icon: Icon(
                Icons.attach_money_rounded,
                color: AppColor.bg.primary,
              ),
              amount: 9_400_000,
              percentage: 100,
            ),
            _ProfileBigCell(
              title: 'Partisipasi Simpanan',
              subtitle: 'SSR',
              icon: Icon(Icons.savings, color: AppColor.bg.primary),
              amount: 600_000,
              percentage: 65,
            ),
            SizedBox(height: 8.sp),
          ],
        ),
      ),
    );
  }
}

class _ProfileBigCell extends StatelessWidget {
  const _ProfileBigCell({
    required this.title,
    required this.amount,
    required this.subtitle,
    required this.icon,
    this.percentage,
  });

  final String title;
  final String subtitle;
  final double amount;
  final double? percentage;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        border: Border.all(color: AppColor.border.lightGray),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8.sp,
        children: [
          poppins(title, fontSize: 13.sp, fontWeight: FontWeight.w600),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 12.sp,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColor.bg.lightGray,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                padding: EdgeInsets.all(8.sp),
                child: icon,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 4.sp,
                  children: [
                    poppins(subtitle),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        poppins(
                          amount.toIdr(),
                          color: AppColor.bg.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        if (percentage != null)
                          poppins(
                            '$percentage%',
                            color: AppColor.bg.primary,
                            fontSize: 10.sp,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TabBarInfo extends StatelessWidget {
  const _TabBarInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 4.sp,
      children: [
        SizedBox(height: 4.sp),
        poppins('PB'),
        poppins(
          10_000_000.toIdr(),
          color: AppColor.bg.primary,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}

class _ReportCell extends StatelessWidget {
  const _ReportCell({
    required this.title,
    required this.icon,
    this.point,
    required this.pointPercentage,
  });

  final String title;
  final Icon icon;
  final double? point;
  final double pointPercentage;

  @override
  Widget build(BuildContext context) {
    final String pointPercentageLabel =
        '${pointPercentage < 0 ? pointPercentage : '+$pointPercentage'}%';
    return Container(
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        border: Border.all(color: AppColor.border.lightGray),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 12.sp,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.bg.lightGray,
              borderRadius: BorderRadius.circular(6.sp),
            ),
            padding: EdgeInsets.all(8.sp),
            child: icon,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2.sp,
              children: [
                poppins(
                  title,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 11.sp,
                ),
                Row(
                  spacing: 6.sp,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    poppins(
                      point != null ? point.toString() : '$pointPercentage%',
                      color: AppColor.bg.primary,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    if (point != null)
                      poppins(
                        pointPercentageLabel,
                        color: AppColor.bg.primary,
                        fontSize: 8.sp,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ReportCard extends StatelessWidget {
  const _ReportCard();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
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
                  padding: EdgeInsets.fromLTRB(14.sp, 14.sp, 14.sp, 32.sp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5.sp,
                        children: [
                          poppins(
                            'Laporan kondisi kelompok',
                            color: Colors.white,
                          ),
                          poppins(
                            '81,4%',
                            fontSize: 28.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 4.sp,
                          horizontal: 8.sp,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.bg.lightPrimary,
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: poppins('Baik'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -24.sp,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColor.bg.lightPrimary,
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                padding: EdgeInsets.all(8.sp),
                child: Row(
                  spacing: 6.sp,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.sp),
                        color: AppColor.bg.primary,
                      ),
                      child: SvgPicture.asset(
                        AppAsset.svgs.moneyWhite,
                        width: 14.sp,
                        height: 14.sp,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        poppins('Nilai Organisasi'),
                        poppins('90,4%', fontWeight: FontWeight.w600),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.bg.lightPrimary,
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                padding: EdgeInsets.all(8.sp),
                child: Row(
                  spacing: 6.sp,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.sp),
                        color: AppColor.bg.primary,
                      ),
                      child: SvgPicture.asset(
                        AppAsset.svgs.moneyWhite,
                        width: 14.sp,
                        height: 14.sp,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        poppins('Nilai Organisasi'),
                        poppins('90,4%', fontWeight: FontWeight.w600),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
