import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_default_wrapper.dart';

import '../controllers/group_detail_controller.dart';

class GroupDetailView extends GetView<GroupDetailController> {
  const GroupDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    GroupModel group = DummyHelper.dummyGroups[0];
    return AppDefaultWrapper(
      ableToBack: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              spacing: 8.sp,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: buildInkWellButtonStyle(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.sp,
                      vertical: 8.sp,
                    ),
                    foregroundColor: AppColor.bg.primary,
                    backgroundColor: AppColor.bg.lightPrimary,
                    overlayColor: AppColor.bg.transparentPrimary.withOpacity(
                      0.2,
                    ),
                    borderRadiusCircularSize: 12.sp,
                  ),
                  onPressed: () {},
                  child: poppins('Detail Anggota', color: AppColor.bg.primary),
                ),
                ElevatedButton(
                  style: buildInkWellButtonStyle(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.sp,
                      vertical: 8.sp,
                    ),
                    foregroundColor: AppColor.bg.primary,
                    backgroundColor: AppColor.bg.lightPrimary,
                    overlayColor: AppColor.bg.transparentPrimary.withOpacity(
                      0.2,
                    ),
                    borderRadiusCircularSize: 12.sp,
                  ),
                  onPressed: () {},
                  child: poppins('Atur Rapot', color: AppColor.bg.primary),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.sp),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(24.sp),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.sp, color: AppColor.bg.gray),
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 16.sp,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              child: poppins(
                                group.number,
                                fontSize: 40.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              radius: 44.sp,
                            ),
                            SizedBox(height: 6.sp),
                            poppins(
                              group.chairman!.name,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(height: 2.sp),
                            poppins(
                              group.facilitator!.name,
                              color: AppColor.text.gray,
                            ),
                          ],
                        ),
                        Column(
                          spacing: 3.sp,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _ProfileCell(
                              icon: Icon(
                                Icons.calendar_today,
                                color: AppColor.bg.primary,
                              ),
                              field: 'Tanggal Lahir',
                              value: '17 Juli 1977',
                            ),
                            _ProfileCell(
                              icon: Icon(
                                Icons.business_center,
                                color: AppColor.bg.primary,
                              ),
                              field: 'Pekerjaan',
                              value: 'Karyawan Swasta',
                            ),
                            _ProfileCell(
                              icon: Icon(
                                Icons.calendar_month,
                                color: AppColor.bg.primary,
                              ),
                              field: 'Tanggal Masuk',
                              value: '18 November 2001',
                            ),
                            _ProfileCell(
                              icon: Icon(
                                Icons.person,
                                color: AppColor.bg.primary,
                              ),
                              field: 'No. Anggota',
                              value: '1079',
                            ),
                            _ProfileCell(
                              icon: Icon(
                                Icons.apps,
                                color: AppColor.bg.primary,
                              ),
                              field: 'Kelompok',
                              value: '7',
                            ),
                          ],
                        ),
                        AppFilledButton(
                          width: 156.sp,
                          height: 32.sp,
                          label: 'Lihat Kartu',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      title: poppins('Detail Kelompok', fontWeight: FontWeight.w600),
    );
  }
}

class _ProfileCell extends StatelessWidget {
  const _ProfileCell({
    super.key,
    required this.icon,
    required this.field,
    required this.value,
  });

  final Icon icon;
  final String field;
  final String value;

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
        poppins(value),
      ],
    );
  }
}
