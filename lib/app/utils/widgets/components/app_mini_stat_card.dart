import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';

class AppMiniStatCard extends StatelessWidget {
  const AppMiniStatCard({
    required this.title,
    required this.icon,
    required this.point,
    this.additionalPoint,
    this.additionalPointColor,
  });

  final String title;
  final Icon icon;
  final String point;
  final String? additionalPoint;
  final Color? additionalPointColor;

  @override
  Widget build(BuildContext context) {
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
                      point,
                      color: AppColor.bg.primary,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    if (additionalPoint != null)
                      poppins(
                        additionalPoint!,
                        color: additionalPointColor ?? AppColor.bg.primary,
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
