import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toIdDate() {
    final formatter = DateFormat('d MMMM y', 'id_ID');
    return formatter.format(this);
  }

  String toDotSeparatedHour() {
    final formatter = DateFormat('HH.mm', 'id_ID');
    return formatter.format(this);
  }

  String toIdDay() {
    final formatter = DateFormat('EEEE', 'id_ID');
    return formatter.format(this);
  }

  String toIdFull() {
    return '${toIdDay()}, ${toIdDate()} • ${toDotSeparatedHour()}';
  }
}
