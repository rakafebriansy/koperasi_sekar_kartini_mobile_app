import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';

class AppDefaultTabbar extends StatelessWidget {
  final List<Widget> views;
  final Widget? header;
  final EdgeInsets? tabBarPadding;
  final List<String> tabLabels;
  final ValueChanged<int>? onTabChanged;

  const AppDefaultTabbar({
    super.key,
    this.header,
    this.tabBarPadding,
    required this.views,
    required this.tabLabels,
    this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabLabels.length,
      child: Builder(
        builder: (context) {
          final controller = DefaultTabController.of(context);

          controller.addListener(() {
            if (!controller.indexIsChanging) {
              onTabChanged?.call(controller.index);
            }
          });

          return Column(
            children: [
              if (header != null) header!,
              Padding(
                padding: tabBarPadding ?? EdgeInsets.zero,
                child: Container(
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
              ),
              Expanded(child: TabBarView(children: views)),
            ],
          );
        },
      ),
    );
  }
}
