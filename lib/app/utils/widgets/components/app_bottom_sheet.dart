import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    super.key,
    this.titleText,
    this.subtitleText,
    this.children,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final String? titleText;
  final String? subtitleText;
  final List<Widget>? children;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 32.sp),
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.sp)),
        ),
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (titleText?.isNotEmpty ?? false) Text(titleText!, style: context.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)),
            if (subtitleText?.isNotEmpty ?? false) Text(subtitleText!),
            if ((titleText?.isNotEmpty ?? false) || (subtitleText?.isNotEmpty ?? false)) SizedBox(height: 16.sp),
            ...children ?? [],
          ],
        ),
      );
}
