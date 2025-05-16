// import 'package:flutter/material.dart';
// import 'package:graduation_project/core/di/service_locator.dart';
// import 'package:graduation_project/core/resources/color_manager.dart';
// import 'package:graduation_project/core/resources/styles_manager.dart';
// import 'package:graduation_project/core/utils/formated.dart';
// import 'package:graduation_project/core/widgets/custom_botton.dart';
// import 'package:graduation_project/features/user/booking/domain/entities/appointment_entity.dart';
// import 'package:intl/intl.dart';

// class AppointmentList extends StatefulWidget {
//   final List<AppointmentEntity> appointments;
//   final Function(String?, String?) onSelectionChanged;
//   const AppointmentList(
//       {super.key,
//       required this.appointments,
//       required this.onSelectionChanged});

//   @override
//   _AppointmentListState createState() => _AppointmentListState();
// }

// class _AppointmentListState extends State<AppointmentList> {
//   String? selectedDay;
//   List<String> availableSlots = [];
//   String? selectedTime;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       key: ValueKey(selectedDay),
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (widget.appointments.isNotEmpty)
//           Padding(
//             padding: const EdgeInsets.only(right: 5),
//             child: Align(
//               alignment: Alignment.topRight,
//               child: Text(
//                 "اليوم",
//                 style: getMediumStyle(color: ColorManager.textColor),
//               ),
//             ),
//           ),
//         const SizedBox(height: 10),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: widget.appointments.map((appointment) {
//               bool isAvailable = appointment.availableSlots.isNotEmpty;
//               bool isSelected = selectedDay == appointment.date;
//               // String fullDate =
//               //   // FormatedDate.formateArabicDate(
//               //   appointment.date,
//               //   day: appointment.day
//               //   // )
//               // // );
//               print("Appointment    Date ${appointment.date}");
//               print(" Apoint m ${appointment.availableSlots}");
//               return InkWell(
//                 onTap: isAvailable
//                     ? () {
//                         if (selectedDay == appointment.day) return;
//                         setState(() {
//                           selectedDay = appointment.date;
//                           availableSlots =
//                               List.from(appointment.availableSlots);
//                           selectedTime = null;
//                         });
//                         widget.onSelectionChanged(selectedDay, null);
//                       }
//                     : null,
//                 child: Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 5),
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                   decoration: BoxDecoration(
//                       color: isAvailable
//                           ? (isSelected
//                               ? ColorManager.primary
//                               : Colors.blue[100])
//                           : ColorManager.transparent,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: ColorManager.primary)),
//                   child: Text(
//                     "${appointment.date}-${appointment.day}",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: isAvailable
//                           ? (isSelected ? Colors.white : Colors.black)
//                           : Colors.grey,
//                     ),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//         const SizedBox(height: 20),
//         if (selectedDay != null && availableSlots.isNotEmpty)
//           Padding(
//             padding: const EdgeInsets.only(right: 5),
//             child: Align(
//               alignment: Alignment.topRight,
//               child: Text(
//                 "الوقت",
//                 style: getMediumStyle(color: ColorManager.textColor),
//               ),
//             ),
//           ),
//         const SizedBox(height: 10),
//         if (selectedDay != null && availableSlots.isNotEmpty)
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: availableSlots.map((time) {
//                 bool isSelected = selectedTime == time;
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedTime = time;
//                     });
//                     widget.onSelectionChanged(selectedDay, selectedTime);
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 5),
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//                     decoration: BoxDecoration(
//                         color: isSelected
//                             ? ColorManager.primary
//                             : Colors.blue[100],
//                         borderRadius: BorderRadius.circular(8),
//                         border: Border.all(color: ColorManager.primary)),
//                     child: Text(
//                       // FormatedDate.formateTime(time)
//                       time,
//                       style: TextStyle(
//                         color: isSelected ? Colors.white : Colors.black,
//                       ),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//         if (selectedDay != null && availableSlots.isEmpty)
//           Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: Text(
//               "لا يوجد مواعيد متاحة لهذا اليوم",
//               style: getMediumStyle(color: ColorManager.red),
//             ),
//           ),
//       ],
//     );
//   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       key: ValueKey(selectedDay),
// //       children: [
// //         Padding(
// //           padding: const EdgeInsets.only(right: 5),
// //           child: Align(
// //             alignment: Alignment.topRight,
// //             child: Text(
// //               "",
// //               style: getMediumStyle(color: ColorManager.textColor),
// //             ),
// //           ),
// //         ),
// //         Wrap(
// //           spacing: 10,
// //           children: widget.appointments.map((appointment) {
// //             bool isAvailable = appointment.availableSlots.isNotEmpty;
// //             bool isSelected = selectedDay == appointment.date;
// //             String fullDate = (FormatedDate.formateArabicDate(appointment.date,
// //                 day: appointment.day));
// //             return InkWell(
// //                 // splashColor: ColorManager.blue,
// //                 onTap: isAvailable
// //                     ? () {
// //                         if (selectedDay == appointment.day) return;
// //                         // WidgetsBinding.instance.addPostFrameCallback((_) {
// //                         setState(() {
// //                           selectedDay = appointment.date;
// //                           availableSlots =
// //                               List.from(appointment.availableSlots);
// //                           selectedTime = null;
// //                         });
// //                         widget.onSelectionChanged(selectedDay, null);
// //                       }
// //                     : null,
// //                 child: Container(
// //                   margin: const EdgeInsets.symmetric(vertical: 8),
// //                   padding:
// //                       const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
// //                   decoration: BoxDecoration(
// //                     color: isAvailable
// //                         ? (isSelected ? ColorManager.primary : Colors.blue[100])
// //                         : ColorManager.greyDark,
// //                     borderRadius: BorderRadius.circular(10),
// //                   ),
// //                   child: Text(
// //                     // appointment.day,
// //                     fullDate,
// //                     style: TextStyle(
// //                       fontSize: 16,
// //                       fontWeight: FontWeight.bold,
// //                       color: isAvailable
// //                           ? (isSelected ? Colors.white : Colors.black)
// //                           : Colors.grey,
// //                     ),
// //                   ),
// //                 ));
// //           }).toList(),
// //         ),
// //         const SizedBox(height: 15),
// //         if (selectedDay != null && availableSlots.isNotEmpty)
// //           Padding(
// //             padding: const EdgeInsets.only(right: 5),
// //             child: Align(
// //               alignment: Alignment.topRight,
// //               child: Text(
// //                 "الوقت",
// //                 style: getMediumStyle(color: ColorManager.textColor),
// //               ),
// //             ),
// //           ),
// //         // if (selectedDay != null && availableSlots.isNotEmpty)
// //         Wrap(
// //           spacing: 10,
// //           children: availableSlots.map((time) {
// //             bool isSelected = selectedTime == time;

// //             return GestureDetector(
// //               onTap: () {
// //                 setState(() {
// //                   selectedTime = time;
// //                 });
// //                 widget.onSelectionChanged(selectedDay, selectedTime);
// //               },
// //               child: Container(
// //                 margin: const EdgeInsets.symmetric(vertical: 5),
// //                 padding:
// //                     const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
// //                 decoration: BoxDecoration(
// //                   color: isSelected ? ColorManager.primary : Colors.blue[100],
// //                   borderRadius: BorderRadius.circular(8),
// //                 ),
// //                 child: Text(
// //                   FormatedDate.formateTime(time),
// //                   style: TextStyle(
// //                       color: isSelected ? Colors.white : Colors.black),
// //                 ),
// //               ),
// //             );
// //           }).toList(),
// //         ),
// //         if (selectedDay != null && availableSlots.isEmpty)
// //           Padding(
// //             padding: const EdgeInsets.only(top: 10),
// //             child: Text(
// //               "لا يوجد مواعيد متاحة لهذا اليوم",
// //               style: getMediumStyle(color: ColorManager.red),
// //             ),
// //           )
// //       ],
// //     );
// //   }
// }

// // class AppointmentList extends StatelessWidget {
// //   final List<AppointmentEntity> appointments;
// //   final Function(String? day, String? time) onSelectionChanged;

// //   const AppointmentList({
// //     super.key,
// //     required this.appointments,
// //     required this.onSelectionChanged,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     final ValueNotifier<String?> selectedDay = ValueNotifier<String?>(null);
// //     final ValueNotifier<String?> selectedTime = ValueNotifier<String?>(null);

// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         SizedBox(
// //           height: 50,
// //           child: ListView.separated(
// //             scrollDirection: Axis.horizontal,
// //             itemCount: appointments.length,
// //             separatorBuilder: (context, index) => const SizedBox(width: 8),
// //             itemBuilder: (context, index) {
// //               final appointment = appointments[index];
// //               bool isAvailable = appointment.availableSlots.isNotEmpty;

// //               return ValueListenableBuilder<String?>(
// //                 valueListenable: selectedDay,
// //                 builder: (context, value, _) {
// //                   final isSelected = value == appointment.date;
// //                   return GestureDetector(
// //                     onTap: isAvailable
// //                         ? () {
// //                             selectedDay.value = appointment.date;
// //                             selectedTime.value = null;
// //                             onSelectionChanged(appointment.date, null);
// //                           }
// //                         : null,
// //                     child: Container(
// //                       padding: const EdgeInsets.symmetric(
// //                           horizontal: 12, vertical: 10),
// //                       decoration: BoxDecoration(
// //                         color: isSelected
// //                             ? ColorManager.primary
// //                             : isAvailable
// //                                 ? ColorManager.grey.withOpacity(0.2)
// //                                 : Colors.grey.shade300,
// //                         borderRadius: BorderRadius.circular(12),
// //                         border: Border.all(
// //                           color: isSelected
// //                               ? ColorManager.primary
// //                               : Colors.transparent,
// //                         ),
// //                       ),
// //                       child: Text(
// //                         FormatedDate.formateArabicDate(appointment.date),
// //                         style: getRegularStyle(
// //                           color: isSelected
// //                               ? Colors.white
// //                               : isAvailable
// //                                   ? ColorManager.textColor
// //                                   : Colors.grey,
// //                         ),
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               );
// //             },
// //           ),
// //         ),
// //         const SizedBox(height: 20),
// //         ValueListenableBuilder<String?>(
// //           valueListenable: selectedDay,
// //           builder: (context, selected, _) {
// //             if (selected == null) return const SizedBox();

// //             final selectedAppointment = appointments.firstWhere(
// //               (element) => element.date == selected,
// //               orElse: () => AppointmentEntity(
// //                 date: selected,
// //                 availableSlots: [],
// //                 day: '',
// //               ),
// //             );

// //             final times = selectedAppointment.availableSlots;

// //             return SizedBox(
// //               height: 50,
// //               child: ListView.separated(
// //                 scrollDirection: Axis.horizontal,
// //                 itemCount: times.length,
// //                 separatorBuilder: (context, index) => const SizedBox(width: 8),
// //                 itemBuilder: (context, index) {
// //                   final time = times[index];

// //                   return ValueListenableBuilder<String?>(
// //                     valueListenable: selectedTime,
// //                     builder: (context, selected, _) {
// //                       final isSelected = selected == time;
// //                       return GestureDetector(
// //                         onTap: () {
// //                           selectedTime.value = time;
// //                           onSelectionChanged(selectedDay.value, time);
// //                         },
// //                         child: Container(
// //                           padding: const EdgeInsets.symmetric(
// //                               horizontal: 12, vertical: 10),
// //                           decoration: BoxDecoration(
// //                             color: isSelected
// //                                 ? ColorManager.primary
// //                                 : ColorManager.grey.withOpacity(0.2),
// //                             borderRadius: BorderRadius.circular(12),
// //                           ),
// //                           child: Text(
// //                             FormatedDate.formateTime(time),
// //                             style: getRegularStyle(
// //                               color: isSelected
// //                                   ? Colors.white
// //                                   : ColorManager.textColor,
// //                             ),
// //                           ),
// //                         ),
// //                       );
// //                     },
// //                   );
// //                 },
// //               ),
// //             );
// //           },
// //         )
// //       ],
// //     );
// //   }
// // }

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
    print("Appointment Date:");
    for (var appointment in widget.appointments) {
      print("Date: ${appointment.date} ${appointment.availableSlots}");
    }
    print("selected day: $selectedDay");
    print("selected time $selectedTime");
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

        // عرض الأيام (مثل: السبت، 12 مايو)
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: widget.appointments.map((appointment) {
              bool isAvailable = appointment.availableSlots.isNotEmpty;
              bool isSelected = selectedDay == appointment.date;
              String formattedDate = formatArabicDate(
                appointment.date,
                day: appointment.day,
              );
              return InkWell(
                onTap: isAvailable
                    ? () {
                        if (selectedDay == appointment.date) return;
                        setState(() {
                          selectedDay = appointment.date;
                          availableSlots =
                              List.from(appointment.availableSlots);
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

        // عرض الأوقات المتاحة بعد اختيار اليوم
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

// عرض الأوقات المتاحة لهذا اليوم
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

  // دالة لتنسيق التاريخ بشكل عربي
  String formatArabicDate(String date, {String? day}) {
    try {
      DateTime parsedDate =
          DateTime.tryParse(date) ?? DateTime(0); // التأكد من أن التاريخ صالح
      String dayNumber = DateFormat('d', 'ar').format(parsedDate);
      String monthName = DateFormat('MMMM', 'ar').format(parsedDate);
      return "$day $dayNumber $monthName";
    } catch (e) {
      print('Error formatting date: $e');
      return date;
    }
  }

  // دالة لتنسيق الوقت بشكل جيد
  String formatTime(String time) {
    // يمكن تعديل التنسيق حسب رغبتك (مثل: "12:00 PM" أو "الساعة 12:00")
    return time;
  }
}
