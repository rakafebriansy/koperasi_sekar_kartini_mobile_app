import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_text_form_field.dart';

class AppDateInputField extends StatefulWidget {
  @override
  AppDateInputField({required this.controller});
  final TextEditingController controller;

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
      hintText: 'Tanggal Lahir',
      readOnly: true,
      onTap: () => _selectDate(context),
      iconPath: AppAsset.svgs.calendarSharpGray,
    );
  }
}
