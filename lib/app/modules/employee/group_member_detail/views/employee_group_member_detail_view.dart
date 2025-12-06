import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/list/list_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/text_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_bottom_sheet.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_default_wrapper.dart';

import '../controllers/employee_group_member_detail_controller.dart';

class EmployeeGroupMemberDetailView
    extends GetView<EmployeeGroupMemberDetailController> {
  const EmployeeGroupMemberDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppDefaultWrapper(
      withPadding: false,
      title: poppins('Detail Anggota', fontWeight: FontWeight.w600),
      child: SingleChildScrollView(
        child: Obx(
          () => controller.isLoading
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Center(child: CircularProgressIndicator()),
                )
              : Column(
                  spacing: 8.sp,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: AuthController.find.currentUser!.role == 'admin'
                            ? ElevatedButton.icon(
                                style: buildInkWellButtonStyle(
                                  foregroundColor: AppColor.bg.primary,
                                  backgroundColor: AppColor.bg.lightPrimary,
                                  overlayColor: AppColor.bg.transparentPrimary
                                      .withValues(alpha: 0.2),
                                  borderRadiusCircularSize: 12.sp,
                                ),
                                icon: Icon(Icons.add),
                                label: poppins('Tambah'),
                                onPressed: () {
                                  Get.bottomSheet(
                                    AppBottomSheet(
                                      formKey: controller.formKey,
                                      titleText: poppins(
                                        'Tambah Anggota',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp,
                                      ),
                                      children: [
                                        poppins(
                                          'Anggota',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        DropdownSearch<String>(
                                          enabled: !controller.isFetchingMember,
                                          onChanged: (value) =>
                                              controller.selectMember(value),
                                          selectedItem:
                                              controller.selectedMember?.name ??
                                              'Pilih Anggota',
                                          items:
                                              (filter, infiniteScrollProps) =>
                                                  controller.members.names,
                                          decoratorProps:
                                              DropDownDecoratorProps(
                                                baseStyle: GoogleFonts.poppins(
                                                  fontSize: 14.sp,
                                                ),
                                                decoration:
                                                    buildAppTextInputDecoration(
                                                      hintText: '',
                                                    ),
                                              ),
                                          validator: (value) =>
                                              value.isDropdownRequired(
                                                'PPK',
                                                controller.selectedMember?.name,
                                              ),
                                          popupProps: PopupProps.menu(
                                            fit: FlexFit.loose,
                                            constraints: BoxConstraints(
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
                                                      BorderRadius.circular(12),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
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
                                        SizedBox(height: 18.sp),
                                        SizedBox(
                                          width: double.infinity,
                                          child: AppFilledButton(
                                            label: 'Simpan',
                                            onTap: controller.isSubmitted
                                                ? null
                                                : controller.addMember,
                                            width: double.infinity,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                            : null,
                      ),
                    ),
                    SizedBox.shrink(),
                    _GroupedGroupMemberListView(
                      groupedMembers:
                          controller.groupMembers.groupedByFirstLetter,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _GroupedGroupMemberListView extends StatelessWidget {
  final Map<String, List<UserModel>> groupedMembers;

  const _GroupedGroupMemberListView({required this.groupedMembers});

  @override
  Widget build(BuildContext context) {
    final letters = groupedMembers.keys.toList()..sort();

    return groupedMembers.isNotEmpty
        ? Column(
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.sp,
                      vertical: 4.sp,
                    ),
                    child: poppins(
                      letter,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColor.text.gray,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.sp,
                      vertical: 8.sp,
                    ),
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
                              onTap: () {},
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
                                      color: m.isActive
                                          ? Colors.green
                                          : Colors.red,
                                      size: 8.sp,
                                    ),
                                  ],
                                ),
                                subtitle: Text('#${m.id}'),
                                trailing: Container(
                                  padding: EdgeInsets.all(3.sp),
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: AppColor.border.gray,
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
          )
        : SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Align(
              alignment: Alignment.center,
              child: poppins('Tidak ada data.'),
            ),
          );
  }
}
