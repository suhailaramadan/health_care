import 'package:intl/intl.dart';

class FormatedDate {
  static String formateArabicDate(String date, {String? day}) {
    try {
      DateTime parsedDate = DateTime.parse(date);
      // String dayName = DateFormat('EEEE', 'ar').format(parsedDate);
      String dayNumber = DateFormat('d', 'ar').format(parsedDate);
      String monthName = DateFormat('MMMM', 'ar').format(parsedDate);
      return "$day $dayNumber $monthName";
    } catch (e) {
      return date;
    }
  }

  static String formateTime(String time) {
    try {
      List<String> parts = time.split(':');
      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1]);
      String period = hour < 12 ? "صباحاً" : "مساءً";
      int formattedHour = hour % 12 == 0 ? 12 : hour % 12;
      return "${formattedHour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period";
    } catch (e) {
      return time;
    }
  }
}
