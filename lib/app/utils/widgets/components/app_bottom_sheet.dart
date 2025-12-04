import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    super.key,
    this.titleText,
    this.subtitleText,
    this.children,
    this.padding,
    this.spacing,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final Text? titleText;
  final Text? subtitleText;
  final EdgeInsets? padding;
  final double? spacing;
  final List<Widget>? children;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: padding ?? EdgeInsets.all(16.sp),
    decoration: BoxDecoration(
      color: context.theme.scaffoldBackgroundColor,
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.sp)),
    ),
    child: Column(
      spacing: spacing ?? 12.sp,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (titleText != null) titleText!,
        if (subtitleText != null) subtitleText!,
        if (children != null)
          SizedBox(height: 16.sp),
        ...children ?? [],
      ],
    ),
  );
}
