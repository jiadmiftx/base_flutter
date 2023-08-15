import 'package:intl/intl.dart';

class PriceUtils {
  static final formatter = NumberFormat.currency(decimalDigits: 0, locale: 'id', name: 'IDR ');
  static final formatterRp = NumberFormat.currency(decimalDigits: 0, locale: 'id', name: 'Rp ');
}
