import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/member_growth/member_growth_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_default_tabbar.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_event_card.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_home_wrapper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

import '../controllers/employee_main_tabs_home_controller.dart';

class EmployeeMainTabsHomeView extends GetView<EmployeeMainTabsHomeController> {
  const EmployeeMainTabsHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppHomeWrapper(
      child: SingleChildScrollView(
        child: Obx(
          () => controller.isLoading
              ? SizedBox(
                  height: getScreenHeight(context, scale: 0.86),
                  child: Center(child: CircularProgressIndicator()),
                )
              : Column(
                  spacing: 16.sp,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (controller.memberGrowths.isNotEmpty)
                      MemberLineChart(members: controller.memberGrowths),
                    Container(
                      height: 360.sp,
                      padding: EdgeInsets.fromLTRB(16.sp, 12.sp, 16.sp, 12.sp),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.sp),
                        border: Border.all(
                          width: 1.sp,
                          color: AppColor.border.lightGray,
                        ),
                      ),
                      child: AppDefaultTabbar(
                        views: [SimplePieChart(), SimplePieChart()],
                        tabLabels: ['Simpanan', 'Pinjaman'],
                      ),
                    ),
                    SizedBox.shrink(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        poppins(
                          'Kegiatan Terbaru',
                          fontSize: 16.sp,
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
                                overlayColor: AppColor.bg.transparentPrimary
                                    .withValues(alpha: 0.2),
                                borderRadiusCircularSize: 12.sp,
                              ),
                              onPressed: () async {
                                final result = await Get.toNamed(
                                  Routes.MANAGE_EVENT,
                                  arguments: ArgsWrapper(
                                    data: null,
                                    action: ActionType.create,
                                  ),
                                );

                                if (result == true) {
                                  controller.fetchListEvent();
                                }
                              },
                              label: poppins(
                                'Tambah',
                                color: AppColor.bg.primary,
                              ),
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
                    Obx(
                      () => controller.events.isEmpty
                          ? SizedBox(
                              height: 64.sp,
                              child: Align(
                                alignment: Alignment.center,
                                child: poppins('Tidak ada data.'),
                              ),
                            )
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              spacing: 10.sp,
                              children: [
                                ...controller.events.map(
                                  (event) => AppEventCard(
                                    model: event,
                                    onTap: () async {
                                      final result = await Get.toNamed(
                                        Routes.EVENT_DETAIL,
                                        arguments: ArgsWrapper(data: event),
                                      );

                                      if (result == true) {
                                        controller.fetchListEvent();
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(height: 10.sp),
                              ],
                            ),
                    ),
                    SizedBox(height: 10.sp),
                  ],
                ),
        ),
      ),
    );
  }
}

class MemberLineChart extends StatelessWidget {
  const MemberLineChart({super.key, required this.members});

  final List<MemberGrowthModel> members;

  @override
  Widget build(BuildContext context) {
    final spots = members
        .map((e) => FlSpot(e.year.toDouble(), e.total))
        .toList();
    return Container(
      padding: EdgeInsets.fromLTRB(16.sp, 12.sp, 24.sp, 12.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.sp),
        border: Border.all(width: 1.sp, color: AppColor.border.lightGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          poppins("Jumlah Anggota", fontSize: 18, fontWeight: FontWeight.bold),
          SizedBox(height: 10.sp),

          SizedBox(
            height: 160.sp,
            child: LineChart(
              LineChartData(
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 20,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      reservedSize: 32,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          space: 6,
                          child: Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                minX: spots.first.x,
                maxX: spots.last.x,
                minY: 0,
                maxY:
                    spots.map((e) => e.y).reduce((a, b) => a > b ? a : b) + 10,
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    barWidth: 3,
                    color: const Color(0xFF009688),
                    dotData: FlDotData(show: true),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF009688).withValues(alpha: 0.3),
                          const Color(0xFF009688).withValues(alpha: 0.05),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SimplePieChart extends StatefulWidget {
  const SimplePieChart({super.key});

  @override
  State<SimplePieChart> createState() => _SimplePieChartState();
}

class _SimplePieChartState extends State<SimplePieChart> {
  bool isSavingTab = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            height: 250.sp,
            child: PieChart(
              PieChartData(
                sectionsSpace: 0,
                centerSpaceRadius: 0,
                sections: [
                  PieChartSectionData(
                    value: 50,
                    color: const Color(0xFF007F67),
                    radius: 110,
                  ),
                  PieChartSectionData(
                    value: 30,
                    color: const Color(0xFF5F8C6A),
                    radius: 110,
                  ),
                  PieChartSectionData(
                    value: 20,
                    color: const Color(0xFFDFF3F0),
                    radius: 110,
                  ),
                ],
              ),
            ),
          ),

          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            children: [
              _legendItem(const Color(0xFF007F67), "Simpanan A"),
              _legendItem(const Color(0xFF5F8C6A), "Simpanan B"),
              _legendItem(const Color(0xFFDFF3F0), "Lainnya"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _legendItem(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(3),
            color: color,
          ),
        ),
        const SizedBox(width: 8),
        poppins(label),
      ],
    );
  }
}
