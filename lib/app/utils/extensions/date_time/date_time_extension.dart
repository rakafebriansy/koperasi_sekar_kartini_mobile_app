import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toDotSeparatedHour() {
    final formatter = DateFormat('HH.mm', 'id_ID');
    return formatter.format(this);
  }

  String toSlashSeparatedDate() {
    final formatter = DateFormat('dd/mm/yyyy', 'id_ID');
    return formatter.format(this);
  }

  String toIdDate() {
    final formatter = DateFormat('d MMMM y', 'id_ID');
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
