import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/date_time/date_time_extension.dart';

class AppNotificationBar extends StatelessWidget {
  const AppNotificationBar({
    super.key,
    this.type = NotificationBarType.info,
    required this.message,
    required this.dateTime,
    this.onTap,
  });

  final NotificationBarType type;
  final String message;
  final DateTime dateTime;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    String iconPath = type == NotificationBarType.danger
        ? AppAsset.svgs.cautionWhite
        : (type == NotificationBarType.success)
        ? AppAsset.svgs.tickWhite
        : AppAsset.svgs.infoWhite;
    Color color = type == NotificationBarType.danger
        ? AppColor.bg.danger
        : (type == NotificationBarType.success)
        ? Colors.lightGreen
        : Colors.lightBlue;

    return Material(
      color: Color(0xFFF9F9F9),
      borderRadius: BorderRadius.circular(12.sp),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.sp),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(12.sp),
          decoration: BoxDecoration(
            border: Border.all(width: 1.sp, color: color),
            borderRadius: BorderRadius.circular(12.sp),
          ),
          child: Row(
            spacing: 12.sp,
            children: [
              CircleAvatar(
                radius: 20.sp,
                backgroundColor: color,
                child: SvgPicture.asset(iconPath, width: 16.sp, height: 16.sp),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4.sp,
                  children: [
                    poppins(
                      '${dateTime.toIdFull()})',
                      fontSize: 10.sp,
                      color: Colors.grey,
                    ),
                    poppins(message),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum NotificationBarType { danger, success, info }
