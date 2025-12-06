import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/main/controllers/employee_main_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/list/list_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';

class AppGroupList extends StatelessWidget {
  const AppGroupList({super.key, required this.controller});

  final EmployeeMainController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 8.sp,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                poppins(
                  'Daftar Kelompok',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                ElevatedButton.icon(
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
                      Routes.MANAGE_GROUP,
                      arguments: ArgsWrapper(
                        action: ActionType.create,
                        data: null,
                      ),
                    );
                    if (result == true) {
                      controller.fetchListGroup();
                    }
                  },
                  label: poppins('Tambah', color: AppColor.bg.primary),
                  icon: Icon(Icons.add, color: AppColor.bg.primary),
                ),
              ],
            ),
          ),
          Obx(
            () => controller.isFetchingGroup
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Center(child: CircularProgressIndicator()),
                  )
                : _GroupedGroupListView(
                    groupedGroup: controller.groups.groupedByDistrict,
                  ),
          ),
        ],
      ),
    );
  }
}

class _GroupedGroupListView extends StatelessWidget {
  final Map<String, List<GroupModel>> groupedGroup;

  const _GroupedGroupListView({required this.groupedGroup});

  @override
  Widget build(BuildContext context) {
    final letters = groupedGroup.keys.toList()..sort();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(letters.length, (index) {
        final letter = letters[index];
        final groups = groupedGroup[letter]!;

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
                children: List.generate(groups.length, (idx) {
                  final g = groups[idx];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.sp),
                    child: Material(
                      borderRadius: BorderRadius.circular(14.sp),
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14.sp),
                        onTap: () {
                          Get.toNamed(
                            Routes.GROUP_DETAIL,
                            arguments: ArgsWrapper(
                              action: ActionType.update,
                              data: g,
                            ),
                          );
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
                          leading: CircleAvatar(
                            child: poppins(g.number.toString()),
                          ),
                          title: poppins('Kelompok ${g.number}'),
                          subtitle: poppins(
                            'PJK: ${g.chairman != null ? g.chairman!.name : '-'}',
                          ),
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
    );
  }
}
