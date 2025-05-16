import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/doctors_appointment_model.dart';
import 'package:intl/intl.dart';

class FormatedDate {
  static String formateArabicDate(String date, {String? day}) {
    try {
      DateTime parsedDate = DateTime.parse(date);
      // String formateDate = DateFormat("yyyy-MM-dd").format(parsedDate);
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
  static String formatArabicMonthYear(DateTime date) {
    final months = [
      'يناير',
      "فبراير",
      "مارس",
      "أبريل",
      "مايو",
      "يونيو",
      "يوليو",
      "أغسطس",
      "سبتمبر",
      "أكتوبر",
      "نوفمبر",
      "ديسمبر"
    ];
    return "${months[date.month - 1]} - ${date.year} ";
  }

  static String formatArabicDateTime(String dateString) {
    final date = DateTime.tryParse(dateString);
    if (date == null) return "تاريخ غير صالح";
    final months = [
      'يناير',
      "فبراير",
      "مارس",
      "أبريل",
      "مايو",
      "يونيو",
      "يوليو",
      "أغسطس",
      "سبتمبر",
      "أكتوبر",
      "نوفمبر",
      "ديسمبر"
    ];
    final day = date.day;
    final month = months[date.month - 1];
    final year = date.year;
    // final hour = date.hour > 12 ? date.hour - 12 : date.hour;
    // final minute = date.minute.toString().padLeft(2, '0');
    // final period = date.hour >= 12 ? 'م' : "ص";

    return "$day $month $year";
  }

  static void filterAppointments(List<DoctorsAppointmentModel> appointments) {
    final now = DateTime.now();

    appointments.removeWhere((appointment) {
      final today = DateTime(now.year, now.month, now.day);

      final appointmentDate =
          DateTime(now.year, now.month, appointment.day ?? 0);
      if (appointmentDate.isAfter(today)) return false;
      if (appointmentDate.isAtSameMomentAs(today)) {
        print("ميعاد انهاردة ${appointmentDate}");
        if (appointment.startTime != null &&
            appointment.startTime!.contains(":")) {
          final startTimeParts = appointment.startTime!.split(":");
          if (startTimeParts.length == 2) {
            final startTime = TimeOfDay(
              hour: int.parse(startTimeParts[0]),
              minute: int.parse(startTimeParts[1]),
            );
            final currentTime = TimeOfDay.now();
            print("current time: ${currentTime.hour} ${currentTime.minute}");
            print("apppointment time ${startTime.hour}  ${startTime.minute}");
            if (currentTime.hour < startTime.hour ||
                (currentTime.hour == startTime.hour &&
                    currentTime.minute < startTime.minute)) {
              print("الميعاد لسه مجاش ");
              return false;
            }
          }
        }
        print("الميعاد عدى وقتهو هيتشال");
        return true;
      }

      print("Filterwsssssssssssssssssssss");
      return appointmentDate.isBefore(today);
    });

    // بعد الفلترة، نعمل Sort حسب التاريخ
    appointments.sort((a, b) {
      final dateA = DateTime(now.year, now.month, a.day ?? 0);
      final dateB = DateTime(now.year, now.month, b.day ?? 0);
      return dateA.compareTo(dateB);
    });
  }
}
