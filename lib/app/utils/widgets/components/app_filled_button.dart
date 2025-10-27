import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';

class AppFilledButton extends StatelessWidget {
  AppFilledButton({
    super.key,
    this.onClick,
    this.height,
    this.width,
    required this.label,
    this.danger = false,
  });

  final VoidCallback? onClick;
  final double? width;
  final double? height;
  final String label;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40.sp,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: danger ? AppColor.danger : AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(999.sp),
          ),
        ),
        onPressed: onClick,
        child: Text(
          label,
          style: GoogleFonts.inter(color: Colors.white, fontSize: 14.sp),
        ),
      ),
    );
  }
}
