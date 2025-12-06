
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';

class AppGroupInfoCell extends StatelessWidget {
  const AppGroupInfoCell({
    super.key,
    required this.icon,
    required this.field,
    required this.value,
  });

  final Icon icon;
  final String field;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4.sp,
          children: [
            icon,
            poppins(field, color: AppColor.text.gray),
          ],
        ),
        value,
      ],
    );
  }
}
