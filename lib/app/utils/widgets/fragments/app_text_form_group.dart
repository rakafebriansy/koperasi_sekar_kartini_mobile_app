import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_text_form_field.dart';

class AppTextFormGroup extends StatelessWidget {
  const AppTextFormGroup({
    super.key,
    required this.controller,
    required this.label,
    this.placeholder,
    this.obscureText = false,
    this.maxLines,
    this.enabled,
    this.keyboardType,
    this.validator,
    this.suffixIcon,
    this.inputFormatters,
    this.initialValue
  });

  final TextEditingController controller;
  final String label;
  final String? placeholder;
  final bool obscureText;
  final bool? enabled;
  final int? maxLines;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        poppins(
          label,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
        ),
        AppTextFormField(
          controller: controller,
          hintText: placeholder ?? label,
          obscureText: obscureText,
          maxLines: maxLines,
          validator: validator,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          suffixIcon: suffixIcon,
          initialValue: initialValue,
          enabled: enabled,
        ),
      ],
    );
  }
}
