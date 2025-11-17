import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/employee_detail/controllers/employee_employee_detail_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/builders/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_outlined_button.dart';

class AppEmployee3rdForm extends StatelessWidget {
  const AppEmployee3rdForm({super.key, required this.controller});

  final EmployeeEmployeeDetailController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        poppins('Foto KTP', fontSize: 14.sp, fontWeight: FontWeight.w600),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
            border: Border.all(width: 1.sp, color: AppColor.instance.gray),
            borderRadius: BorderRadius.circular(16.sp),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 12.sp,
                children: [
                  SvgPicture.asset(AppAsset.svgs.imageIcon),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      poppins('foto.png', fontWeight: FontWeight.w500),
                      poppins('5.3MB'),
                    ],
                  ),
                ],
              ),
              AppOutlinedButton(
                height: 30.sp,
                label: 'Pilih',
                onTap: () {},
                fontSize: 12.sp,
              ),
            ],
          ),
        ),
        SizedBox(height: 8.sp),
        poppins('Foto Pas Foto', fontSize: 14.sp, fontWeight: FontWeight.w600),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
            border: Border.all(width: 1.sp, color: AppColor.instance.gray),
            borderRadius: BorderRadius.circular(16.sp),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 12.sp,
                children: [
                  SvgPicture.asset(AppAsset.svgs.imageIcon),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      poppins('foto.png', fontWeight: FontWeight.w500),
                      poppins('5.3MB'),
                    ],
                  ),
                ],
              ),
              AppOutlinedButton(
                height: 30.sp,
                label: 'Pilih',
                onTap: () {},
                fontSize: 12.sp,
              ),
            ],
          ),
        ),
        SizedBox(height: 18.sp),
        Row(
          spacing: 12.sp,
          children: [
            if (controller.selectedScreen > 0)
              Material(
                child: InkWell(
                  onTap: () {
                    controller.prevScreen();
                  },
                  child: Container(
                    width: 48.sp,
                    height: 48.sp,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.instance.primary,
                        width: 2.sp,
                      ),
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_outlined,
                        size: 24.sp,
                        color: AppColor.instance.primary,
                      ),
                    ),
                  ),
                ),
              ),
            Expanded(
              child: AppFilledButton(
                label: controller.selectedScreen == 2 ? 'Simpan' : 'Lanjut',
                onTap: controller.selectedScreen == 2
                    ? () {
                        //TODO: implement create employee
                      }
                    : () {
                        controller.nextScreen();
                      },
                width: double.infinity,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.sp),
      ],
    );
  }
}
