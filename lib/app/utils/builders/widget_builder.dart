import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';

InputDecoration buildAppTextInputDecoration({
  String? counterText,
  String? iconPath,
  required String hintText,
}) {
  return InputDecoration(
    counterText: counterText,
    suffixIcon: iconPath != null
        ? Padding(
            padding: EdgeInsets.fromLTRB(8.sp, 14.sp, 14.sp, 14.sp),
            child: SizedBox(
              width: 20.sp,
              child: SvgPicture.asset(iconPath, height: 20.sp),
            ),
          )
        : null,
    prefixIconConstraints: BoxConstraints(minWidth: 20.sp, minHeight: 20.sp),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.sp),
      borderSide: BorderSide(color: AppColor.border.lightGray, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.sp),
      borderSide: BorderSide(color: AppColor.border.focus, width: 2),
    ),
    hint: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.border.gray,
          ),
        ),
      ],
    ),
  );
}

ButtonStyle buildInkWellButtonStyle({
  required Color foregroundColor,
  required Color overlayColor,
  required Color backgroundColor,
  double? borderRadiusCircularSize,
  EdgeInsets? padding,
  Color shadowColor = Colors.transparent,
  Color surfaceTintColor = Colors.transparent,
}) {
  return ButtonStyle(
    elevation: WidgetStateProperty.all(0),
    animationDuration: Duration.zero,
    backgroundColor: WidgetStateProperty.all(backgroundColor),
    overlayColor: WidgetStateProperty.all(overlayColor),
    foregroundColor: WidgetStateProperty.all(foregroundColor),
    shadowColor: WidgetStateProperty.all(shadowColor),
    surfaceTintColor: WidgetStateProperty.all(surfaceTintColor),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusCircularSize ?? 0),
      ),
    ),
    padding: WidgetStateProperty.all(padding),
  );
}


