
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_group_info_cell.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/int/int_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';

class AppGroupFundCard extends StatelessWidget {
  const AppGroupFundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.border.lightGray),
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Column(
        spacing: 12.sp,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10.sp,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.bg.lightPrimary,
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                    padding: EdgeInsets.all(8.sp),
                    child: Icon(Icons.arrow_downward_rounded),
                  ),
                  poppins('Simpanan Pokok', fontWeight: FontWeight.w600),
                ],
              ),
              poppins('30/10/2019', color: AppColor.text.gray),
            ],
          ),
          Column(
            spacing: 4.sp,
            children: [
              AppGroupInfoCell(
                icon: Icon(Icons.calendar_month, color: AppColor.bg.primary),
                field: 'Bulan',
                value: poppins('Oktober'),
              ),
              AppGroupInfoCell(
                icon: Icon(Icons.calendar_month, color: AppColor.bg.primary),
                field: 'Total Simpanan',
                value: poppins(300000.toIdr(decimalDigits: 2)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
