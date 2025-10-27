import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_text_form_field.dart';

class AppTextFormGroup extends StatelessWidget {
  const AppTextFormGroup({
    super.key,
    required this.controller,
    required this.label,
    this.placeholder,
    this.obscureText = false,
    this.maxLines,
  });

  final TextEditingController controller;
  final String label;
  final String? placeholder;
  final bool obscureText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        AppTextFormField(
          controller: controller,
          hintText: placeholder ?? label,
          obscureText: obscureText,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
