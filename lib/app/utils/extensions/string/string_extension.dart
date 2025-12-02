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
