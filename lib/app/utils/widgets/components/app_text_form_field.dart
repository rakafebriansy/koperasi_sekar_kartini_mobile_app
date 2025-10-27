import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/builders/widget_builder.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.iconPath,
    this.obscureText = false,
    this.maxLines,
    this.counterText,
  });

  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final String? iconPath;
  final int? maxLines;
  final String? counterText;

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

  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          style: GoogleFonts.poppins(fontSize: 14.sp),
          key: widget.key,
          obscureText: isHidden,
          controller: widget.controller,
          decoration: buildAppTextInputDecoration(
            hintText: widget.hintText,
            iconPath: widget.iconPath,
            counterText: widget.counterText,
          ),
          maxLines: widget.obscureText ? 1 : widget.maxLines,
        ),
        if (widget.obscureText)
          Positioned(
            top: 0,
            bottom: 0,
            right: MediaQuery.of(context).size.width * 0.04,
            child: Center(
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
                    splashColor: AppColor.lightPrimary.withOpacity(0.3),
                    highlightColor: AppColor.lightPrimary.withOpacity(0.1),
                    child: Icon(
                      isHidden ? Icons.visibility_off : Icons.visibility,
                      color: Color(0xFFD9D9D9),
                      size: 24.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
