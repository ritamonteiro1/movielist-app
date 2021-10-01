import 'package:intl/intl.dart';

extension StringExtensions on String {
  bool isBlank() => trim().isEmpty;

  String convertDateToLocaleBr() {
    const dateFormatLocaleBr = 'dd/MM/yyyy';
    final dateTime = DateTime.parse(this);
    return DateFormat(dateFormatLocaleBr).format(dateTime);
  }
}
