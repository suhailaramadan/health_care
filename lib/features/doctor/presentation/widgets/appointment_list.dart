import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:graduation_project/features/user/booking/domain/entities/appointment_entity.dart';

class AppointmentList extends StatefulWidget {
  final List<AppointmentEntity> appointments; // قائمة المواعيد
  final Function(String?, String?) onSelectionChanged; // وظيفة التحديد
  const AppointmentList({
    super.key,
    required this.appointments,
    required this.onSelectionChanged,
  });

  @override
  _AppointmentListState createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  String? selectedDay;
  List<String> availableSlots = [];
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    DateTime todayDate = DateTime(today.year, today.month, today.day);
    DateTime tomorrowDate = todayDate.add(Duration(days: 1));
    List<AppointmentEntity> filterwdAppointments =
        widget.appointments.where((appointment) {
      DateTime appointmentDate = DateTime.parse(appointment.date ?? '');
      DateTime appDate = DateTime(
          appointmentDate.year, appointmentDate.month, appointmentDate.day);
      if (appDate == todayDate || appDate == tomorrowDate) {
        return false;
      }
      return true;
    }).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.appointments.isNotEmpty)
          const Padding(
            padding: EdgeInsets.only(right: 5),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                "اليوم",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: filterwdAppointments.map((e) {
              bool isAvailable = e.availableSlots.isNotEmpty;
              bool isSelected = selectedDay == e.date;

              DateTime appointment = DateTime.parse(e.date);
              DateTime appdate = DateTime(
                  appointment.year, appointment.month, appointment.day);
              String formattedDate;
              if (appdate == todayDate) {
                formattedDate = "اليوم";
              } else {
                formattedDate = formatArabicDate(e.date, day: e.day);
              }

              return InkWell(
                onTap: isAvailable
                    ? () {
                        if (selectedDay == e.date) return;
                        setState(() {
                          selectedDay = e.date;
                          availableSlots = List.from(e.availableSlots);
                          selectedTime = null; // إعادة تعيين الوقت المحدد
                        });
                        widget.onSelectionChanged(selectedDay, null);
                      }
                    : null,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    color: isAvailable
                        ? (isSelected ? Colors.blue : Colors.blue[100])
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isAvailable
                          ? (isSelected ? Colors.white : Colors.black)
                          : Colors.grey,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),

        const SizedBox(height: 20),
        if (selectedDay != null && availableSlots.isNotEmpty)
          const Padding(
            padding: EdgeInsets.only(right: 5),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                "الوقت",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        const SizedBox(height: 10),
        if (selectedDay != null && availableSlots.isNotEmpty)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: availableSlots.map((time) {
                bool isSelected = selectedTime == time;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTime = time;
                    });
                    widget.onSelectionChanged(selectedDay, selectedTime);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.blue[100],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue),
                    ),
                    child: Text(
                      formatTime(time),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

        // إذا لم توجد أوقات متاحة لهذا اليوم
        if (selectedDay != null && availableSlots.isEmpty)
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "لا يوجد مواعيد متاحة لهذا اليوم",
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ),
      ],
    );
  }

  String formatArabicDate(String date, {String? day}) {
    try {
      DateTime parsedDate = DateTime.tryParse(date) ?? DateTime(0);
      String dayNumber = DateFormat('d', 'ar').format(parsedDate);
      String monthName = DateFormat('MMMM', 'ar').format(parsedDate);
      return "$day $dayNumber $monthName";
    } catch (e) {
      print('Error formatting date: $e');
      return date;
    }
  }

  String formatTime(String time) {
    return time;
  }
}
