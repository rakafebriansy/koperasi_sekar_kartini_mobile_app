import 'package:intl/intl.dart';

extension CurrencyIDRExtension on num {
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
