import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/text_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_text_form_field.dart';

class AppDateInputField extends StatefulWidget {
  @override
  AppDateInputField({
    required this.controller,
    required this.placeholder,
    this.label,
    this.prefixIcon,
    this.enabled,
    this.type = 'date',
  });
  final TextEditingController controller;
  final String placeholder;
  final String? label;
  final Widget? prefixIcon;
  final bool? enabled;
  final String type;

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
          case 'month-year':
            _selectMonthYear(context);
          case 'date':
          default:
            _selectDate(context);
        }
      },
      suffixIcon: SvgPicture.asset(
        AppAsset.svgs.calendarSharpGray,
        height: 20.sp,
      ),
      validator: (value) =>
          value.isRequired(widget.label ?? widget.placeholder),
    );
  }
}
