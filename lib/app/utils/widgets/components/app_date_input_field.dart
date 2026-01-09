import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/text_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_text_form_field.dart';

enum DateInputType { date, year, monthYear }

class AppDateInputField extends StatefulWidget {
  @override
  AppDateInputField({
    required this.controller,
    required this.placeholder,
    this.label,
    this.prefixIcon,
    this.enabled,
    this.onChanged,
    this.type = DateInputType.date,
  });
  final TextEditingController controller;
  final String placeholder;
  final String? label;
  final Widget? prefixIcon;
  final bool? enabled;
  final Function(String)? onChanged;
  final DateInputType type;

  _AppDateInputFieldState createState() => _AppDateInputFieldState();
}

class _AppDateInputFieldState extends State<AppDateInputField> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.controller.text = DateFormat('dd/MM/yyyy').format(picked);

        widget.onChanged?.call(widget.controller.text);
      });
    }
  }

  Future<void> _selectMonthYear(BuildContext context) async {
    int selectedYear = selectedDate?.year ?? DateTime.now().year;
    int selectedMonth = selectedDate?.month ?? DateTime.now().month;

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text("Pilih Bulan & Tahun"),
              content: SizedBox(
                height: 300,
                width: 300,
                child: Column(
                  children: [
                    Expanded(
                      child: YearPicker(
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        initialDate: DateTime(selectedYear),
                        selectedDate: DateTime(selectedYear),
                        onChanged: (date) {
                          setDialogState(() {
                            selectedYear = date.year;
                          });
                        },
                      ),
                    ),

                    SizedBox(height: 12),

                    SizedBox(
                      height: 120,
                      child: GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: 2.5,
                        children: List.generate(12, (index) {
                          final month = index + 1;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedMonth = month;
                                selectedDate = DateTime(selectedYear, month);
                                widget.controller.text =
                                    "${NumberFormat('00').format(month)}/$selectedYear";
                              });
                              widget.onChanged?.call(widget.controller.text);
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: EdgeInsets.all(4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: selectedMonth == month
                                    ? Colors.teal
                                    : Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                DateFormat('MMM').format(DateTime(0, month)),
                                style: TextStyle(
                                  color: selectedMonth == month
                                      ? Colors.white
                                      : Colors.black87,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _selectYear(BuildContext context) async {
    int selectedYear = selectedDate?.year ?? DateTime.now().year;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Pilih Tahun"),
          content: SizedBox(
            height: 300,
            width: 300,
            child: YearPicker(
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              initialDate: DateTime(selectedYear),
              selectedDate: DateTime(selectedYear),
              onChanged: (date) {
                setState(() {
                  selectedYear = date.year;
                  selectedDate = DateTime(selectedYear);
                  widget.controller.text = selectedYear.toString();
                });

                widget.onChanged?.call(widget.controller.text);
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      enabled: widget.enabled,
      controller: widget.controller,
      hintText: widget.placeholder,
      prefixIcon: widget.prefixIcon,
      readOnly: true,
      onTap: () {
        switch (widget.type) {
          case DateInputType.monthYear:
            _selectMonthYear(context);
          case DateInputType.year:
            _selectYear(context);
          case DateInputType.date:
            _selectDate(context);
        }
      },
      suffixIcon: SvgPicture.asset(
        AppAsset.svgs.calendarSharpGray,
        height: 20.sp,
      ),
      validator: widget.type == DateInputType.year
          ? (value) =>
                value.isRequired(widget.label ?? widget.placeholder) ??
                value.maxLength(4, widget.label ?? widget.placeholder)
          : (value) => value.isRequired(widget.label ?? widget.placeholder),
    );
  }
}
