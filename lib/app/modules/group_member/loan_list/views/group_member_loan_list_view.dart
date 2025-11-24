import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/int/int_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_text_form_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_default_wrapper.dart';

import '../controllers/group_member_loan_list_controller.dart';

class GroupMemberLoanListView extends GetView<GroupMemberLoanListController> {
  const GroupMemberLoanListView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppDefaultWrapper(
      withPadding: false,
      ableToBack: true,
      title: poppins('Riwayat Pinjaman', fontWeight: FontWeight.w600),
      child: Container(
        padding: EdgeInsets.all(16.sp),
        height: MediaQuery.of(context).size.height,
        child: Column(
          spacing: 12.sp,
          children: [
            Column(
              children: [
                Row(
                  spacing: 10.sp,
                  children: [
                    Expanded(
                      child: AppTextFormField(
                        controller: controller.searchCtrl,
                        hintText: 'Cari',
                        prefixIcon: SvgPicture.asset(
                          AppAsset.svgs.searchGray,
                          height: 16.sp,
                        ),
                      ),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(12.sp),
                      color: Colors.white,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12.sp),
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.sp,
                              color: AppColor.border.lightGray,
                            ),
                            borderRadius: BorderRadius.circular(12.sp),
                          ),
                          padding: EdgeInsets.all(16.sp),
                          child: Center(
                            child: SvgPicture.asset(
                              AppAsset.svgs.calendarPrimary,
                              height: 16.sp,
                              width: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  poppins(
                    'Filter:',
                    color: AppColor.text.disabled,
                    fontSize: 12.sp,
                  ),
                  _TabFilter(
                    title: 'Belum disetujui',
                    onTap: () {},
                    isActive: true,
                  ),
                  _TabFilter(title: 'Disetujui', onTap: () {}, isActive: false),
                  _TabFilter(
                    title: 'Tidak disetujui',
                    onTap: () {},
                    isActive: false,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 16.sp,
                  children: List.generate(6, (context) => _LoanCard()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoanCard extends StatelessWidget {
  const _LoanCard({super.key});

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
            mainAxisSize: MainAxisSize.min,
            spacing: 10.sp,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColor.bg.lightPrimary,
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                padding: EdgeInsets.all(8.sp),
                child: Icon(Icons.arrow_upward_rounded),
              ),
              poppins('Pinjaman Biasa', fontWeight: FontWeight.w600),
            ],
          ),
          Column(
            spacing: 4.sp,
            children: [
              _ProfileCell(
                icon: SvgPicture.asset(AppAsset.svgs.calendarPrimary),
                field: 'Bulan',
                value: poppins('Oktober'),
              ),
              _ProfileCell(
                icon: SvgPicture.asset(AppAsset.svgs.morePrimary),
                field: 'Total Pinjaman',
                value: poppins(
                  300000.toIdr(decimalDigits: 2),
                  fontWeight: FontWeight.bold,
                  color: AppColor.bg.primary,
                ),
              ),
              _ProfileCell(
                icon: SvgPicture.asset(AppAsset.svgs.morePrimary),
                field: 'Sisa Belum Terbayar',
                value: poppins(
                  40000.toIdr(),
                  fontWeight: FontWeight.bold,
                  color: AppColor.bg.danger,
                ),
              ),
            ],
          ),
          Divider(color: AppColor.border.lightGray, height: 1.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _TabFilter(title: 'Belum disetujui', isActive: false),
              poppins('30/10/2019', color: AppColor.text.gray),
            ],
          ),
        ],
      ),
    );
  }
}

class _TabFilter extends StatelessWidget {
  const _TabFilter({
    super.key,
    required this.title,
    this.onTap,
    required this.isActive,
  });

  final String title;
  final VoidCallback? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isActive ? AppColor.bg.lightPrimary : AppColor.bg.gray,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(99),
        side: isActive
            ? BorderSide(color: AppColor.border.primary, width: 1.sp)
            : BorderSide.none,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(99),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
          child: poppins(title, color: AppColor.text.gray, fontSize: 11.sp),
        ),
      ),
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

  final SvgPicture icon;
  final String field;
  final Text value;

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
