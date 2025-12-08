import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/main/controllers/employee_main_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/list/list_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

class AppCandidateGroupMemberList extends StatelessWidget {
  const AppCandidateGroupMemberList({super.key, required this.controller});

  final EmployeeMainController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 8.sp,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: poppins(
              'Daftar Anggota Nonaktif',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Obx(
            () => controller.isFetchingInactiveMember
                ? SizedBox(
                    height: getScreenHeight(context, scale: 0.7),
                    child: Center(child: CircularProgressIndicator()),
                  )
                : _GroupedGroupMemberListView(controller: controller),
          ),
        ],
      ),
    );
  }
}

class _GroupedGroupMemberListView extends StatelessWidget {
  final EmployeeMainController controller;

  const _GroupedGroupMemberListView({required this.controller});

  @override
  Widget build(BuildContext context) {
    final groupedMembers = controller.inactiveMembers.groupedByFirstLetter;
    final letters = groupedMembers.keys.toList()..sort();

    return groupedMembers.isEmpty
        ? SizedBox(
            height: getScreenHeight(context, scale: 0.6),
            child: Center(child: poppins('Tidak ada data')),
          )
        : Container(
            child: Column(
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
                                onTap: () async {
                                  final result = await Get.toNamed(
                                    Routes.MANAGE_GROUP_MEMBER_PROFILE,
                                    arguments: ArgsWrapper(
                                      data: m,
                                      action: ActionType.update,
                                    ),
                                  );

                                  if (result == true) {
                                    controller.fetchListInactiveMember();
                                    controller.fetchListVerifiedMember();
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
            ),
          );
  }
}
