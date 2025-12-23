import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/event/event_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/action_type/action_type_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/list/list_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/text_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_datetime_input_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_standard_upload_image_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_upload_image_form_field.dart';
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
        title: controller.action!.isCreateAction
            ? 'Tambah Kegiatan'
            : controller.action!.isUpdateAction
            ? 'Ubah Kegiatan'
            : 'Detail Kegiatan',
        child: Form(
          key: controller.formKey,
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
                SizedBox(height: 4.sp),
                Obx(
                  () => DropdownSearch<String>(
                    enabled: controller.action != null,
                    onChanged: (value) => controller.selectEventType(value),
                    selectedItem: controller.selectedEventType != null
                        ? controller.selectedEventType?.displayName
                        : 'Pilih Jenis Kegiatan',
                    items: (filter, infiniteScrollProps) =>
                        controller.authController.currentUser!.role != 'group_member'
                        ? controller.eventTypes.names
                        : [controller.eventTypes.names.first],
                    decoratorProps: DropDownDecoratorProps(
                      baseStyle: GoogleFonts.poppins(fontSize: 14.sp),
                      decoration: buildAppTextInputDecoration(hintText: ''),
                    ),
                    validator: (value) => value.isDropdownRequired(
                      'Jenis Kegiatan',
                      controller.selectedEventType?.displayName,
                    ),
                    popupProps: PopupProps.menu(
                      fit: FlexFit.loose,
                      constraints: BoxConstraints(maxHeight: 200.sp),
                      itemBuilder: (context, item, isSelected, onTap) =>
                          InkWell(
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
                ),
                SizedBox(height: 8.sp),
                if (controller.authController.currentUser!.role !=
                    'group_member') ...[
                  poppins(
                    'Kelompok',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 4.sp),
                  Obx(
                    () => DropdownSearch<String>(
                      enabled:
                          controller.action != null &&
                          !controller.isFetching &&
                          controller.selectedEventType == EventType.group,
                      onChanged: (value) => controller.selectGroup(value),
                      selectedItem: controller.selectedGroup != null
                          ? 'Kelompok ${controller.selectedGroup?.number}'
                          : 'Pilih Grup',
                      items: (filter, infiniteScrollProps) =>
                          controller.groups.names,
                      decoratorProps: DropDownDecoratorProps(
                        baseStyle: GoogleFonts.poppins(fontSize: 14.sp),
                        decoration: buildAppTextInputDecoration(hintText: ''),
                      ),
                      validator: (value) => value.isDropdownRequired(
                        'Kelompok',
                        controller.selectedGroup?.number.toString(),
                      ),
                      popupProps: PopupProps.menu(
                        fit: FlexFit.loose,
                        constraints: BoxConstraints(maxHeight: 200.sp),
                        itemBuilder: (context, item, isSelected, onTap) =>
                            InkWell(
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
                  ),
                ],
                SizedBox(height: 8.sp),
                AppTextFormGroup(
                  controller: controller.nameCtrl,
                  label: 'Nama Kegiatan',
                  maxLines: 1,
                  validator: (value) => value.isRequired('Nama Kegiatan'),
                ),
                SizedBox(height: 8.sp),
                poppins(
                  'Tanggal dan Waktu',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                AppDatetimeInputField(
                  controller: controller.dateTimeCtrl,
                  placeholder: 'Tanggal dan waktu',
                  label: 'Tanggal dan waktu',
                ),
                SizedBox(height: 8.sp),
                AppTextFormGroup(
                  controller: controller.locationCtrl,
                  label: 'Lokasi',
                  maxLines: 1,
                  validator: (value) => value.isRequired('Lokasi'),
                ),
                SizedBox(height: 8.sp),
                AppTextFormGroup(
                  controller: controller.descCtrl,
                  label: 'Deskripsi',
                  maxLines: 2,
                ),
                SizedBox(height: 8.sp),
                poppins(
                  'Foto Lokasi',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                AppUploadImageFormField(
                  builder: (onPick) {
                    return AppStandardUploadImageField(
                      onPick: onPick,
                      textButton: controller.action == ActionType.create
                          ? 'Pilih'
                          : 'Ubah',
                    );
                  },
                  onPick: (file) async {
                    controller.selectHintPhoto(file);
                  },
                ),
                SizedBox(height: 18.sp),
                Row(
                  spacing: 12.sp,
                  children: [
                    Expanded(
                      child: AppFilledButton(
                        label: 'Simpan',
                        onTap: controller.isSubmitted
                            ? null
                            : controller.submitButton,
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
      ),
    );
  }
}
