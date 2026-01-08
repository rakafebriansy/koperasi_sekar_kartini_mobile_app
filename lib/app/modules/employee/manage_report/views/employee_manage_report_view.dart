import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_report/partials/app_report_1st_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_report/partials/app_report_2nd_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_report/partials/app_report_3rd_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_report/partials/app_report_4th_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_bottom_sheet.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_outlined_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_form_wrapper.dart';

import '../controllers/employee_manage_report_controller.dart';

class EmployeeManageReportView extends GetView<EmployeeManageReportController> {
  const EmployeeManageReportView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppFormWrapper(
      ableToBack: true,
      title: controller.action == ActionType.create
          ? 'Tambah Rapot'
          : controller.action == ActionType.update
          ? 'Ubah Rapot'
          : 'Detail Rapot',
      actions: [
        if (controller.action == ActionType.update &&
            controller.authController.currentUser?.role == 'admin')
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Get.bottomSheet(
                  AppBottomSheet(
                    titleText: poppins(
                      'Hapus Pinjaman',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          spacing: 18.sp,
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColor.bg.danger,
                              radius: 44.sp,
                              child: SvgPicture.asset(
                                AppAsset.svgs.cautionWhite,
                                width: 32.sp,
                                height: 32.sp,
                              ),
                            ),
                            poppins(
                              'Yakin menghapus rapot?',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 12.sp,
                        children: [
                          Expanded(
                            child: AppOutlinedButton(
                              label: 'Batal',
                              onTap: () => Get.back(),
                            ),
                          ),
                          Expanded(
                            child: AppFilledButton(
                              label: 'Hapus',
                              onTap: () {
                                controller.deleteReport();
                                Get.back();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              child: Icon(Icons.delete, color: Colors.white),
            ),
          ),
      ],
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => IndexedStack(
                index: controller.selectedScreen,
                children: [
                  AppReport1stForm(controller: controller),
                  AppReport2ndForm(controller: controller),
                  AppReport3rdForm(controller: controller),
                  AppReport4thForm(controller: controller),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
