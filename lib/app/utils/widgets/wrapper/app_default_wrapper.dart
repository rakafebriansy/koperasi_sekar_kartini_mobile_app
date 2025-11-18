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
    this.leading,
    this.ableToBack = false,
    this.withPadding = true,
    this.actions,
  });

  final Widget child;
  final Widget title;
  final Widget? leading;
  final bool ableToBack;
  final bool withPadding;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 64.sp,
          actionsPadding: EdgeInsets.only(right: 12.sp),
          actions: actions,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leadingWidth: 64.sp,
          surfaceTintColor: Colors.white,
          leading: leading != null
              ? leading
              : ableToBack
              ? Center(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(999),
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 36.sp,
                        width: 36.sp,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.instance.border.lightGray,
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
                )
              : null,
          title: title,
        ),
        body: withPadding ? Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: child,
        ) :
           child,
      ),
    );
  }
}
