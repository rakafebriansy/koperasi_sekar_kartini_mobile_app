import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/action_type/action_type_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/list/list_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/text_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_bottom_sheet.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_outlined_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_form_wrapper.dart';

import '../controllers/manage_group_controller.dart';

class ManageGroupView extends GetView<ManageGroupController> {
  const ManageGroupView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppFormWrapper(
      ableToBack: true,
      title: controller.action != null
          ? (controller.action!.isCreateAction
                ? 'Tambah Kelompok'
                : 'Ubah Kelompok')
          : 'Detail Kelompok',
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
                                controller.deleteGroup();
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
      child: Obx(
        () => Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 8.sp),
                AppTextFormGroup(
                  controller: controller.numberCtrl,
                  label: 'Nomor',
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) =>
                      value.isRequired('Nomor') ?? value.isNumeric('Nomor'),
                ),
                SizedBox(height: 8.sp),
                poppins(
                  'Wilayah Kerja',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                DropdownSearch<String>(
                  enabled: !controller.isFetchingWorkArea,
                  onChanged: (value) => controller.selectWorkArea(value),
                  selectedItem:
                      controller.selectedWorkArea?.name ??
                      'Pilih Wilayah Kerja',
                  items: (filter, infiniteScrollProps) =>
                      controller.workAreas.names,
                  decoratorProps: DropDownDecoratorProps(
                    baseStyle: GoogleFonts.poppins(fontSize: 14.sp),
                    decoration: buildAppTextInputDecoration(hintText: ''),
                  ),
                  validator: (value) =>
                     value.isDropdownRequired('Wilayah Kerja', controller.selectedWorkArea?.name),
                  popupProps: PopupProps.menu(
                    fit: FlexFit.loose,
                    constraints: BoxConstraints(maxHeight: 200.sp),
                    itemBuilder: (context, item, isSelected, onTap) => InkWell(
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.sp,
                          vertical: 12.sp,
                        ),
                        child: poppins(item, fontSize: 14.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.sp),
                poppins('Status', fontSize: 14.sp, fontWeight: FontWeight.w600),
                DropdownSearch<String>(
                  enabled: true,
                  selectedItem: controller.isActiveString ?? 'Pilih Status',
                  items: (filter, infiniteScrollProps) => [
                    'Aktif',
                    'Tidak Aktif',
                  ],
                  decoratorProps: DropDownDecoratorProps(
                    baseStyle: GoogleFonts.poppins(fontSize: 14.sp),
                    decoration: buildAppTextInputDecoration(hintText: ''),
                  ),
                  onChanged: (value) => controller.selectStatus(value),
                  validator: (value) => value.isDropdownRequired('Status', controller.isActiveString),
                  popupProps: PopupProps.menu(
                    fit: FlexFit.loose,
                    constraints: BoxConstraints(maxHeight: 200.sp),
                    itemBuilder: (context, item, isSelected, onTap) => InkWell(
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.sp,
                          vertical: 12.sp,
                        ),
                        child: poppins(item, fontSize: 14.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.sp),
                poppins(
                  'Penanggung Jawab Kelompok',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 4.sp),
                DropdownSearch<String>(
                  enabled: controller.action!.isUpdateAction && !controller.isFetchingMember,
                  onChanged: (value) => controller.selectChairman(value),
                  selectedItem:
                      controller.selectedChairman?.name ?? 'Pilih Anggota',
                  items: (filter, infiniteScrollProps) =>
                      controller.members.names,
                  decoratorProps: DropDownDecoratorProps(
                    baseStyle: GoogleFonts.poppins(fontSize: 14.sp),
                    decoration: buildAppTextInputDecoration(hintText: ''),
                  ),
                  popupProps: PopupProps.menu(
                    fit: FlexFit.loose,
                    constraints: BoxConstraints(maxHeight: 200.sp),
                    itemBuilder: (context, item, isSelected, onTap) => InkWell(
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.sp,
                          vertical: 12.sp,
                        ),
                        child: poppins(item, fontSize: 14.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.sp),
                poppins(
                  'Petugas Pendamping Kelompok',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 4.sp),
                DropdownSearch<String>(
                  enabled: !controller.isFetchingEmployee,
                  onChanged: (value) => controller.selectFacilitator(value),
                  selectedItem:
                      controller.selectedFacilitator?.name ?? 'Pilih Karyawan',
                  items: (filter, infiniteScrollProps) =>
                      controller.employees.names,
                  decoratorProps: DropDownDecoratorProps(
                    baseStyle: GoogleFonts.poppins(fontSize: 14.sp),
                    decoration: buildAppTextInputDecoration(hintText: ''),
                  ),
                  popupProps: PopupProps.menu(
                    fit: FlexFit.loose,
                    constraints: BoxConstraints(maxHeight: 200.sp),
                    itemBuilder: (context, item, isSelected, onTap) => InkWell(
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.sp,
                          vertical: 12.sp,
                        ),
                        child: poppins(item, fontSize: 14.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.sp),
                AppTextFormGroup(
                  controller: controller.descCtrl,
                  label: 'Ketetapan',
                  maxLines: 3,
                ),
                SizedBox(height: 18.sp),
                SizedBox(
                  width: double.infinity,
                  child: AppFilledButton(
                    label: 'Simpan',
                    onTap:
                        controller.isLoading ||
                            controller.isSubmitted ||
                            (AuthController.find.currentUser != null &&
                                AuthController.find.currentUser!.role !=
                                    'admin')
                        ? null
                        : controller.submitButton,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 12.sp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
