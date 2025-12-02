import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/register/widgets/UploadImageField.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';

class UploadImageFormField extends FormField<File?> {
  UploadImageFormField({
    Key? key,
    required Future<void> Function(File?) onPick,
    FormFieldSetter<File?>? onSaved,
    FormFieldValidator<File?>? validator,
  }) : super(
         key: key,
         validator: validator,
         onSaved: onSaved,
         builder: (field) {
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               UploadImageField(
                 onPick: (file) async {
                   await onPick(file);
                   field.didChange(file);
                 },
               ),
               if (field.hasError)
                 Padding(
                   padding: EdgeInsets.only(top: 14.sp),
                   child: poppins(
                     field.errorText ?? '',
                     color: Colors.red,
                     fontSize: 10.sp,
                   ),
                 ),
             ],
           );
         },
       );
}
