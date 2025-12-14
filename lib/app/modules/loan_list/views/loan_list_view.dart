import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/loan/loan_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/date_time/date_time_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/num/num_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_date_input_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_default_wrapper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

import '../controllers/loan_list_controller.dart';

class LoanListView extends GetView<LoanListController> {
  const LoanListView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppDefaultWrapper(
      withPadding: false,
      ableToBack: true,
      title: poppins('Riwayat Pinjaman', fontWeight: FontWeight.w600),
      child: Container(
        padding: EdgeInsets.all(16.sp),
        height: getScreenHeight(context),
        child: Column(
          spacing: 12.sp,
          children: [
            Column(
              children: [
                Row(
                  spacing: 10.sp,
                  children: [
                    Expanded(
                      child: AppDateInputField(
                        prefixIcon: SvgPicture.asset(
                          AppAsset.svgs.searchGray,
                          height: 16.sp,
                        ),
                        controller: controller.searchCtrl,
                        placeholder: 'Cari...',
                        type: DateInputType.monthYear,
                        onChanged: (value) => controller.onSearchChanged(value),
                      ),
                    ),
                    if (AuthController.find.currentUser!.role != 'group_member')
                      Material(
                        borderRadius: BorderRadius.circular(12.sp),
                        color: Colors.white,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12.sp),
                          onTap: () async {
                            final result = await Get.toNamed(
                              Routes.MANAGE_LOAN,
                              arguments: ArgsWrapper(
                                data: controller.member,
                                action: ActionType.create,
                              ),
                            );

                            if (result == true) {
                              controller.fetchListLoan(
                                memberId: controller.member!.id,
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.sp,
                                color: AppColor.border.lightGray,
                              ),
                              borderRadius: BorderRadius.circular(12.sp),
                            ),
                            padding: EdgeInsets.all(10.sp),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                size: 28.sp,
                                color: AppColor.border.gray,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     poppins(
            //       'Filter:',
            //       color: AppColor.text.disabled,
            //       fontSize: 12.sp,
            //     ),
            //     _TabFilter(
            //       title: 'Belum disetujui',
            //       onTap: () {},
            //       isActive: true,
            //     ),
            //     _TabFilter(title: 'Disetujui', onTap: () {}, isActive: false),
            //     _TabFilter(
            //       title: 'Tidak disetujui',
            //       onTap: () {},
            //       isActive: false,
            //     ),
            //   ],
            // ),
            Expanded(
              child: SingleChildScrollView(
                child: Obx(
                  () => controller.isFetching
                      ? SizedBox(
                          height: getScreenHeight(context, scale: 0.7),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : controller.loans.isEmpty
                      ? SizedBox(
                          height: getScreenHeight(context, scale: 0.6),
                          child: Center(child: poppins('Tidak ada data')),
                        )
                      : Column(
                          spacing: 16.sp,
                          children: List.generate(
                            controller.loans.length,
                            (index) => Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(12.sp),
                              child: InkWell(
                                onTap:
                                    AuthController.find.currentUser!.role ==
                                        'group_member'
                                    ? null
                                    : () async {
                                        final result = await Get.toNamed(
                                          Routes.MANAGE_LOAN,
                                          arguments: ArgsWrapper(
                                            data: controller.loans[index],
                                            action: ActionType.update,
                                          ),
                                        );

                                        if (result == true) {
                                          controller.fetchListLoan(
                                            memberId: controller.member!.id,
                                          );
                                        }
                                      },
                                borderRadius: BorderRadius.circular(12.sp),
                                child: _LoanCard(loan: controller.loans[index]),
                              ),
                            ),
                          ),
                        ),
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
  const _LoanCard({required this.loan});

  final LoanModel loan;

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
              poppins(loan.type.displayName, fontWeight: FontWeight.w600),
            ],
          ),
          Column(
            spacing: 4.sp,
            children: [
              _ProfileCell(
                icon: SvgPicture.asset(AppAsset.svgs.calendarPrimary),
                field: 'Bulan',
                value: poppins('${loan.month.toMonthName} ${loan.year}'),
              ),
              _ProfileCell(
                icon: SvgPicture.asset(AppAsset.svgs.morePrimary),
                field: 'Total Pinjaman',
                value: poppins(
                  loan.nominal.toIdr(decimalDigits: 2),
                  fontWeight: FontWeight.bold,
                  color: AppColor.bg.primary,
                ),
              ),
            ],
          ),
          Divider(color: AppColor.border.lightGray, height: 1.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _TabFilter(title: loan.status.displayName, isActive: false),
              poppins(
                loan.updatedAt!.toSlashSeparatedDate(),
                color: AppColor.text.gray,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TabFilter extends StatelessWidget {
  const _TabFilter({required this.title, this.onTap, required this.isActive});

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
