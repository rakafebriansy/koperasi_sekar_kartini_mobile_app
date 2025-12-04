import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/file/file_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/abstract.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_bottom_sheet.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_outlined_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';

class AppStandardUploadImageField extends StatefulWidget implements IPickImage {
  const AppStandardUploadImageField({
    super.key,
    required this.onPick,
    this.textButton,
  });

  final Future<void> Function(File?) onPick;
  final String? textButton;

  @override
  State<AppStandardUploadImageField> createState() =>
      _AppStandardUploadImageFieldState();
}

class _AppStandardUploadImageFieldState
    extends State<AppStandardUploadImageField> {
  File? value;
  double? size;
  String? name;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      value = File(pickedFile.path);
      name = pickedFile.name;
      size = await value!.sizeInMB;
      widget.onPick(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        border: Border.all(width: 1.sp, color: AppColor.bg.gray),
        borderRadius: BorderRadius.circular(16.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 12.sp,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 3.sp, color: AppColor.bg.gray),
                  borderRadius: BorderRadius.circular(16.sp),
                ),
                height: 80.sp,
                width: 80.sp,
                child: Center(
                  child: value != null
                      ? Image.file(value!)
                      : SvgPicture.asset(AppAsset.svgs.imageIcon),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120.sp,
                    child: poppins(
                      name ?? 'Unggah file',
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  size != null
                      ? poppins('${size!.toStringAsFixed(2)} MB')
                      : poppins(
                          'Maks. ukuran 2MB',
                          fontStyle: FontStyle.italic,
                        ),
                ],
              ),
            ],
          ),
          AppOutlinedButton(
            height: 30.sp,
            label: widget.textButton ?? 'Pilih',
            onTap: _chooseImageSource,
            fontSize: 12.sp,
          ),
        ],
      ),
    );
  }

  void _chooseImageSource() {
    Get.bottomSheet(
      AppBottomSheet(
        spacing: 8.sp,
        padding: EdgeInsets.all(14.sp),
        children: [
          Material(
            child: InkWell(
              onTap: () async {
                _pickImage(ImageSource.camera);
                Get.back();
              },
              child: Padding(
                padding: EdgeInsets.all(8.sp),

                child: Row(
                  spacing: 8.sp,
                  children: [
                    Icon(Icons.camera_alt_rounded, color: AppColor.bg.primary),
                    poppins('Kamera'),
                  ],
                ),
              ),
            ),
          ),
          Divider(height: 0.5.sp, color: AppColor.border.lightGray),
          Material(
            child: InkWell(
              onTap: () async {
                _pickImage(ImageSource.gallery);
                Get.back();
              },
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: Row(
                  spacing: 8.sp,
                  children: [
                    Icon(Icons.photo, color: AppColor.bg.primary),
                    poppins('Galeri'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
