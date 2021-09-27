import 'package:intl/intl.dart';

extension StringExtensions on String? {
  bool isBlank() => this?.trim().isEmpty ?? true;

  String? convertDateToLocaleBr() {
    const dateFormatLocaleBr = 'dd/MM/yyyy';
    if (this == null) {
      return null;
    }
    final dateTime = DateTime.parse(this ?? '');
    return DateFormat(dateFormatLocaleBr).format(dateTime);
  }
}
