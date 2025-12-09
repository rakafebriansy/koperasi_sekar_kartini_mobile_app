import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.maxLines,
    this.counterText,
    this.readOnly = false,
    this.onTap,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.onChanged,
    this.enabled,
    this.initialValue,
  });

  final TextEditingController? controller;
  final bool obscureText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final String? counterText;
  final bool readOnly;
  final bool? enabled;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final String? initialValue;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool isHidden;

  @override
  void initState() {
    super.initState();
    isHidden = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          enabled: widget.enabled,
          initialValue: widget.initialValue,
          onChanged: widget.onChanged,
          style: GoogleFonts.poppins(fontSize: 14.sp),
          obscureText: isHidden,
          controller: widget.controller,
          decoration: buildAppTextInputDecoration(
            hintText: widget.hintText ?? '',
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.obscureText
                ? Center(
                    child: SizedBox(
                      height: 24.sp,
                      width: 24.sp,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isHidden = !isHidden;
                            });
                          },
                          borderRadius: BorderRadius.circular(12),
                          splashColor: AppColor.bg.lightPrimary.withValues(
                            alpha: 0.3,
                          ),
                          highlightColor: AppColor.bg.lightPrimary.withValues(
                            alpha: 0.1,
                          ),
                          child: Icon(
                            isHidden ? Icons.visibility_off : Icons.visibility,
                            color: Color(0xFFD9D9D9),
                            size: 24.sp,
                          ),
                        ),
                      ),
                    ),
                  )
                : widget.suffixIcon,
            counterText: widget.counterText,
          ),
          maxLines: widget.obscureText ? 1 : widget.maxLines,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          inputFormatters: widget.inputFormatters,
        ),
      ],
    );
  }
}
