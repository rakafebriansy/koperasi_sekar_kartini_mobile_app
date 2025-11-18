import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/event_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/date_time/date_time_extension.dart';

class AppEventCard extends StatelessWidget {
  const AppEventCard({super.key, required this.model, this.onTap});

  final EventModel model;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.sp),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.sp),
        child: Container(
          padding: EdgeInsets.all(12.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp),
            border: Border.all(color: Color(0xFFDADADA), width: 1.sp),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 12.sp,
            children: [
              SizedBox(
                width: 64.sp,
                height: 64.sp,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.sp),
                  child: !kReleaseMode
                      ? Image.asset(AppAsset.images.event)
                      : (model.image != null
                            ? Image.network(model.image!)
                            : Image.asset(AppAsset.images.brokenImageIcon)),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 2.sp,
                children: [
                  poppins(
                    model.title,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 6.sp,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        AppAsset.svgs.pinLocationPrimary,
                        width: 12.sp,
                        height: 12.sp,
                      ),
                      poppins(
                        model.location,

                        fontSize: 10.sp,
                        color: AppColor.instance.primary,
                      ),
                    ],
                  ),
                  Row(
                    spacing: 6.sp,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAsset.svgs.calendarPrimary,
                        width: 10.sp,
                        height: 10.sp,
                      ),
                      poppins(
                        model.dateTime.toIdDate(),
                        fontSize: 10.sp,
                        color: AppColor.instance.primary,
                      ),
                    ],
                  ),
                  Row(
                    spacing: 6.sp,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAsset.svgs.clockPrimary,
                        width: 10.sp,
                        height: 10.sp,
                      ),
                      poppins(
                        model.dateTime.toDotSeparatedHour(),

                        fontSize: 10.sp,
                        color: AppColor.instance.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
