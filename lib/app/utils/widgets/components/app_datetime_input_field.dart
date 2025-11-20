import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_text_form_field.dart';

class AppDatetimeInputField extends StatefulWidget {
  AppDatetimeInputField({required this.controller, required this.hintText});

  final TextEditingController controller;
  final String hintText;

  @override
  _AppDatetimeInputFieldState createState() => _AppDatetimeInputFieldState();
}

class _AppDatetimeInputFieldState extends State<AppDatetimeInputField> {
  DateTime? selectedDateTime;

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateTime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate == null) return;
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedDateTime != null
          ? TimeOfDay(hour: selectedDateTime!.hour, minute: selectedDateTime!.minute)
          : const TimeOfDay(hour: 8, minute: 0),
    );

    if (pickedTime == null) return;

    final DateTime fullDateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    setState(() {
      selectedDateTime = fullDateTime;

      widget.controller.text = DateFormat('HH:mm dd/MM/yyyy').format(fullDateTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: widget.controller,
      hintText: widget.hintText,
      readOnly: true,
      onTap: () => _selectDateTime(context),
      suffixIcon: SvgPicture.asset(
        AppAsset.svgs.calendarSharpGray,
        height: 20.sp,
      ),
    );
  }
}
