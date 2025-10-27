import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.iconPath,
    this.obscureText = false,
    this.maxLength,
    this.counterText,
  });

  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final String? iconPath;
  final int? maxLength;
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
          key: widget.key,
          obscureText: isHidden,
          controller: widget.controller,
          decoration: InputDecoration(
              counterText: widget.counterText,
              prefixIcon: widget.iconPath != null ? Padding(
                padding: EdgeInsets.fromLTRB(14.sp, 14.sp, 8.sp, 14.sp),
                child: SizedBox(
                  width: 20.sp,
                  child: SvgPicture.asset(
                    widget.iconPath!,
                    height: 20.sp,
                  ),
                ),
              ) : null,
              prefixIconConstraints: BoxConstraints(
                minWidth: 20.sp,
                minHeight: 20.sp,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColor.border.lightGray, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColor.border.focus, width: 2),
              ),
              hint: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.hintText,
                    style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.border.gray),
                  )
                ],
              )),
          maxLength: widget.maxLength,
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
                    highlightColor:
                        AppColor.lightPrimary.withOpacity(0.1),
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