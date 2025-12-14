import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/list/list_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_text_form_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_default_wrapper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

import '../controllers/user_loan_list_controller.dart';

class UserLoanListView extends GetView<UserLoanListController> {
  const UserLoanListView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppDefaultWrapper(
      withPadding: false,
      title: poppins('Riwayat Pinjaman', fontWeight: FontWeight.w600),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.sp),
            child: AppTextFormField(
              onChanged: (val) => controller.onSearchChanged(val),
              controller: controller.searchCtrl,
              hintText: 'Cari...',
              prefixIcon: Icon(
                Icons.search,
                size: 20.sp,
                color: AppColor.border.darkGray,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Obx(
                () => controller.isFetching
                    ? SizedBox(
                        height: getScreenHeight(context, scale: 0.7),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : controller.members.isEmpty
                    ? SizedBox(
                        height: getScreenHeight(context, scale: 0.6),
                        child: Center(child: poppins('Tidak ada data')),
                      )
                    : _GroupedMemberListView(controller: controller),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GroupedMemberListView extends StatelessWidget {
  final UserLoanListController controller;

  const _GroupedMemberListView({required this.controller});

  @override
  Widget build(BuildContext context) {
    final groupedMembers = controller.members.groupedByFirstLetter;
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
                            Routes.LOAN_LIST,
                            arguments: ArgsWrapper(data: m),
                          );

                          if (result == true) {
                            controller.fetchListMember();
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
