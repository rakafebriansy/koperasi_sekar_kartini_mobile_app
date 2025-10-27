import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppDefaultWrapper extends StatelessWidget {
  const AppDefaultWrapper({
    super.key,
    required this.child,
    required this.title,
    this.ableToBack = true,
  });

  final Widget child;
  final Widget title;
  final bool ableToBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 64.sp,
        surfaceTintColor: Colors.white,
        leading: ableToBack ? Center(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(999),
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: EdgeInsets.only(left: 8.sp),
                child: Container(
                  height: 36.sp,
                  width: 36.sp,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.border.lightGray,
                      width: 1.sp,
                    ),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Center(
                    child: SvgPicture.asset(AppAsset.svgs.arrowLeftBlack),
                  ),
                ),
              ),
            ),
          ),
        ) : null,
        title: title,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
        child: child,
      ),
    );
  }
}
