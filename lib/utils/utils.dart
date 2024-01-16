import 'package:intl/intl.dart';

class Utils {
  bool isIso8601(String date) {
    RegExp iso8601RegExp =
        RegExp(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}.\d{3}Z$');
    return iso8601RegExp.hasMatch(date);
  }

  String formatDate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    String daySuffix = _getDaySuffix(parsedDate.day);
    String formattedDate =
        DateFormat('d\'$daySuffix\' MMM. yyyy').format(parsedDate);
    return formattedDate;
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }

    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
