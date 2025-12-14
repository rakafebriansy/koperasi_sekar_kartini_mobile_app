import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/list/list_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/num/num_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/text_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_bottom_sheet.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_group_info_cell.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';
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
            ? SingleChildScrollView(
                child: Column(
                  spacing: 10.sp,
                  children: [
                    _GroupInfoCard(controller: controller),
                    Obx(
                      () => controller.isLoading
                          ? SizedBox(
                              height: getScreenHeight(context, scale: 0.54),
                              child: Center(child: CircularProgressIndicator()),
                            )
                          : Column(
                              spacing: 8.sp,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.sp,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          2.sp,
                                          0,
                                          0,
                                        ),
                                        child: poppins(
                                          'Anggota',
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      if (AuthController
                                              .find
                                              .currentUser!
                                              .role ==
                                          'admin')
                                        ElevatedButton.icon(
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
                                          icon: Icon(Icons.add),
                                          label: poppins('Tambah'),
                                          onPressed: _addMember,
                                        ),
                                    ],
                                  ),
                                ),
                                Obx(
                                  () => controller.groupMembers.isNotEmpty
                                      ? _GroupedGroupMemberListView(
                                          controller: controller,
                                        )
                                      : SizedBox(
                                          height: getScreenHeight(
                                            context,
                                            scale: 0.54,
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: poppins('Tidak ada data.'),
                                          ),
                                        ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }

  void _addMember() {
    Get.bottomSheet(
      AppBottomSheet(
        formKey: controller.addMemberFormKey,
        titleText: poppins(
          'Tambah Anggota',
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
        children: [
          poppins('Anggota', fontSize: 14.sp, fontWeight: FontWeight.w600),
          DropdownSearch<String>(
            enabled: !controller.isFetchingMember,
            onChanged: (value) => controller.selectMember(value),
            selectedItem: controller.selectedMember?.name ?? 'Pilih Anggota',
            items: (filter, infiniteScrollProps) => controller.members.names,
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
          SizedBox(height: 18.sp),
          SizedBox(
            width: double.infinity,
            child: AppFilledButton(
              label: 'Simpan',
              onTap: controller.isSubmitted ? null : controller.addMember,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}

class _GroupInfoCard extends StatelessWidget {
  const _GroupInfoCard({required this.controller});

  final GroupDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.sp),
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
                  AuthController.find.currentUser!.role == 'admin'
                      ? Material(
                          borderRadius: BorderRadius.circular(99),
                          child: InkWell(
                            onTap: controller.group == null
                                ? null
                                : () async {
                                    final result = await Get.toNamed(
                                      Routes.MANAGE_GROUP,
                                      arguments: ArgsWrapper(
                                        action: ActionType.update,
                                        data: controller.group!,
                                      ),
                                    );
                                    if (result == true) {
                                      controller.fetchGroupById(
                                        controller.group!.id,
                                      );
                                    }
                                  },
                            borderRadius: BorderRadius.circular(99),
                            child: SizedBox(
                              width: 32.sp,
                              height: 32.sp,
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(99),
                                  ),
                                  child: Center(
                                    child: Icon(Icons.edit, size: 20.sp),
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
                controller.group!.workArea.name,
                color: AppColor.text.gray,
              ),
            ],
          ),
          Column(
            spacing: 3.sp,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppGroupInfoCell(
                icon: Icon(Icons.person, color: AppColor.bg.primary),
                field: 'Kas Tanggung Renteng',
                value: poppins(
                  controller.group!.sharedLiabilityFundAmount.toIdr(),
                ),
              ),
              AppGroupInfoCell(
                icon: Icon(Icons.person, color: AppColor.bg.primary),
                field: 'Kas Kelompok',
                value: poppins(controller.group!.groupFundAmount.toIdr()),
              ),
              AppGroupInfoCell(
                icon: Icon(Icons.person, color: AppColor.bg.primary),
                field: 'Dana Sosial',
                value: poppins(controller.group!.socialFundAmount.toIdr()),
              ),
              AppGroupInfoCell(
                icon: Icon(Icons.person, color: AppColor.bg.primary),
                field: 'PJK',
                value: Row(
                  children: [
                    controller.group!.chairman != null
                        ? poppins(controller.group!.chairman!.name)
                        : poppins('-'),
                    if (AuthController.find.currentUser?.role == 'employee')
                      Material(
                        child: InkWell(
                          onTap: _selectChairman,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.sp),
                            child: poppins(
                              controller.group!.chairman != null
                                  ? 'Ubah'
                                  : 'Atur',
                              color: Colors.blue,
                              textStyle: TextStyle(
                                decoration: TextDecoration.underline,
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
                icon: Icon(Icons.person_4, color: AppColor.bg.primary),
                field: 'PPK',
                value: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    controller.group!.facilitator != null
                        ? poppins(controller.group!.facilitator!.name)
                        : poppins('-'),
                    if (AuthController.find.currentUser?.role == 'employee')
                      Material(
                        child: InkWell(
                          onTap: _selectFacilitator,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.sp),
                            child: poppins(
                              controller.group!.facilitator != null
                                  ? 'Ubah'
                                  : 'Atur',
                              color: Colors.blue,
                              textStyle: TextStyle(
                                decoration: TextDecoration.underline,
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
              Divider(height: 0.5.sp, color: AppColor.border.lightGray),
              SizedBox(height: 2.sp),
              poppins(
                textAlign: TextAlign.center,
                controller.group!.description != null
                    ? controller.group!.description!
                    : '',
              ),
              SizedBox(height: 2.sp),
              Divider(height: 0.5.sp, color: AppColor.border.lightGray),
              SizedBox(height: 4.sp),
              Row(
                spacing: 6.sp,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: buildInkWellButtonStyle(
                      foregroundColor: AppColor.bg.primary,
                      backgroundColor: AppColor.bg.lightPrimary,
                      overlayColor: AppColor.bg.transparentPrimary.withValues(
                        alpha: 0.2,
                      ),
                      borderRadiusCircularSize: 12.sp,
                    ),
                    onPressed: _changeFundTypeAmount,
                    child: poppins('Atur Kas', color: AppColor.bg.primary),
                  ),
                  ElevatedButton(
                    style: buildInkWellButtonStyle(
                      foregroundColor: AppColor.bg.primary,
                      backgroundColor: AppColor.bg.lightPrimary,
                      overlayColor: AppColor.bg.transparentPrimary.withValues(
                        alpha: 0.2,
                      ),
                      borderRadiusCircularSize: 12.sp,
                    ),
                    onPressed: () async {

                      final result = await Get.toNamed(
                        Routes.REPORT_LIST,
                        arguments: ArgsWrapper(data: controller.group)
                      );
                      if (result == true) {
                        controller.fetchGroupById(controller.group!.id);
                      }
                    },
                    child: poppins('Atur Rapot', color: AppColor.bg.primary),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _changeFundTypeAmount() async {
    Get.bottomSheet(
      AppBottomSheet(
        formKey: controller.changeFundAmountFormKey,
        titleText: poppins(
          'Atur Kas',
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
        children: [
          poppins('Jenis Kas', fontSize: 14.sp, fontWeight: FontWeight.w600),
          DropdownSearch<String>(
            onChanged: (value) => controller.selectFundType(value),
            selectedItem:
                controller.selectedFundType?.displayName ?? 'Pilih Jenis Kas',
            items: (filter, infiniteScrollProps) =>
                controller.fundTypes.displayNames,
            decoratorProps: DropDownDecoratorProps(
              baseStyle: GoogleFonts.poppins(fontSize: 14.sp),
              decoration: buildAppTextInputDecoration(hintText: ''),
            ),
            validator: (value) => value.isDropdownRequired(
              'Jenis Kas',
              controller.selectedFundType?.displayName,
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
          AppTextFormGroup(
            controller: controller.fundAmountCtrl,
            label: 'Jumlah Kas',
            maxLines: 1,
            keyboardType: TextInputType.number,
            placeholder: 'Masukkan jumlah kas',
            validator: (value) => value.isRequired('Jumlah Kas'),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(height: 6.sp),
          SizedBox(
            width: double.infinity,
            child: AppFilledButton(
              label: 'Simpan',
              onTap: controller.isSubmitted
                  ? null
                  : controller.changeFundAmount,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  void _selectChairman() {
    Get.bottomSheet(
      AppBottomSheet(
        formKey: controller.chairmanFormKey,
        titleText: poppins(
          'Pilih Penanggung Jawab',
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
        children: [
          poppins('PJK', fontSize: 14.sp, fontWeight: FontWeight.w600),
          DropdownSearch<String>(
            enabled: !controller.isFetchingMember,
            onChanged: (value) => controller.selectChairman(value),
            selectedItem: controller.selectedChairman?.name ?? 'Pilih Anggota',
            items: (filter, infiniteScrollProps) => controller.members.names,
            decoratorProps: DropDownDecoratorProps(
              baseStyle: GoogleFonts.poppins(fontSize: 14.sp),
              decoration: buildAppTextInputDecoration(hintText: ''),
            ),
            validator: (value) => value.isDropdownRequired(
              'PJK',
              controller.selectedChairman?.name,
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
          SizedBox(height: 18.sp),
          SizedBox(
            width: double.infinity,
            child: AppFilledButton(
              label: 'Simpan',
              onTap: controller.isSubmitted ? null : controller.updateChairman,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  void _selectFacilitator() {
    Get.bottomSheet(
      AppBottomSheet(
        formKey: controller.facilitatorFormKey,
        titleText: poppins(
          'Pilih Petugas Pendamping',
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
        children: [
          poppins('PPK', fontSize: 14.sp, fontWeight: FontWeight.w600),
          DropdownSearch<String>(
            enabled: !controller.isFetchingEmployee,
            onChanged: (value) => controller.selectFacilitator(value),
            selectedItem:
                controller.selectedFacilitator?.name ?? 'Pilih Karyawan',
            items: (filter, infiniteScrollProps) => controller.employees.names,
            decoratorProps: DropDownDecoratorProps(
              baseStyle: GoogleFonts.poppins(fontSize: 14.sp),
              decoration: buildAppTextInputDecoration(hintText: ''),
            ),
            validator: (value) => value.isDropdownRequired(
              'PPK',
              controller.selectedFacilitator?.name,
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
          SizedBox(height: 18.sp),
          SizedBox(
            width: double.infinity,
            child: AppFilledButton(
              label: 'Simpan',
              onTap: controller.isSubmitted
                  ? null
                  : controller.updateFacilitator,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}

class _GroupedGroupMemberListView extends StatelessWidget {
  final GroupDetailController controller;

  const _GroupedGroupMemberListView({required this.controller});

  @override
  Widget build(BuildContext context) {
    final groupedMembers = controller.groupMembers.groupedByFirstLetter;
    final letters = groupedMembers.keys.toList()..sort();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(letters.length, (index) {
        final letter = letters[index];
        final members = groupedMembers[letter]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: AppColor.bg.lightGray),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 4.sp),
              child: poppins(
                letter,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.text.gray,
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
              child: Column(
                children: List.generate(members.length, (idx) {
                  final m = members[idx];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.sp),
                    child: Material(
                      borderRadius: BorderRadius.circular(14.sp),
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14.sp),
                        onTap: () async {
                          final result = await Get.toNamed(
                            Routes.MANAGE_GROUP_MEMBER_PROFILE,
                            arguments: ArgsWrapper(
                              data: m,
                              action: ActionType.update,
                            ),
                          );

                          if (result == true) {
                            controller.fetchListGroupMember(controller.id!);
                            controller.fetchUnlistedMembers(
                              controller.group!.id,
                            );
                          }
                        },
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8.sp,
                            vertical: 1.sp,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.sp),
                            side: BorderSide(
                              width: 1.sp,
                              color: AppColor.bg.gray,
                            ),
                          ),
                          leading: CircleAvatar(child: Text(m.name[0])),
                          title: Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 8.sp,
                            children: [
                              Text(m.name),
                              Icon(
                                Icons.circle,
                                color: m.isActive ? Colors.green : Colors.red,
                                size: 8.sp,
                              ),
                            ],
                          ),
                          subtitle: Text('#${m.id}'),
                          trailing: Container(
                            padding: EdgeInsets.all(3.sp),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColor.border.darkGray,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      }),
    );
  }
}
