import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/group_member_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/builders/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/int/int_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/list/list_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_text_form_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_home_wrapper.dart';

import '../controllers/group_member_main_tabs_group_controller.dart';

class GroupMemberMainTabsGroupView extends GetView<GroupMemberMainTabsGroupController> {
  const GroupMemberMainTabsGroupView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppHomeWrapper(
      withPadding: false,
      child: SingleChildScrollView(
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
                  SvgPicture.asset(
                    AppAsset.svgs.exclamationMarkPrimary,
                    width: 20.sp,
                    height: 20.sp,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.instance.primary,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  padding: EdgeInsets.all(12.sp),
                  child: Row(
                    spacing: 12.sp,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //TODO: dynamic
                      Container(
                        width: 40.sp,
                        height: 40.sp,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Center(
                          child: poppins(
                            '1',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      poppins(
                        'Kelompok 1',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                      SizedBox(width: 4.sp),
                    ],
                  ),
                ),
                _RoundIconButton(
                  SvgPicture.asset(
                    AppAsset.svgs.editPrimary,
                    width: 16.sp,
                    height: 16.sp,
                  ),
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
                      amount: 72_000,
                    ),
                  ),
                  Expanded(
                    child: _InfoCard(title: 'Kas Kelompok', amount: 12_000),
                  ),
                  Expanded(
                    child: _InfoCard(title: 'Dana Sosial', amount: 42_000),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.88,
              child: poppins(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.',
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10.sp,
                children: [
                  Expanded(
                    child: AppFilledButton(
                      height: 28.sp,
                      label: 'Cek Rapor',
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      borderRadiusSize: 6.sp,
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: AppFilledButton(
                      height: 28.sp,
                      label: 'Pertemuan',
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      borderRadiusSize: 6.sp,
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: AppFilledButton(
                      height: 28.sp,
                      label: 'Struktur',
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      borderRadiusSize: 6.sp,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  poppins(
                    'Anggota',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  ElevatedButton(
                    style: buildInkWellButtonStyle(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.sp,
                        vertical: 8.sp,
                      ),
                      foregroundColor: AppColor.instance.primary,
                      backgroundColor: AppColor.instance.lightPrimary,
                      overlayColor: AppColor.instance.transparentPrimary
                          .withOpacity(0.2),
                      borderRadiusCircularSize: 12.sp,
                    ),
                    onPressed: () {},
                    child: poppins(
                      'Lihat Pembayaran',
                      color: AppColor.instance.primary,
                    ),
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
            _GroupedMemberListView(
              groupedMembers:
                  DummyHelper.dummyGroupMembers.groupedByFirstLetter,
            ),
          ],
        ),
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton(this.icon, {super.key});

  final SvgPicture icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.instance.lightPrimary,
        border: Border.all(color: AppColor.instance.primary, width: 2.sp),
        borderRadius: BorderRadius.circular(999),
      ),
      height: 40.sp,
      width: 40.sp,
      child: Center(child: icon),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({super.key, required this.title, required this.amount});

  final String title;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114.sp,
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: AppColor.instance.transparentPrimary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(6.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.sp),
              color: AppColor.instance.primary,
            ),
            child: SvgPicture.asset(AppAsset.svgs.moneyWhite),
          ),
          poppins(title, fontSize: 10.sp),
          poppins(
            amount.toIdr(),
            fontWeight: FontWeight.bold,
            color: AppColor.instance.primary,
            fontSize: 14.sp,
          ),
        ],
      ),
    );
  }
}

class _GroupedMemberListView extends StatelessWidget {
  final Map<String, List<GroupMemberModel>> groupedMembers;

  const _GroupedMemberListView({super.key, required this.groupedMembers});

  @override
  Widget build(BuildContext context) {
    final letters = groupedMembers.keys.toList()..sort();

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(letters.length, (index) {
          final letter = letters[index];
          final members = groupedMembers[letter]!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(color: AppColor.instance.lightGray),
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.sp,
                  vertical: 4.sp,
                ),
                child: poppins(
                  letter,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
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
                      padding: EdgeInsets.symmetric(vertical: 8.sp),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8.sp,
                          vertical: 1.sp,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.sp),
                          side: BorderSide(
                            width: 1.sp,
                            color: AppColor.instance.gray,
                          ),
                        ),
                        leading: CircleAvatar(child: Text(m.user.name[0])),
                        title: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 8.sp,
                          children: [
                            Text(m.user.name),
                            Icon(
                              Icons.circle,
                              color: m.statusAktif ? Colors.green : Colors.red,
                              size: 8.sp,
                            ),
                          ],
                        ),
                        subtitle: Text(m.nomorAnggota),
                        trailing: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.sp),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 8.sp,
                            children: [
                              Material(
                                child: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.sp),
                                      border: Border.all(
                                        width: 2.sp,
                                        color: AppColor.instance.info,
                                      ),
                                    ),
                                    padding: EdgeInsets.all(6.sp),
                                    child: SvgPicture.asset(
                                      AppAsset.svgs.editInfo,
                                      width: 18.sp,
                                      height: 18.sp,
                                    ),
                                  ),
                                ),
                              ),
                              Material(
                                child: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.sp),
                                      border: Border.all(
                                        width: 2.sp,
                                        color: AppColor.instance.danger,
                                      ),
                                    ),
                                    padding: EdgeInsets.all(6.sp),
                                    child: SvgPicture.asset(
                                      AppAsset.svgs.deleteDanger,
                                      width: 18.sp,
                                      height: 18.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
