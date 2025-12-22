import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/list/list_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/num/num_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_text_form_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_home_wrapper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

import '../controllers/group_member_main_tabs_group_controller.dart';

class GroupMemberMainTabsGroupView
    extends GetView<GroupMemberMainTabsGroupController> {
  const GroupMemberMainTabsGroupView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppHomeWrapper(
      withPadding: false,
      child: Obx(
        () => controller.isLoading
            ? SizedBox(
                height: getScreenHeight(context, scale: 0.8),
                child: Center(child: CircularProgressIndicator()),
              )
            : AuthController.find.currentUser!.groupId == null || controller.group == null
            ? SizedBox(
                height: getScreenHeight(context, scale: 0.8),
                child: Center(child: poppins('Tidak tergabung kelompok.')),
              )
            : SingleChildScrollView(
                child: Column(
                  spacing: 16.sp,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 8.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 12.sp,
                      children: [
                        _RoundIconButton(
                          Icon(Icons.api_rounded, color: AppColor.bg.primary),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.bg.primary,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          padding: EdgeInsets.all(12.sp),
                          child: Row(
                            spacing: 12.sp,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 40.sp,
                                height: 40.sp,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Center(
                                  child: poppins(
                                    controller.group!.number.toString(),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ),
                              poppins(
                                'Kelompok ${controller.group!.number.toString()}',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                              SizedBox(width: 4.sp),
                            ],
                          ),
                        ),
                        _RoundIconButton(
                          Icon(Icons.api_rounded, color: AppColor.bg.primary),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.sp, 6.sp, 16.sp, 0),
                      child: Row(
                        spacing: 12.sp,
                        children: [
                          Expanded(
                            child: _InfoCard(
                              title: 'Kas Tanggung Renteng',
                              amount:
                                  controller.group!.sharedLiabilityFundAmount,
                            ),
                          ),
                          Expanded(
                            child: _InfoCard(
                              title: 'Kas Kelompok',
                              amount: controller.group!.groupFundAmount,
                            ),
                          ),
                          Expanded(
                            child: _InfoCard(
                              title: 'Dana Sosial',
                              amount: controller.group!.socialFundAmount,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.sp),
                      width: getScreenWidth(context, scale: 0.88),
                      child: poppins(
                        controller.group!.description ?? '',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          poppins(
                            'Anggota',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          AppFilledButton(
                            height: 32.sp,
                            label: 'Cek Rapor',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            borderRadiusSize: 6.sp,
                            onTap: () {
                              Get.toNamed(
                                Routes.REPORT_LIST,
                                arguments: ArgsWrapper(data: controller.group),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp),
                      child: AppTextFormField(
                        controller: controller.searchCtrl,
                        hintText: 'Cari',
                        prefixIcon: SvgPicture.asset(
                          AppAsset.svgs.searchGray,
                          height: 16.sp,
                        ),
                      ),
                    ),
                    controller.groupMembers.isEmpty
                        ? SizedBox(
                            height: getScreenHeight(context, scale: 0.28),
                            child: Center(child: poppins('Tidak ada data')),
                          )
                        : _GroupedMemberListView(
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

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton(this.icon);

  // final SvgPicture? icon;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.bg.lightPrimary,
        border: Border.all(color: AppColor.bg.primary, width: 2.sp),
        borderRadius: BorderRadius.circular(999),
      ),
      height: 40.sp,
      width: 40.sp,
      child: Center(child: icon),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.title, required this.amount});

  final String title;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114.sp,
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: AppColor.bg.transparentPrimary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(6.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.sp),
              color: AppColor.bg.primary,
            ),
            child: SvgPicture.asset(AppAsset.svgs.moneyWhite),
          ),
          poppins(title, fontSize: 10.sp),
          poppins(
            amount.toIdr(),
            fontWeight: FontWeight.bold,
            color: AppColor.bg.primary,
            fontSize: 14.sp,
          ),
        ],
      ),
    );
  }
}

class _GroupedMemberListView extends StatelessWidget {
  final Map<String, List<UserModel>> groupedMembers;

  const _GroupedMemberListView({required this.groupedMembers});

  @override
  Widget build(BuildContext context) {
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
