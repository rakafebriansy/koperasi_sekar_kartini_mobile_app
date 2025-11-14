import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/builders/widget_builder.dart';

class AppOutlinedButton extends StatelessWidget {
  AppOutlinedButton({
    super.key,
    this.onTap,
    this.height,
    this.width,
    this.fontSize,
    required this.label,
    this.danger = false,
  });

  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final double? fontSize;
  final String label;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48.sp,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: danger
                  ? AppColor.instance.border.danger
                  : AppColor.instance.border.primary,
              width: 1.sp,
            ),
            borderRadius: BorderRadiusGeometry.circular(999.sp),
          ),
          backgroundColor: danger
              ? AppColor.instance.lightDanger
              : AppColor.instance.lightPrimary,
        ),
        onPressed: onTap,
        child: poppins(
          label,
          color: danger ? AppColor.instance.danger : AppColor.instance.primary,
          fontSize: fontSize ?? 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
