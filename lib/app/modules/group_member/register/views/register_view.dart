import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/register/partials/app_register_1st_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/register/partials/app_register_2nd_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/register/partials/app_register_3rd_Form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/register/partials/app_register_4th_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/register/partials/app_register_5th_form.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_default_wrapper.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppDefaultWrapper(
        actions: [
          SizedBox(
            width: 60.sp,
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(40.sp),
              value: controller.progress,
              color: Colors.green,
              backgroundColor: Colors.grey[300],
              minHeight: 8,
            ),
          ),
        ],
        leading: controller.selectedScreen > 0
            ? Center(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(999),
                    onTap: () {
                      controller.prevScreen();
                    },
                    child: Container(
                      height: 36.sp,
                      width: 36.sp,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColor.border.lightGray,
                          width: 1.sp,
                        ),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Center(
                        child: SvgPicture.asset(AppAsset.svgs.arrowLeftBlack),
                      ),
                    ),
                  ),
                ),
              )
            : null,
        title: poppins('Register', fontWeight: FontWeight.w600),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          controller: controller.scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              poppins(
                controller.getCurrentTitle,
                fontSize: 36.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.bg.primary,
              ),
              poppins(
                controller.getCurrentSubtitle,
                fontSize: 14.sp,
                color: AppColor.bg.primary,
              ),
              SizedBox(height: 16.sp),
              IndexedStack(
                index: controller.selectedScreen,
                children: [
                  AppRegister1stForm(controller: controller),
                  AppRegister2ndForm(controller: controller),
                  AppRegister3rdForm(controller: controller),
                  AppRegister4thForm(controller: controller),
                  AppRegister5thForm(controller: controller),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
