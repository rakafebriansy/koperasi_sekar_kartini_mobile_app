import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/text_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_text_form_field.dart';

class AppDateInputField extends StatefulWidget {
  @override
  AppDateInputField({required this.controller, required this.placeholder, this.label});
  final TextEditingController controller;
  final String placeholder;
  final String? label;

  _AppDateInputFieldState createState() => _AppDateInputFieldState();
}

class _AppDateInputFieldState extends State<AppDateInputField> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.controller.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: widget.controller,
      hintText: widget.placeholder,
      readOnly: true,
      onTap: () => _selectDate(context),
      suffixIcon: SvgPicture.asset(
        AppAsset.svgs.calendarSharpGray,
        height: 20.sp,
      ),
      validator: (value) => value.isRequired(widget.label ?? widget.placeholder),
    );
  }
}
