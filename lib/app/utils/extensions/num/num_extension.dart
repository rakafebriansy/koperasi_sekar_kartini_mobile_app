import 'package:intl/intl.dart';

extension CurrencyIDRExtension on num {
  String toIdAbbreviation({int decimal = 1, bool withSpace = true}) {
    final space = withSpace ? ' ' : '';

    if (this >= 1_000_000_000_000) {
      return '${_format(this / 1_000_000_000_000, decimal)}${space}T';
    }
    if (this >= 1_000_000_000) {
      return '${_format(this / 1_000_000_000, decimal)}${space}M';
    }
    if (this >= 1_000_000) {
      return '${_format(this / 1_000_000, decimal)}${space}jt';
    }
    if (this >= 1_000) {
      return '${_format(this / 1_000, decimal)}${space}rb';
    }

    return toString();
  }

  String _format(num value, int decimal) {
    if (value % 1 == 0) {
      return value.toInt().toString();
    }
    return value.toStringAsFixed(decimal);
  }

  String toIdr({bool withSymbol = true, int decimalDigits = 0}) {
    final formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: withSymbol ? 'Rp' : '',
      decimalDigits: decimalDigits,
    );

    return formatCurrency.format(this).trim();
  }
}

extension IntMonthConverter on int {
  String get toMonthName {
    const months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];

    if (this < 1 || this > 12) {
      throw RangeError('Month must be between 1 and 12, but got $this');
    }

    return months[this - 1];
  }
}
