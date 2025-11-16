import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/builders/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';

class UploadImageField extends StatelessWidget {
  UploadImageField({required this.imageFile, required this.func});

  final File? imageFile;
  final Future<void> Function(ImageSource) func;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageFile != null
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3.sp,
                      color: AppColor.instance.gray,
                    ),
                    borderRadius: BorderRadius.circular(16.sp),
                  ),
                  height: 220.sp,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Image.file(imageFile!),
                )
              : Material(
                  color: Colors.white,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16.sp),
                    onTap: () => func(ImageSource.gallery),
                    splashColor: AppColor.instance.primary.withOpacity(0.1),
                    highlightColor: AppColor.instance.primary.withOpacity(0.1),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 3.sp,
                          color: AppColor.instance.gray,
                        ),
                        borderRadius: BorderRadius.circular(16.sp),
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 220.sp,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              AppAsset.svgs.imageIcon,
                              height: 54.sp,
                            ),
                            SizedBox(height: 14.sp),
                            poppins('Pilih file atau gambar', fontSize: 14.sp),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
          SizedBox(height: 16.sp),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 14.sp),
                  child: Divider(height: 1.sp, color: Color(0xFF686868)),
                ),
              ),
              poppins('atau', fontSize: 14.sp, color: Color(0xFF686868)),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 14.sp),
                  child: Divider(height: 1.sp, color: Color(0xFF686868)),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.sp),
          AppFilledButton(
            label: 'Ambil Gambar Dari Kamera',
            svgPath: AppAsset.svgs.cameraIcon,
            textColor: AppColor.instance.primary,
            backgroundColor: AppColor.instance.lightPrimary,
            onTap: () => func(ImageSource.camera),
          ),
        ],
      ),
    );
  }
}
