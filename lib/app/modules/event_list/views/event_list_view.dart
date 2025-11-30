import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_event_card.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_text_form_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_default_wrapper.dart';

import '../controllers/event_list_controller.dart';

class EventListView extends GetView<EventListController> {
  const EventListView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppDefaultWrapper(
      withPadding: false,
      ableToBack: true,
      title: poppins('Daftar Kegiatan', fontWeight: FontWeight.w600),
      child: Container(
        padding: EdgeInsets.all(16.sp),
        height: MediaQuery.of(context).size.height,
        child: Column(
          spacing: 12.sp,
          children: [
            Row(
              spacing: 10.sp,
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
                Material(
                  borderRadius: BorderRadius.circular(12.sp),
                  color: Colors.white,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.sp),
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.sp,
                          color: AppColor.border.lightGray,
                        ),
                        borderRadius: BorderRadius.circular(12.sp),
                      ),
                      padding: EdgeInsets.all(16.sp),
                      child: Center(
                        child: SvgPicture.asset(
                          AppAsset.svgs.calendarPrimary,
                          height: 16.sp,
                          width: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(height: 1, color: AppColor.border.lightGray),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 16.sp,
                  children: [
                    ...DummyHelper.events
                        .map(
                          (event) => AppEventCard(
                            model: event,
                            onTap: () {
                              Get.toNamed(
                                Routes.EVENT_DETAIL,
                                arguments: ArgsWrapper(
                                  action: ActionType.create,
                                  data: event,
                                ),
                              );
                            },
                          ),
                        )
                        .toList(),
                    SizedBox(height: 10.sp),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
