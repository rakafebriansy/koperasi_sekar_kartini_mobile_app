import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';

class AppDefaultTabbar extends StatelessWidget {
  final List<Widget> views;
  final Widget? header;
  final List<String> tabLabels;

  const AppDefaultTabbar({
    super.key,
    this.header,
    required this.views,
    required this.tabLabels,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabLabels.length,
      child: Container(
        child: Column(
          children: [
            if (header != null) header!,
            Container(
              height: 42.sp,
              padding: EdgeInsets.all(4.sp),
              decoration: BoxDecoration(
                color: AppColor.bg.lightPrimary,
                borderRadius: BorderRadius.circular(8.sp),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.sp),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: AppColor.bg.primary,
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: tabLabels.map((label) => Tab(text: label)).toList(),
                  dividerColor: Colors.transparent,
                ),
              ),
            ),
            Expanded(child: TabBarView(children: views)),
          ],
        ),
      ),
    );
  }
}
