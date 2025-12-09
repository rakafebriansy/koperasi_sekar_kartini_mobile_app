import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_environment.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_bottom_sheet.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_outlined_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_text_form_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/date_time/date_time_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_default_wrapper.dart';

import '../controllers/event_detail_controller.dart';

class EventDetailView extends GetView<EventDetailController> {
  const EventDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppDefaultWrapper(
      actions: [
        if (AuthController.find.currentUser?.role == 'admin' ||
            AuthController.find.currentUser?.id == controller.event!.id)
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Get.bottomSheet(
                  AppBottomSheet(
                    titleText: poppins(
                      'Hapus Kegiatan',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          spacing: 18.sp,
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColor.bg.danger,
                              radius: 44.sp,
                              child: SvgPicture.asset(
                                AppAsset.svgs.cautionWhite,
                                width: 32.sp,
                                height: 32.sp,
                              ),
                            ),
                            poppins(
                              'Yakin menghapus kegiatan?',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 12.sp,
                        children: [
                          Expanded(
                            child: AppOutlinedButton(
                              label: 'Batal',
                              onTap: () => Get.back(),
                            ),
                          ),
                          Expanded(
                            child: AppFilledButton(
                              label: 'Hapus',
                              onTap: () {
                                controller.deleteMeeting();
                                Get.back();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              child: Icon(Icons.delete, color: AppColor.bg.danger),
            ),
          ),
      ],
      title: poppins('Detail Pertemuan', fontWeight: FontWeight.w600),
      child: Obx(
        () => controller.event != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200.sp,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                        image: controller.event!.photo != null
                            ? CachedNetworkImageProvider(
                                '${Environments.apiUrl}/file/${controller.event!.photo}',
                              )
                            : AssetImage(AppAsset.images.brokenImageIcon),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                  ),
                  SizedBox(height: 8.sp),
                  poppins(
                    controller.event!.name,
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
                                    backgroundColor: AppColor.bg.lightPrimary,
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
                                      controller.event!.location,
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
                                    backgroundColor: AppColor.bg.lightPrimary,
                                    radius: 16.sp,
                                    child: SvgPicture.asset(
                                      AppAsset.svgs.calendarDarkGray,
                                      height: 14.sp,
                                      width: 14.sp,
                                    ),
                                  ),
                                  SizedBox(width: 8.sp),
                                  poppins(
                                    controller.event!.datetime.toIdDate(),
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
                                    backgroundColor: AppColor.bg.lightPrimary,
                                    radius: 16.sp,
                                    child: SvgPicture.asset(
                                      AppAsset.svgs.clockDarkGray,
                                      height: 16.sp,
                                      width: 16.sp,
                                    ),
                                  ),
                                  SizedBox(width: 8.sp),

                                  poppins(
                                    controller.event!.datetime
                                        .toDotSeparatedHour(),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // TableRow(
                      //   children: [
                      //     TableCell(
                      //       verticalAlignment:
                      //           TableCellVerticalAlignment.middle,
                      //       child: poppins(
                      //         'Status Kehadiran',
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //     TableCell(
                      //       verticalAlignment:
                      //           TableCellVerticalAlignment.middle,
                      //       child: Padding(
                      //         padding: EdgeInsets.symmetric(vertical: 3.sp),
                      //         child: Row(
                      //           children: [
                      //             Container(
                      //               padding: EdgeInsets.symmetric(
                      //                 horizontal: 8.sp,
                      //                 vertical: 3.sp,
                      //               ),
                      //               decoration: BoxDecoration(
                      //                 color: Color(0xFFDADADA),
                      //                 borderRadius: BorderRadius.circular(
                      //                   99.sp,
                      //                 ),
                      //               ),
                      //               child: poppins(
                      //                 controller
                      //                     .eventAttendanceModel!
                      //                     .attendance
                      //                     .displayName,
                      //                 fontWeight: FontWeight.w500,
                      //                 color: Color(0xFF008473),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                  SizedBox(height: 10.sp),
                  poppins('Deskripsi', fontWeight: FontWeight.bold),
                  SizedBox(height: 6.sp),
                  controller.event != null
                      ? AppTextFormField(
                          initialValue: controller.event!.description,
                        )
                      : SizedBox.shrink(),
                  // SizedBox(height: 16.sp),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Expanded(
                  //       child: AppOutlinedButton(
                  //         label: 'Tidak Hadir',
                  //         onTap: () {},
                  //         danger: true,
                  //       ),
                  //     ),
                  //     SizedBox(width: 12.sp),
                  //     Expanded(
                  //       child: AppFilledButton(label: 'Hadir', onTap: () {}),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 12.sp),
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
