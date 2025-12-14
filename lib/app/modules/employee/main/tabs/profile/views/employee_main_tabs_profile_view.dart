import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/date_time/date_time_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/list/list_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/file_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/text_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_bottom_sheet.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_standard_upload_image_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_upload_image_form_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_home_wrapper.dart';

import '../controllers/employee_main_tabs_profile_controller.dart';

class EmployeeMainTabsProfileView
    extends GetView<EmployeeMainTabsProfileController> {
  const EmployeeMainTabsProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppHomeWrapper(
      child: SingleChildScrollView(
        child: Column(
          spacing: 14.sp,
          children: [
            Obx(() {
              var user = AuthController.find.currentUser;

              return Padding(
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
                            radius: 44.sp,
                            child: poppins(
                              user == null ? '-' : user.name[0],
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6.sp),
                          poppins(
                            user == null ? '-' : user.name,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 2.sp),
                          poppins(
                            user == null ? '-' : user.role,
                            color: AppColor.text.gray,
                          ),
                        ],
                      ),
                      Column(
                        spacing: 3.sp,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _ProfileCell(
                            icon: SvgPicture.asset(
                              AppAsset.svgs.calendarPrimary,
                            ),
                            field: 'Tanggal Lahir',
                            value: user == null
                                ? '-'
                                : user.birthDate.toIdDate(),
                          ),
                          _ProfileCell(
                            icon: SvgPicture.asset(
                              AppAsset.svgs.suitcasePrimary,
                            ),
                            field: 'Pekerjaan',
                            value: user == null ? '-' : user.occupation!,
                          ),
                          _ProfileCell(
                            icon: SvgPicture.asset(AppAsset.svgs.userPrimary),
                            field: 'No. Anggota',
                            value: user != null && user.memberNumber != null
                                ? user.memberNumber!
                                : '-',
                          ),
                          _ProfileCell(
                            icon: SvgPicture.asset(AppAsset.svgs.morePrimary),
                            field: 'Kelompok',
                            value: user != null && user.groupNumber != null
                                ? user.groupNumber.toString()
                                : '-',
                          ),
                        ],
                      ),
                      AppFilledButton(
                        width: 156.sp,
                        height: 32.sp,
                        label: 'Lihat Kartu',
                        onTap: () {
                          showMemberCard();
                        },
                      ),
                    ],
                  ),
                ),
              );
            }),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                poppins('Keanggotaan', fontSize: 16.sp),
                SizedBox(height: 8.sp),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.sp),
                    border: Border.all(width: 1.sp, color: AppColor.bg.gray),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14.sp),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _AppSettingMenuItem(
                          label: 'Simpanan',
                          icon: Icon(
                            Icons.arrow_downward_rounded,
                            color: AppColor.border.gray,
                          ),
                          onTap: () {
                            Get.toNamed(Routes.USER_SAVINGS_LIST);
                          },
                        ),
                        Divider(
                          height: 1.sp,
                          thickness: 1.sp,
                          color: AppColor.bg.gray,
                        ),
                        _AppSettingMenuItem(
                          label: 'Pinjaman',
                          icon: Icon(
                            Icons.arrow_upward_rounded,
                            color: AppColor.border.gray,
                          ),
                          onTap: () {
                            Get.toNamed(Routes.USER_LOAN_LIST);
                          },
                        ),
                        Divider(
                          height: 1.sp,
                          thickness: 1.sp,
                          color: AppColor.bg.gray,
                        ),
                        _AppSettingMenuItem(
                          label: 'Unggah KTA',
                          icon: Icon(
                            Icons.add_photo_alternate,
                            color: AppColor.border.gray,
                          ),
                          onTap: () {
                            Get.bottomSheet(
                              AppBottomSheet(
                                formKey: controller.formKey,
                                titleText: poppins(
                                  'Unggah KTA',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                ),
                                children: [
                                  poppins(
                                    'Anggota',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Obx(
                                    () => DropdownSearch<String>(
                                      enabled: !controller.isFetchingMembers,
                                      onChanged: (value) =>
                                          controller.selectMember(value),
                                      selectedItem:
                                          controller.selectedMember?.name ??
                                          'Pilih Anggota',
                                      items: (filter, infiniteScrollProps) =>
                                          controller.members.names,
                                      decoratorProps: DropDownDecoratorProps(
                                        baseStyle: GoogleFonts.poppins(
                                          fontSize: 14.sp,
                                        ),
                                        decoration: buildAppTextInputDecoration(
                                          hintText: '',
                                        ),
                                      ),
                                      validator: (value) =>
                                          value.isDropdownRequired(
                                            'Anggota',
                                            controller.selectedMember?.name,
                                          ),
                                      popupProps: PopupProps.menu(
                                        fit: FlexFit.loose,
                                        constraints: BoxConstraints(
                                          maxHeight: 200.sp,
                                        ),
                                        itemBuilder:
                                            (context, item, isSelected, onTap) =>
                                                InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                      horizontal: 12.sp,
                                                      vertical: 12.sp,
                                                    ),
                                                    child: poppins(
                                                      item,
                                                      fontSize: 14.sp,
                                                    ),
                                                  ),
                                                ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8.sp),
                                  poppins(
                                    'Foto Diri',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  AppUploadImageFormField(
                                    builder: (onPick) {
                                      return AppStandardUploadImageField(
                                        onPick: onPick,
                                        textButton: 'Unggah',
                                      );
                                    },
                                    onPick: (file) async {
                                      controller.setMemberCardImage(file);
                                    },
                                    validator: (value) =>
                                        value.isRequired('Foto KTA'),
                                  ),
                                  SizedBox(height: 8.sp),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Obx(
                                      () => AppFilledButton(
                                        label: 'Simpan',
                                        onTap: controller.isSubmitted
                                            ? null
                                            : controller.updateMemberCardImage,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                poppins('Setelan', fontSize: 16.sp),
                SizedBox(height: 8.sp),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.sp),
                    border: Border.all(width: 1.sp, color: AppColor.bg.gray),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14.sp),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _AppSettingMenuItem(
                          label: 'Notifikasi',
                          icon: SvgPicture.asset(AppAsset.svgs.bellLightGray),
                        ),
                        Divider(
                          height: 1.sp,
                          thickness: 1.sp,
                          color: AppColor.bg.gray,
                        ),
                        _AppSettingMenuItem(
                          label: 'Ubah Kata Sandi',
                          icon: SvgPicture.asset(AppAsset.svgs.lockLightGray),
                          onTap: () async {
                            await Get.toNamed(Routes.MANAGE_PASSWORD);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(14.sp),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14.sp),
                child: _AppSettingMenuItem(
                  onTap: () {
                    AuthController.find.logout();
                  },
                  label: 'Keluar',
                  textColor: Colors.white,
                  icon: SvgPicture.asset(AppAsset.svgs.logoutWhite),
                ),
              ),
            ),
            SizedBox(height: 8.sp),
          ],
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

class _AppSettingMenuItem extends StatelessWidget {
  const _AppSettingMenuItem({
    required this.label,
    required this.icon,
    this.onTap,
    this.textColor,
  });

  final String label;
  final Widget icon;
  final Color? textColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 14.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.sp,
                width: 20.sp,
                child: Center(child: icon),
              ),
              SizedBox(width: 10.sp),
              Expanded(
                child: poppins(label, fontSize: 14.sp, color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
