import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/builders/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/list/list_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_text_form_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_home_wrapper.dart';

import '../controllers/employee_main_tabs_employee_controller.dart';

class EmployeeMainTabsEmployeeView
    extends GetView<EmployeeMainTabsEmployeeController> {
  const EmployeeMainTabsEmployeeView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppHomeWrapper(
      withPadding: false,
      ableToBack: false,
      child: SingleChildScrollView(
        child: Column(
          spacing: 16.sp,
          children: [
            SizedBox(height: 8.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Row(
                spacing: 8.sp,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: AppTextFormField(
                      controller: controller.searchCtrl,
                      hintText: 'Cari',
                      prefixIcon: SvgPicture.asset(
                        AppAsset.svgs.searchGray,
                        height: 16.sp,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: buildInkWellButtonStyle(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.sp,
                        vertical: 16.sp,
                      ),
                      foregroundColor: AppColor.instance.primary,
                      backgroundColor: AppColor.instance.lightPrimary,
                      overlayColor: AppColor.instance.transparentPrimary
                          .withOpacity(0.2),
                      borderRadiusCircularSize: 12.sp,
                    ),
                    onPressed: () {},
                    child: poppins('Tambah', color: AppColor.instance.primary),
                  ),
                ],
              ),
            ),
            _GroupedEmployeeListView(
              groupedEmployee: DummyHelper.dummyUsers.groupedByFirstLetter,
            ),
          ],
        ),
      ),
    );
  }
}

class _GroupedEmployeeListView extends StatelessWidget {
  final Map<String, List<UserModel>> groupedEmployee;

  const _GroupedEmployeeListView({super.key, required this.groupedEmployee});

  @override
  Widget build(BuildContext context) {
    final letters = groupedEmployee.keys.toList()..sort();

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(letters.length, (index) {
          final letter = letters[index];
          final users = groupedEmployee[letter]!;

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
                  children: List.generate(users.length, (idx) {
                    final u = users[idx];
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
                        leading: CircleAvatar(child: Text(u.name[0])),
                        title: Text(u.name),
                        subtitle: Text(u.nomorAnggota),
                        trailing: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.sp),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 8.sp,
                            children: [
                              Material(
                                borderRadius: BorderRadius.circular(8.sp),
                                child: InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(8.sp),
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
                                borderRadius: BorderRadius.circular(8.sp),
                                child: InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(8.sp),
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
