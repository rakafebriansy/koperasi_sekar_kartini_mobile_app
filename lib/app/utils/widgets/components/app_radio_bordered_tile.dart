import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppRadioBorderedTile<T> extends StatelessWidget {
  const AppRadioBorderedTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.titleText,
    required this.onChanged,
    required this.selected,
  });

  final T value;
  final T groupValue;
  final String titleText;
  final ValueChanged<T> onChanged;
  final bool selected;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.sp)),
          border: Border.all(color: selected ? context.theme.colorScheme.primary : Colors.transparent),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(8.sp)),
          child: RadioListTile<T>(
            value: value,
            groupValue: groupValue,
            title: Text(titleText),
            onChanged: (value) => onChanged(value as T),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.sp))),
          ),
        ),
      );
}
