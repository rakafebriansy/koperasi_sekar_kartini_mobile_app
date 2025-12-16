import 'package:intl/intl.dart';

extension StringDateExtension on String {
  DateTime toDateDdMmYyyy() {
    try {
      return DateFormat('dd/MM/yyyy').parseStrict(this);
    } catch (_) {
      throw FormatException("Invalid date format, expected dd/MM/yyyy");
    }
  }

  String toIsoDateString() {
    try {
      final date = DateFormat('dd/MM/yyyy').parseStrict(this);
      return date.toIso8601String();
    } catch (_) {
      throw FormatException("Invalid date format (expected dd/MM/yyyy)");
    }
  }
}

extension NullableStringExtension on String? {
  String? get nullIfEmpty =>
      this != null && this!.trim().isNotEmpty ? this!.trim() : null;
}

extension MonthYearParsing on String {
  bool isValidMonthYear() {
    final regex = RegExp(r'^(0[1-9]|1[0-2])\/\d{4}$');
    return regex.hasMatch(this);
  }

  DateTime toMonthYearDate() {
    if (!isValidMonthYear()) {
      throw FormatException("Format harus MM/yyyy");
    }

    final parts = split('/');
    final month = int.parse(parts[0]);
    final year = int.parse(parts[1]);

    return DateTime(year, month, 1);
  }

  DateTime toMonthYearEndDate() {
    if (!isValidMonthYear()) {
      throw FormatException("Format harus MM/yyyy");
    }

    final parts = split('/');
    final month = int.parse(parts[0]);
    final year = int.parse(parts[1]);

    return DateTime(year, month + 1, 0);
  }
}

extension FloatToPercent on num {
  String toPercent({int decimal = 1}) {
    final formatted = toStringAsFixed(decimal);

    if (formatted.endsWith('.0')) {
      return '${formatted.replaceAll('.0', '').replaceAll('.', ',')}%';
    }

    return '${formatted.replaceAll('.', ',')}%';
  }
}
