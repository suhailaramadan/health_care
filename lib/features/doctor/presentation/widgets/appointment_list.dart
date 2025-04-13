import 'package:flutter/material.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/utils/formated_date_time.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/features/user/booking/domain/entities/appointment_entity.dart';
import 'package:intl/intl.dart';

class AppointmentList extends StatefulWidget {
  final List<AppointmentEntity> appointments;
  final Function(String?, String?) onSelectionChanged;
  const AppointmentList(
      {super.key,
      required this.appointments,
      required this.onSelectionChanged});

  @override
  _AppointmentListState createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  String? selectedDay;
  List<String> availableSlots = [];
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: ValueKey(selectedDay),
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              "اليوم",
              style: getMediumStyle(color: ColorManager.textColor),
            ),
          ),
        ),
        Wrap(
          spacing: 10,
          children: widget.appointments.map((appointment) {
            bool isAvailable = appointment.availableSlots.isNotEmpty;
            bool isSelected = selectedDay == appointment.date;
            String fullDate = (FormatedDate.formateArabicDate(appointment.date,
                day: appointment.day));
            return InkWell(
              // splashColor: ColorManager.blue,
              onTap: isAvailable
                  ? () {
                      if (selectedDay == appointment.day) return;
                      // WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        selectedDay = appointment.date;
                        availableSlots = List.from(appointment.availableSlots);
                        selectedTime = null;
                      });
                      widget.onSelectionChanged(selectedDay, null);
                    }
                  : null,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  color: isAvailable
                      ? (isSelected ? ColorManager.primary : Colors.blue[100])
                      : ColorManager.greyDark,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  // appointment.day,
                  fullDate,
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
        const SizedBox(height: 15),
        if (selectedDay != null && availableSlots.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                "الوقت",
                style: getMediumStyle(color: ColorManager.textColor),
              ),
            ),
          ),
        // if (selectedDay != null && availableSlots.isNotEmpty)
        Wrap(
          spacing: 10,
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
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: isSelected ? ColorManager.primary : Colors.blue[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  FormatedDate.formateTime(time),
                  style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black),
                ),
              ),
            );
          }).toList(),
        ),
        if (selectedDay != null && availableSlots.isEmpty)
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "لا يوجد مواعيد متاحة لهذا اليوم",
              style: getMediumStyle(color: ColorManager.red),
            ),
          )
      ],
    );
  }
}
