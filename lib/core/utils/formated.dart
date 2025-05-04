import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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

  static String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.Hms().format(dt);
  }

  static String formateTimeToArabic(TimeOfDay time) {
    int hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    int minute = time.minute;
    String period = time.period == DayPeriod.am ? 'ص' : 'م';

    String hourStr = convertToArabicNumber(hour, minDigits: 2);
    String minuteStr = convertToArabicNumber(minute, minDigits: 2);

    return '$hourStr:$minuteStr $period';
  }

  static String convertToArabicNumber(int number, {int minDigits = 1}) {
    const arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    final digits = number.toString().padLeft(minDigits, '0');
    return digits.split('').map((e) => arabicNumbers[int.parse(e)]).join();
  }

  static String formateTime(String time) {
    try {
      List<String> parts = time.split(':');
      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1]);
      String period = hour < 12 ? "ص" : "م";
      int formattedHour = hour % 12 == 0 ? 12 : hour % 12;
      return "${formattedHour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period";
    } catch (e) {
      return time;
    }
  }

  static FormData formData = FormData.fromMap({});
}
