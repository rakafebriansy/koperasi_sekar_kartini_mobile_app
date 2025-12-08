import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/list/list_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/text_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_bottom_sheet.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_default_tabbar.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_group_info_cell.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_group_fund_amount_list.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_joint_liability_fund_amount_list.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_social_fund_amount_list.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_default_wrapper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

import '../controllers/group_detail_controller.dart';

class GroupDetailView extends GetView<GroupDetailController> {
  const GroupDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppDefaultWrapper(
      ableToBack: true,
      title: poppins('Detail Kelompok', fontWeight: FontWeight.w600),
      child: Obx(
        () => controller.group != null && !controller.isLoading
            ? Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 10.sp,
                children: [
                  Column(
                    spacing: 10.sp,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(18.sp),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.sp,
                            color: AppColor.bg.gray,
                          ),
                          borderRadius: BorderRadius.circular(12.sp),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 16.sp,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 4.sp,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(width: 32.sp, height: 32.sp),
                                    poppins(
                                      'Kelompok ${controller.group!.number}',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    AuthController.find.currentUser!.role ==
                                            'admin'
                                        ? Material(
                                            borderRadius: BorderRadius.circular(
                                              99,
                                            ),
                                            child: InkWell(
                                              onTap: controller.group == null
                                                  ? null
                                                  : () async {
                                                      final result =
                                                          await Get.toNamed(
                                                            Routes.MANAGE_GROUP,
                                                            arguments: ArgsWrapper(
                                                              action: ActionType
                                                                  .update,
                                                              data: controller
                                                                  .group!,
                                                            ),
                                                          );
                                                      if (result == true) {
                                                        controller
                                                            .fetchGroupById(
                                                              controller
                                                                  .group!
                                                                  .id,
                                                            );
                                                      }
                                                    },
                                              borderRadius:
                                                  BorderRadius.circular(99),
                                              child: SizedBox(
                                                width: 32.sp,
                                                height: 32.sp,
                                                child: Center(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            99,
                                                          ),
                                                    ),
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.edit,
                                                        size: 20.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : SizedBox(height: 32.sp, width: 32.sp),
                                  ],
                                ),
                                SizedBox(height: 2.sp),
                                poppins(
                                  controller.group!.workArea!.name,
                                  color: AppColor.text.gray,
                                ),
                              ],
                            ),
                            Column(
                              spacing: 3.sp,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AppGroupInfoCell(
                                  icon: Icon(
                                    Icons.person,
                                    color: AppColor.bg.primary,
                                  ),
                                  field: 'PJK',
                                  value: Row(
                                    children: [
                                      controller.group!.chairman != null
                                          ? poppins(
                                              controller.group!.chairman!.name,
                                            )
                                          : poppins('-'),
                                      if (AuthController
                                              .find
                                              .currentUser
                                              ?.role ==
                                          'employee')
                                        Material(
                                          child: InkWell(
                                            onTap: () {
                                              Get.bottomSheet(
                                                AppBottomSheet(
                                                  formKey: controller
                                                      .chairmanFormKey,
                                                  titleText: poppins(
                                                    'Pilih Penanggung Jawab',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20.sp,
                                                  ),
                                                  children: [
                                                    poppins(
                                                      'PJK',
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                    DropdownSearch<String>(
                                                      enabled: !controller
                                                          .isFetchingMember,
                                                      onChanged: (value) =>
                                                          controller
                                                              .selectChairman(
                                                                value,
                                                              ),
                                                      selectedItem:
                                                          controller
                                                              .selectedChairman
                                                              ?.name ??
                                                          'Pilih Anggota',
                                                      items:
                                                          (
                                                            filter,
                                                            infiniteScrollProps,
                                                          ) => controller
                                                              .members
                                                              .names,
                                                      decoratorProps:
                                                          DropDownDecoratorProps(
                                                            baseStyle:
                                                                GoogleFonts.poppins(
                                                                  fontSize:
                                                                      14.sp,
                                                                ),
                                                            decoration:
                                                                buildAppTextInputDecoration(
                                                                  hintText: '',
                                                                ),
                                                          ),
                                                      validator: (value) => value
                                                          .isDropdownRequired(
                                                            'PJK',
                                                            controller
                                                                .selectedChairman
                                                                ?.name,
                                                          ),
                                                      popupProps: PopupProps.menu(
                                                        fit: FlexFit.loose,
                                                        constraints:
                                                            BoxConstraints(
                                                              maxHeight: 200.sp,
                                                            ),
                                                        itemBuilder:
                                                            (
                                                              context,
                                                              item,
                                                              isSelected,
                                                              onTap,
                                                            ) => InkWell(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    12,
                                                                  ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          12.sp,
                                                                      vertical:
                                                                          12.sp,
                                                                    ),
                                                                child: poppins(
                                                                  item,
                                                                  fontSize:
                                                                      14.sp,
                                                                ),
                                                              ),
                                                            ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 18.sp),
                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: AppFilledButton(
                                                        label: 'Simpan',
                                                        onTap:
                                                            controller
                                                                .isSubmitted
                                                            ? null
                                                            : controller
                                                                  .updateChairman,
                                                        width: double.infinity,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                left: 8.sp,
                                              ),
                                              child: poppins(
                                                controller.group!.chairman !=
                                                        null
                                                    ? 'Ubah'
                                                    : 'Atur',
                                                color: Colors.blue,
                                                textStyle: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor: Colors.blue,
                                                  decorationThickness: 2,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                AppGroupInfoCell(
                                  icon: Icon(
                                    Icons.person_4,
                                    color: AppColor.bg.primary,
                                  ),
                                  field: 'PPK',
                                  value: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      controller.group!.facilitator != null
                                          ? poppins(
                                              controller
                                                  .group!
                                                  .facilitator!
                                                  .name,
                                            )
                                          : poppins('-'),
                                      if (AuthController
                                              .find
                                              .currentUser
                                              ?.role ==
                                          'employee')
                                        Material(
                                          child: InkWell(
                                            onTap: () {
                                              Get.bottomSheet(
                                                AppBottomSheet(
                                                  formKey: controller
                                                      .facilitatorFormKey,
                                                  titleText: poppins(
                                                    'Pilih Petugas Pendamping',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20.sp,
                                                  ),
                                                  children: [
                                                    poppins(
                                                      'PPK',
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                    DropdownSearch<String>(
                                                      enabled: !controller
                                                          .isFetchingEmployee,
                                                      onChanged: (value) =>
                                                          controller
                                                              .selectFacilitator(
                                                                value,
                                                              ),
                                                      selectedItem:
                                                          controller
                                                              .selectedFacilitator
                                                              ?.name ??
                                                          'Pilih Karyawan',
                                                      items:
                                                          (
                                                            filter,
                                                            infiniteScrollProps,
                                                          ) => controller
                                                              .employees
                                                              .names,
                                                      decoratorProps:
                                                          DropDownDecoratorProps(
                                                            baseStyle:
                                                                GoogleFonts.poppins(
                                                                  fontSize:
                                                                      14.sp,
                                                                ),
                                                            decoration:
                                                                buildAppTextInputDecoration(
                                                                  hintText: '',
                                                                ),
                                                          ),
                                                      validator: (value) => value
                                                          .isDropdownRequired(
                                                            'PPK',
                                                            controller
                                                                .selectedFacilitator
                                                                ?.name,
                                                          ),
                                                      popupProps: PopupProps.menu(
                                                        fit: FlexFit.loose,
                                                        constraints:
                                                            BoxConstraints(
                                                              maxHeight: 200.sp,
                                                            ),
                                                        itemBuilder:
                                                            (
                                                              context,
                                                              item,
                                                              isSelected,
                                                              onTap,
                                                            ) => InkWell(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    12,
                                                                  ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          12.sp,
                                                                      vertical:
                                                                          12.sp,
                                                                    ),
                                                                child: poppins(
                                                                  item,
                                                                  fontSize:
                                                                      14.sp,
                                                                ),
                                                              ),
                                                            ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 18.sp),
                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: AppFilledButton(
                                                        label: 'Simpan',
                                                        onTap:
                                                            controller
                                                                .isSubmitted
                                                            ? null
                                                            : controller
                                                                  .updateFacilitator,
                                                        width: double.infinity,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                left: 8.sp,
                                              ),
                                              child: poppins(
                                                controller.group!.facilitator !=
                                                        null
                                                    ? 'Ubah'
                                                    : 'Atur',
                                                color: Colors.blue,
                                                textStyle: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor: Colors.blue,
                                                  decorationThickness: 2,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 4.sp),
                                Divider(
                                  height: 0.5.sp,
                                  color: AppColor.border.lightGray,
                                ),
                                SizedBox(height: 2.sp),
                                poppins(
                                  textAlign: TextAlign.center,
                                  controller.group!.description != null
                                      ? controller.group!.description!
                                      : '',
                                ),
                                SizedBox(height: 2.sp),
                                Divider(
                                  height: 0.5.sp,
                                  color: AppColor.border.lightGray,
                                ),
                                SizedBox(height: 4.sp),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      style: buildInkWellButtonStyle(
                                        foregroundColor: AppColor.bg.primary,
                                        backgroundColor:
                                            AppColor.bg.lightPrimary,
                                        overlayColor: AppColor
                                            .bg
                                            .transparentPrimary
                                            .withValues(alpha: 0.2),
                                        borderRadiusCircularSize: 12.sp,
                                      ),
                                      onPressed: () async {
                                        final result = await Get.toNamed(
                                          Routes.EMPLOYEE_GROUP_MEMBER_DETAIL,
                                          arguments: ArgsWrapper(
                                            data: controller.group,
                                          ),
                                        );

                                        if (result == true) {
                                          controller.fetchGroupById(
                                            controller.group!.id,
                                          );
                                        }
                                      },
                                      child: Icon(Icons.group),
                                    ),
                                    Row(
                                      spacing: 6.sp,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ElevatedButton(
                                          style: buildInkWellButtonStyle(
                                            foregroundColor:
                                                AppColor.bg.primary,
                                            backgroundColor:
                                                AppColor.bg.lightPrimary,
                                            overlayColor: AppColor
                                                .bg
                                                .transparentPrimary
                                                .withValues(alpha: 0.2),
                                            borderRadiusCircularSize: 12.sp,
                                          ),
                                          onPressed: () async {
                                            final result = await Get.toNamed(
                                              Routes
                                                  .EMPLOYEE_GROUP_MEMBER_DETAIL,
                                            );
                                            if (result == true) {
                                              controller.fetchGroupById(
                                                controller.group!.id,
                                              );
                                            }
                                          },
                                          child: poppins(
                                            'Atur Kas',
                                            color: AppColor.bg.primary,
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: buildInkWellButtonStyle(
                                            foregroundColor:
                                                AppColor.bg.primary,
                                            backgroundColor:
                                                AppColor.bg.lightPrimary,
                                            overlayColor: AppColor
                                                .bg
                                                .transparentPrimary
                                                .withValues(alpha: 0.2),
                                            borderRadiusCircularSize: 12.sp,
                                          ),
                                          onPressed: () async {
                                            final result = await Get.toNamed(
                                              Routes.EMPLOYEE_MANAGE_REPORT,
                                            );
                                            if (result == true) {
                                              controller.fetchGroupById(
                                                controller.group!.id,
                                              );
                                            }
                                          },
                                          child: poppins(
                                            'Atur Rapot',
                                            color: AppColor.bg.primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 2.sp, 0, 0),
                        child: poppins(
                          'Riwayat',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: AppDefaultTabbar(
                      views: [
                        AppJointLiabilityFundAmountList(controller: controller),
                        AppGroupFundAmountList(controller: controller),
                        AppSocialFundAmountList(controller: controller),
                      ],
                      tabLabels: ['Kas T.R.', 'Kas Kel.', 'Dana Sosial'],
                    ),
                  ),
                ],
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
