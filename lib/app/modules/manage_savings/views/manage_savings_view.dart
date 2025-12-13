import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/action_type/action_type_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/list/list_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/text_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_bottom_sheet.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_date_input_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_outlined_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_form_wrapper.dart';

import '../controllers/manage_savings_controller.dart';

class ManageSavingsView extends GetView<ManageSavingsController> {
  const ManageSavingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppFormWrapper(
      ableToBack: true,
      title: controller.action != null
          ? (controller.action!.isCreateAction
                ? 'Tambah Simpanan'
                : 'Ubah Simpanan')
          : 'Detail Simpanan',
      actions: [
        if (AuthController.find.currentUser?.role == 'admin')
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
                              'Yakin menghapus pinjaman?',
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
                                controller.deleteSavings();
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
                poppins(
                  'Jenis Simpanan',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 4.sp),
                Obx(
                  () => DropdownSearch<String>(
                  enabled: controller.action != null,
                    onChanged: (value) => controller.selectSavingsType(value),
                    selectedItem:
                        controller.selectedSavingsType?.displayName ??
                        'Pilih Jenis Simpanan',
                    items: (filter, infiniteScrollProps) =>
                        controller.savingsTypes.names,
                    decoratorProps: DropDownDecoratorProps(
                      baseStyle: GoogleFonts.poppins(fontSize: 14.sp),
                      decoration: buildAppTextInputDecoration(hintText: ''),
                    ),
                    validator: (value) => value.isDropdownRequired(
                      'Jenis Pinjaman',
                      controller.selectedSavingsType?.displayName,
                    ),
                    popupProps: PopupProps.menu(
                      fit: FlexFit.loose,
                      constraints: BoxConstraints(maxHeight: 200.sp),
                      itemBuilder: (context, item, isSelected, onTap) =>
                          InkWell(
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
                ),
                SizedBox(height: 8.sp),
                poppins(
                  'Anggota',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 4.sp),
                Obx(
                  () => DropdownSearch<String>(
                    enabled: controller.action != null && !controller.isFetchingMember,
                    onChanged: (value) => controller.selectMember(value),
                    selectedItem:
                        controller.selectedMember?.name ?? 'Pilih Anggota',
                    items: (filter, infiniteScrollProps) =>
                        controller.members.names,
                    decoratorProps: DropDownDecoratorProps(
                      baseStyle: GoogleFonts.poppins(fontSize: 14.sp),
                      decoration: buildAppTextInputDecoration(hintText: ''),
                    ),
                    validator: (value) => value.isDropdownRequired(
                      'Anggota',
                      controller.selectedMember?.name,
                    ),
                    popupProps: PopupProps.menu(
                      fit: FlexFit.loose,
                      constraints: BoxConstraints(maxHeight: 200.sp),
                      itemBuilder: (context, item, isSelected, onTap) =>
                          InkWell(
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
                ),
                SizedBox(height: 8.sp),
                poppins('Bulan', fontSize: 14.sp, fontWeight: FontWeight.w600),
                AppDateInputField(
                  controller: controller.dateCtrl,
                  placeholder: 'Masukkan bulan',
                  label: 'Bulan',
                  type: DateInputType.monthYear,
                  enabled: controller.action != null,
                ),
                SizedBox(height: 8.sp),
                AppTextFormGroup(
                  controller: controller.amountCtrl,
                  enabled: controller.action != null,
                  label: 'Nominal',
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) =>
                      value.isRequired('Nominal') ?? value.isNumeric('Nominal'),
                ),
                SizedBox(height: 18.sp),
                if (controller.action != null &&
                    controller.action!.isCreateAction)
                  SizedBox(
                    width: double.infinity,
                    child: AppFilledButton(
                      label: 'Simpan',
                      onTap:
                          controller.isFetchingMember || controller.isSubmitted
                          ? null
                          : controller.createSavings,
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
