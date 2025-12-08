import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_environment.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';

class AppBigEditImageField extends StatefulWidget {
  const AppBigEditImageField({
    super.key,
    required this.onPick,
    this.readOnly = true,
    this.readOnlyValue,
  });

  final Future<void> Function(File?) onPick;
  final bool readOnly;
  final String? readOnlyValue;

  @override
  State<AppBigEditImageField> createState() => _AppBigEditImageFieldState();
}

class _AppBigEditImageFieldState extends State<AppBigEditImageField> {
  File? value;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      value = File(pickedFile.path);
      widget.onPick(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: value != null || widget.readOnlyValue != null
          ? Material(
              borderRadius: BorderRadius.circular(16.sp),
              child: InkWell(
                onTap: widget.readOnly
                    ? null
                    : () => pickImage(ImageSource.gallery),
                borderRadius: BorderRadius.circular(16.sp),
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.readOnly
                        ? Colors.transparent
                        : Colors.black.withOpacity(0.2),
                    border: Border.all(width: 3.sp, color: AppColor.bg.gray),
                    borderRadius: BorderRadius.circular(16.sp),
                  ),
                  height: 220.sp,
                  width: getScreenWidth(context, scale: 0.9),
                  child: Center(
                    child: Stack(
                      children: [
                        widget.readOnly
                            ? CachedNetworkImage(
                                imageUrl:
                                    '${Environments.apiUrl}/file/${widget.readOnlyValue}',
                              )
                            : Image.file(value!),
                        if (!widget.readOnly)
                          Positioned(
                            top: 0,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              color: Colors.black.withOpacity(0.2),
                              child: Center(
                                child: Container(
                                  width: 36.sp,
                                  height: 36.sp,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(99),
                                    border: Border.all(
                                      width: 2.sp,
                                      color: AppColor.border.primary,
                                    ),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.edit,
                                      color: AppColor.bg.primary,
                                      size: 14.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Material(
              color: Colors.white,
              child: InkWell(
                borderRadius: BorderRadius.circular(16.sp),
                onTap: widget.readOnly
                    ? null
                    : () => pickImage(ImageSource.gallery),
                splashColor: AppColor.bg.primary.withValues(alpha: 0.1),
                highlightColor: AppColor.bg.primary.withValues(alpha: 0.1),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 3.sp, color: AppColor.bg.gray),
                    borderRadius: BorderRadius.circular(16.sp),
                  ),
                  width: getScreenWidth(context, scale: 0.9),
                  height: 220.sp,
                  child: Center(
                    child: widget.readOnly
                        ? Column(
                            spacing: 2.sp,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.broken_image_outlined,
                                color: AppColor.bg.primary,
                                size: 36.sp,
                              ),
                              poppins('Tidak ada gambar.'),
                            ],
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                AppAsset.svgs.imageIcon,
                                height: 54.sp,
                              ),
                              SizedBox(height: 14.sp),
                              poppins(
                                'Pilih file atau gambar',
                                fontSize: 14.sp,
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
    );
  }
}
