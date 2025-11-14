import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/builders/widget_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class AppLinkButton extends StatelessWidget {
  const AppLinkButton({
    super.key,
    required this.isPath,
    required this.link,
    required this.label,
    this.fontSize,
    this.color = Colors.blue,
  });

  final String link;
  final String label;
  final Color color;
  final bool isPath;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isPath
          ? () {
              Get.offAllNamed(link);
            }
          : () async {
              final Uri url = Uri.parse(link);
              if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                throw Exception('Failed to open link');
              }
            },
      child: poppins(label, color: color, fontSize: fontSize ?? 14.sp),
    );
  }
}
