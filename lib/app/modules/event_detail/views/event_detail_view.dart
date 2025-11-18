import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/date_time/date_time_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_outlined_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_default_wrapper.dart';

import '../controllers/event_detail_controller.dart';

class EventDetailView extends GetView<EventDetailController> {
  const EventDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppDefaultWrapper(
      title: poppins('Detail Pertemuan', fontWeight: FontWeight.w600),
      child: Obx(
        () => controller.eventAttendanceModel.value != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200.sp,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                        image: AssetImage(
                          AppAsset.images.growMoneyIllustration,
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                  ),
                  SizedBox(height: 8.sp),

                  poppins(
                    controller.eventAttendanceModel.value!.event.title,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                  SizedBox(height: 10.sp),
                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(0.8),
                      1: FlexColumnWidth(1.2),
                    },
                    children: [
                      TableRow(
                        decoration: const BoxDecoration(),
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: poppins(
                              'Tempat',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.sp),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        AppColor.instance.lightPrimary,
                                    radius: 16.sp,
                                    child: SvgPicture.asset(
                                      AppAsset.svgs.locationPinDarkGray,
                                      height: 16.sp,
                                      width: 16.sp,
                                    ),
                                  ),
                                  SizedBox(width: 8.sp),
                                  Expanded(
                                    child: poppins(
                                      controller
                                          .eventAttendanceModel
                                          .value!
                                          .event
                                          .location,
                                      fontWeight: FontWeight.w500,
                                      softWrap: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: poppins(
                              'Tanggal',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.sp),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        AppColor.instance.lightPrimary,
                                    radius: 16.sp,
                                    child: SvgPicture.asset(
                                      AppAsset.svgs.calendarDarkGray,
                                      height: 14.sp,
                                      width: 14.sp,
                                    ),
                                  ),
                                  SizedBox(width: 8.sp),
                                  poppins(
                                    controller
                                        .eventAttendanceModel
                                        .value!
                                        .event
                                        .dateTime
                                        .toIdDate(),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        decoration: BoxDecoration(),
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: poppins(
                              'Pukul',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.sp),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        AppColor.instance.lightPrimary,
                                    radius: 16.sp,
                                    child: SvgPicture.asset(
                                      AppAsset.svgs.clockDarkGray,
                                      height: 16.sp,
                                      width: 16.sp,
                                    ),
                                  ),
                                  SizedBox(width: 8.sp),

                                  poppins(
                                    controller
                                        .eventAttendanceModel
                                        .value!
                                        .event
                                        .dateTime
                                        .toDotSeparatedHour(),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: poppins(
                              'Status Kehadiran',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.sp),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.sp,
                                      vertical: 3.sp,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFDADADA),
                                      borderRadius: BorderRadius.circular(
                                        99.sp,
                                      ),
                                    ),
                                    child: poppins(
                                      controller
                                          .eventAttendanceModel
                                          .value!
                                          .attendance
                                          .displayName,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF008473),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.sp),
                  poppins('Deskripsi', fontWeight: FontWeight.bold),
                  SizedBox(height: 4.sp),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.sp, color: Color(0xFFDADADA)),
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                    height: 200.sp,
                    width: double.infinity,
                    padding: EdgeInsets.all(8.sp),
                    child: controller.descriptionController != null
                        ? QuillEditor.basic(
                            config: QuillEditorConfig(
                              scrollable: true,
                              padding: EdgeInsets.zero,
                              autoFocus: false,
                              expands: false,
                              placeholder: 'Tulis deskripsi di sini...',
                            ),
                            controller: controller.descriptionController!,
                            focusNode: controller.descriptionFocusNode,
                            scrollController:
                                controller.descriptionScrollController,
                          )
                        : SizedBox.shrink(),
                  ),
                  SizedBox(height: 16.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AppOutlinedButton(
                          label: 'Tidak Hadir',
                          onTap: () {},
                          danger: true,
                        ),
                      ),
                      SizedBox(width: 12.sp),
                      Expanded(
                        child: AppFilledButton(label: 'Hadir', onTap: () {}),
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Center(child: CircularProgressIndicator())],
              ),
      ),
    );
  }
}
