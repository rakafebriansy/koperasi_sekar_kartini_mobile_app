import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/event/event_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_environment.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/date_time/date_time_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';

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
                  child: (model.photo != null
                      ? CachedNetworkImage(
                          imageUrl:
                              '${Environments.apiUrl}/file/${model.photo!}',
                        )
                      : Image.asset(AppAsset.images.brokenImageIcon)),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 2.sp,
                children: [
                  poppins(
                    model.name,
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
                        color: AppColor.bg.primary,
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
                        model.datetime.toIdDate(),
                        fontSize: 10.sp,
                        color: AppColor.bg.primary,
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
                        model.datetime.toDotSeparatedHour(),

                        fontSize: 10.sp,
                        color: AppColor.bg.primary,
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
