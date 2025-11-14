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