import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_color.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';

class AppUploadImageFormField extends FormField<File?> {
  AppUploadImageFormField({
    super.key,
    required Future<void> Function(File?) onPick,
    FormFieldSetter<File?>? onSaved,
    FormFieldValidator<File?>? validator,
    required Widget Function(Future<void> Function(File?) onPick) builder,
    double? spacing,
    double? leftMessagePadding,
  }) : super(
         validator: validator,
         onSaved: onSaved,
         builder: (field) {
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               builder((file) async {
                 await onPick(file);
                 field.didChange(file);
               }),
               if (field.hasError)
                 Padding(
                   padding: EdgeInsets.fromLTRB(
                     leftMessagePadding ?? 10.sp,
                     spacing ?? 6.sp,
                     0,
                     0
                   ),
                   child: poppins(
                     field.errorText ?? '',
                     color: AppColor.bg.danger,
                     fontSize: 10.sp,
                   ),
                 ),
             ],
           );
         },
       );
}
