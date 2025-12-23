import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/date_time/date_time_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_home_wrapper.dart';

import '../controllers/group_member_main_tabs_profile_controller.dart';

class GroupMemberMainTabsProfileView
    extends GetView<GroupMemberMainTabsProfileController> {
  const GroupMemberMainTabsProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppHomeWrapper(
      child: SingleChildScrollView(
        child: Column(
          spacing: 14.sp,
          children: [
            Obx(() {
              var user = controller.authController.currentUser;
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
                          iconPath: AppAsset.svgs.bellLightGray,
                        ),
                        Divider(
                          height: 1.sp,
                          thickness: 1.sp,
                          color: AppColor.bg.gray,
                        ),
                        _AppSettingMenuItem(
                          label: 'Ubah Kata Sandi',
                          iconPath: AppAsset.svgs.lockLightGray,
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
                    controller.authController.logout();
                  },
                  label: 'Keluar',
                  textColor: Colors.white,
                  iconPath: AppAsset.svgs.logoutWhite,
                ),
              ),
            ),
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
    required this.iconPath,
    this.onTap,
    this.textColor,
  });

  final String label;
  final String iconPath;
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
                child: Center(child: SvgPicture.asset(iconPath)),
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
