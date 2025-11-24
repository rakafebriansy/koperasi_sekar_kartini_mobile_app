import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';

class AppFilledButton extends StatelessWidget {
  AppFilledButton({
    super.key,
    this.onTap,
    this.height,
    this.width,
    this.fontSize,
    this.fontWeight,
    required this.label,
    this.danger = false,
    this.svgPath,
    this.svgSize,
    this.backgroundColor,
    this.textColor,
    this.borderRadiusSize,
  });

  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final Color? textColor;
  final Color? backgroundColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String label;
  final bool danger;
  final String? svgPath;
  final double? svgSize;
  final double? borderRadiusSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48.sp,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: danger
              ? AppColor.bg.danger
              : backgroundColor != null
              ? backgroundColor
              : AppColor.bg.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusSize ?? 999.sp),
          ),
        ),
        onPressed: onTap,
        child: svgPath != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(svgPath!, width: svgSize, height: svgSize),
                  SizedBox(width: 8.sp),
                  poppins(
                    label,
                    color: textColor ?? Colors.white,
                    fontSize: fontSize ?? 14.sp,
                    fontWeight: fontWeight ?? FontWeight.w600,
                  ),
                ],
              )
            : poppins(
                label,
                color: Colors.white,
                fontSize: fontSize ?? 14.sp,
                fontWeight: fontWeight ?? FontWeight.w600,
              ),
      ),
    );
  }
}
