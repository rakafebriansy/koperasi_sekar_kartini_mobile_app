import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/list/list_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_datetime_input_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/wrapper/app_form_wrapper.dart';

import '../controllers/manage_event_controller.dart';

class ManageEventView extends GetView<ManageEventController> {
  const ManageEventView({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AppFormWrapper(
        ableToBack: true,
        title: 'Detail Kegiatan',
        child: SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                poppins(
                  'Jenis Kegiatan',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                DropdownSearch<String>(
                  enabled: controller.eventTypeData.isNotEmpty,
                  selectedItem: 'Pilih jenis kegiatan',
                  items: (filter, infiniteScrollProps) =>
                      controller.eventTypeData.names,
                  decoratorProps: DropDownDecoratorProps(
                    baseStyle: GoogleFonts.poppins(fontSize: 14.sp),
                    decoration: buildAppTextInputDecoration(hintText: ''),
                  ),
                  popupProps: PopupProps.menu(
                    fit: FlexFit.loose,
                    constraints: BoxConstraints(maxHeight: 200.sp),
                    itemBuilder: (context, item, isSelected, onTap) => InkWell(
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.sp,
                          vertical: 12.sp,
                        ),
                        child: poppins(item, fontSize: 14.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.sp),
                AppTextFormGroup(
                  controller: controller.nameCtrl,
                  label: 'Nama Kegiatan',
                  maxLines: 1,
                ),
                SizedBox(height: 8.sp),

                poppins(
                  'Tanggal dan Waktu',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                AppDatetimeInputField(
                  controller: controller.dateTimeCtrl,
                  hintText: 'Tanggal dan waktu',
                ),
                SizedBox(height: 8.sp),
                AppTextFormGroup(
                  controller: controller.locationCtrl,
                  label: 'Lokasi',
                  maxLines: 1,
                ),
                SizedBox(height: 8.sp),
                AppTextFormGroup(
                  controller: controller.descCtrl,
                  label: 'Deskripsi',
                  maxLines: 2,
                ),
                SizedBox(height: 18.sp),
                Row(
                  spacing: 12.sp,
                  children: [
                    Expanded(
                      child: AppFilledButton(
                        label: 'Simpan',
                        onTap: () {
                        },
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.sp),
              ],
            ),
          ),
      ),
    );
  }
}
