import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/loan/loan_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
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

import '../controllers/manage_loan_controller.dart';

class ManageLoanView extends GetView<ManageLoanController> {
  const ManageLoanView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppFormWrapper(
      ableToBack: true,
      title: controller.action != null
          ? (controller.action!.isCreateAction
                ? 'Tambah Pinjaman'
                : 'Ubah Pinjaman')
          : 'Detail Pinjaman',
      actions: [
        if (controller.action == null &&
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
                                controller.deleteLoan();
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
                  'Anggota',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 4.sp),
                Obx(
                  () => DropdownSearch<String>(
                    enabled: controller.action == ActionType.create,
                    onChanged: (value) => controller.selectLoanType(value),
                    selectedItem:
                        controller.selectedLoanType?.displayName ??
                        'Pilih Jenis Pinjaman',
                    items: (filter, infiniteScrollProps) =>
                        controller.loanTypes.names,
                    decoratorProps: DropDownDecoratorProps(
                      baseStyle: GoogleFonts.poppins(fontSize: 14.sp),
                      decoration: buildAppTextInputDecoration(hintText: ''),
                    ),
                    validator: (value) => value.isDropdownRequired(
                      'Jenis Pinjaman',
                      controller.selectedLoanType?.displayName,
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
                  enabled: controller.action == ActionType.create,
                  controller: controller.dateCtrl,
                  placeholder: 'Masukkan bulan',
                  label: 'Bulan',
                  type: DateInputType.monthYear,
                ),
                SizedBox(height: 8.sp),
                AppTextFormGroup(
                  enabled: controller.action == ActionType.create,
                  controller: controller.amountCtrl,
                  label: 'Nominal',
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) =>
                      value.isRequired('Nominal') ?? value.isNumeric('Nominal'),
                ),

                SizedBox(height: 18.sp),
                if (!(controller.loan != null &&
                    controller.loan!.status == LoanStatus.paid))
                  SizedBox(
                    width: double.infinity,
                    child: AppFilledButton(
                      label:
                          controller.action != null &&
                              controller.action!.isUpdateAction
                          ? 'Tandai Dibayar'
                          : 'Simpan',
                      onTap:
                          controller.isFetchingMember || controller.isSubmitted
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
