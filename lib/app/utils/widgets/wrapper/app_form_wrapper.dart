import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';

class AppFormWrapper extends StatelessWidget {
  const AppFormWrapper({
    super.key,
    required this.child,
    required this.title,
    this.leading,
    this.ableToBack = false,
    this.actions,
  });

  final Widget child;
  final String title;
  final Widget? leading;
  final bool ableToBack;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.bg.primary,
        appBar: AppBar(
          toolbarHeight: 64.sp,
          actionsPadding: EdgeInsets.all(12.sp),
          actions: actions,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leadingWidth: 64.sp,
          surfaceTintColor: Colors.white,
          leading: leading != null
              ? leading
              : ableToBack
              ? Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.sp),
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
                              color: AppColor.border.lightGray,
                              width: 1.sp,
                            ),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              AppAsset.svgs.arrowLeftBlack,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : null,
          title: poppins(
            title,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        extendBodyBehindAppBar: true,
        body: SizedBox.expand(
          child: Stack(
            children: [
              Positioned(
                top: -210,
                left: -100,
                child: Image.asset(
                  AppAsset.images.subtract1,
                  width: 400.sp,
                  height: 400.sp,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.86,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(18.sp),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(20.sp, 20.sp, 20.sp, 8.sp),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
