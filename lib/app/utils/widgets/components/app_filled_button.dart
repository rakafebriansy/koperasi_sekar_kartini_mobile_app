import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';

class AppFilledButton extends StatelessWidget {
  AppFilledButton({
    super.key,
    this.onTap,
    this.height,
    this.width,
    this.fontSize,
    required this.label,
    this.danger = false,
    this.svgPath,
    this.svgSize,
    this.backgroundColor,
    this.textColor,
  });

  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final Color? textColor;
  final Color? backgroundColor;
  final double? fontSize;
  final String label;
  final bool danger;
  final String? svgPath;
  final double? svgSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48.sp,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: danger
              ? AppColor.danger
              : backgroundColor != null
              ? backgroundColor
              : AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(999.sp),
          ),
        ),
        onPressed: onTap,
        child: svgPath != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(svgPath!, width: svgSize, height: svgSize),
                  SizedBox(width: 8.sp),
                  Text(
                    label,
                    style: GoogleFonts.poppins(
                      color: textColor ?? Colors.white,
                      fontSize: fontSize ?? 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            : Text(
                label,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: fontSize ?? 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
