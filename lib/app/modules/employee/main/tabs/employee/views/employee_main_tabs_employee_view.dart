import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
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
              child: AppTextFormField(
                controller: controller.searchCtrl,
                hintText: 'Cari',
                prefixIcon: SvgPicture.asset(
                  AppAsset.svgs.searchGray,
                  height: 16.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  poppins(
                    'Karyawan',
                    fontSize: 18.sp,
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
                    onPressed: () {
                      Get.toNamed(
                        Routes.EMPLOYEE_EMPLOYEE_DETAIL,
                        arguments: ArgsWrapper(
                          action: ActionType.create,
                          data: null,
                        ),
                      );
                    },
                    label: poppins('Tambah', color: AppColor.bg.primary),
                    icon: Icon(Icons.add, color: AppColor.bg.primary),
                  ),
                ],
              ),
            ),
            _GroupedEmployeeListView(
              groupedEmployee: DummyHelper.users.groupedByFirstLetter,
            ),
          ],
        ),
      ),
    );
  }
}

class _GroupedEmployeeListView extends StatelessWidget {
  final Map<String, List<UserModel>> groupedEmployee;

  const _GroupedEmployeeListView({required this.groupedEmployee});

  @override
  Widget build(BuildContext context) {
    final letters = groupedEmployee.keys.toList()..sort();

    var container = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(letters.length, (index) {
        final letter = letters[index];
        final users = groupedEmployee[letter]!;

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
                children: List.generate(users.length, (idx) {
                  final u = users[idx];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.sp),
                    child: Material(
                      borderRadius: BorderRadius.circular(14.sp),
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14.sp),
                        onTap: () {
                          Get.toNamed(
                            Routes.EMPLOYEE_EMPLOYEE_DETAIL,
                            arguments: ArgsWrapper(
                              action: ActionType.update,
                              data: u,
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
                          leading: CircleAvatar(child: Text(u.name[0])),
                          title: Text(u.name),
                          subtitle: Text('#${u.id}'),
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
    return container;
  }
}
