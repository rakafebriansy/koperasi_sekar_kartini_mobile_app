import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_employee/partials/app_employee_1st_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_employee/partials/app_employee_2nd_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/action_type/action_type_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_bottom_sheet.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_outlined_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_form_wrapper.dart';

import '../controllers/employee_manage_employee_controller.dart';

class EmployeeManageEmployeeView
    extends GetView<EmployeeManageEmployeeController> {
  const EmployeeManageEmployeeView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppFormWrapper(
      ableToBack: true,
      title: controller.action != null
          ? (controller.action!.isCreateAction
                ? 'Tambah Karyawan'
                : 'Ubah Karyawan')
          : 'Detail Karyawan',
      actions: [
        if (AuthController.find.currentUser?.role == 'admin')
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Get.bottomSheet(
                  AppBottomSheet(
                    titleText: poppins(
                      'Hapus Karyawan',
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
                              'Yakin menghapus karyawan?',
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
                                controller.deleteEmployee();
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
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        controller: controller.scrollController,
        child: Obx(
          () => IndexedStack(
            index: controller.selectedScreen,
            children: [
              AppEmployee1stForm(controller: controller),
              AppEmployee2ndForm(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
