import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_constant.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_environment.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';

InputDecoration buildAppTextInputDecoration({
  String? counterText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  required String hintText,
}) {
  return InputDecoration(
    counterText: counterText,
    prefixIcon: prefixIcon != null
        ? Padding(
            padding: EdgeInsets.fromLTRB(14.sp, 14.sp, 6.sp, 14.sp),
            child: SizedBox(width: 20.sp, child: prefixIcon),
          )
        : null,
    suffixIcon: suffixIcon != null
        ? Padding(
            padding: EdgeInsets.fromLTRB(8.sp, 14.sp, 14.sp, 14.sp),
            child: SizedBox(width: 20.sp, child: suffixIcon),
          )
        : null,
    prefixIconConstraints: BoxConstraints(minWidth: 20.sp, minHeight: 20.sp),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.sp),
      borderSide: BorderSide(color: Colors.white, width: 1.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.sp),
      borderSide: BorderSide(color: AppColor.border.lightGray, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.sp),
      borderSide: BorderSide(color: AppColor.border.focus, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.sp),
      borderSide: BorderSide(color: AppColor.border.lightDanger, width: 2),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.sp),
      borderSide: BorderSide(color: AppColor.border.danger, width: 2),
    ),
    hint: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        poppins(
          hintText,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColor.border.gray,
        ),
      ],
    ),
  );
}

ButtonStyle buildInkWellButtonStyle({
  required Color foregroundColor,
  required Color overlayColor,
  required Color backgroundColor,
  double? borderRadiusCircularSize,
  EdgeInsets? padding,
  Color shadowColor = Colors.transparent,
  Color surfaceTintColor = Colors.transparent,
}) {
  return ButtonStyle(
    elevation: WidgetStateProperty.all(0),
    animationDuration: Duration.zero,
    backgroundColor: WidgetStateProperty.all(backgroundColor),
    overlayColor: WidgetStateProperty.all(overlayColor),
    foregroundColor: WidgetStateProperty.all(foregroundColor),
    shadowColor: WidgetStateProperty.all(shadowColor),
    surfaceTintColor: WidgetStateProperty.all(surfaceTintColor),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusCircularSize ?? 0),
      ),
    ),
    padding: WidgetStateProperty.all(padding),
  );
}

Text poppins(
  String text, {
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  bool? softWrap,
  TextAlign? textAlign,
  TextOverflow? overflow,
  TextStyle? textStyle,
}) {
  return Text(
    text,
    softWrap: softWrap,
    textAlign: textAlign,
    overflow: overflow,
    style: GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontStyle: fontStyle,
      textStyle: textStyle,
    ),
  );
}

Future<void> showMemberCard() async {
  String? filePath = AuthController.find.currentUser?.memberCardPhoto;
  Get.bottomSheet(
    Wrap(
      children: [
        Container(
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.circular(16.sp),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16.sp,
            children: [
              poppins(
                'Kartu Anggota Anda',
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.sp),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.sp),
                    border: filePath != null
                        ? Border.all(width: 1.sp, color: AppColor.bg.gray)
                        : null,
                  ),
                  child: filePath != null
                      ? CachedNetworkImage(
                          imageUrl: '${Environments.apiUrl}/file/$filePath',
                        )
                      : poppins('Tidak ada gambar.'),
                ),
              ),
              AppFilledButton(
                label: 'Unduh Kartu',
                width: double.infinity,
                height: 42.sp,
                onTap: filePath == null
                    ? null
                    : () async {
                        try {
                          Get.back();
                          await ApiHelper.downloadFileAndroid(filePath);
                          Get.snackbar(
                            'Unduh berhasil!',
                            'Unduhan disimpan di $LOCAL_DOWNLOAD_PATH.',
                          );
                        } catch (e) {
                          ErrorHelper.handleError(e);
                        }
                      },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

double getScreenHeight(BuildContext context, {double scale = 1}) {
  return MediaQuery.of(context).size.height * scale;
}
double getScreenWidth(BuildContext context,  {double scale = 1}) {
  return MediaQuery.of(context).size.height * scale;
}
