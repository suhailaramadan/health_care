// // // // import 'package:flutter/material.dart';
// // // // import 'package:graduation_project/core/resources/color_manager.dart';
// // // // import 'package:graduation_project/core/resources/styles_manager.dart';
// // // // import 'package:graduation_project/core/widgets/custom_botton.dart';
// // // // import 'package:graduation_project/features/user/booking/domain/entities/appointment_entity.dart';

// // // // class AppointmentList extends StatelessWidget {
// // // //   final AppointmentEntity appointmentEntity;
// // // //   const AppointmentList({super.key, required this.appointmentEntity});

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Card(
// // // //         margin: const EdgeInsets.symmetric(vertical: 8),
// // // //         child: Padding(
// // // //           padding: const EdgeInsets.all(8.0),
// // // //           child: Row(
// // // //             mainAxisAlignment: MainAxisAlignment
// // // //                 .spaceBetween, // ✅ يجعل الزر لا يأخذ كل المساحة
// // // //             children: [
// // // //               Column(
// // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // //                 children: [
// // // //                   Text("اليوم: ${appointmentEntity.day}",
// // // //                       style:
// // // //                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// // // //                   Text(
// // // //                       "المواعيد المتاحة: ${appointmentEntity.availableSlots.join(', ')}"),
// // // //                 ],
// // // //               ),
// // // //               CustomButton(
// // // //                 label: "حجز",
// // // //                 onTap: () {
// // // //                   _confirmBooking(appointmentEntity, context);
// // // //                 },
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         )
// // // //         //  ListTile(
// // // //         //   title: Text(
// // // //         //     "اليوم : ${_convertDayToArabic(appointmentEntity.day)}",
// // // //         //     style: getMediumStyle(color: ColorManager.primary),
// // // //         //   ),
// // // //         //   subtitle: Text(
// // // //         //     appointmentEntity.availableSlots.isNotEmpty
// // // //         //         ? "المواعيد المتاحة: ${appointmentEntity.availableSlots.join(', ')}"
// // // //         //         : "لا توجد مواعيد متاحة",
// // // //         //   ),
// // // //         //   trailing: SizedBox(
// // // //         //     width: 150,
// // // //         //     child: CustomButton(
// // // //         //       label: "حجز",
// // // //         //       onTap: () {
// // // //         //         _confirmBooking(appointmentEntity, context);
// // // //         //       },
// // // //         //     ),
// // // //         //   ),
// // // //         // ),
// // // //         );
// // // //   }

// // // //   String _convertDayToArabic(String? day) {
// // // //     const days = {
// // // //       "Saturday": "السبت",
// // // //       "Sunday": "الأحد",
// // // //       "Monday": "الإثنين",
// // // //       "Tuesday": "الثلاثاء",
// // // //       "Wednesday": "الأربعاء",
// // // //       "Thursday": "الخميس",
// // // //     };
// // // //     return days[day] ?? 'غير معروف';
// // // //   }

// // // //   void _confirmBooking(AppointmentEntity appointment, BuildContext context) {
// // // //     showDialog(
// // // //         context: context,
// // // //         builder: (_) => AlertDialog(
// // // //               title: const Text("تأكيد الحجز"),
// // // //               content: Text(
// // // //                   "هل تريد حجز موعد يوم ${_convertDayToArabic(appointment.day)}؟\n "
// // // //                   "المواعيد المتاحة: ${appointment.availableSlots.isNotEmpty ? appointment.availableSlots.join(', ') : 'لا توجد مواعيد متاحة'}"),
// // // //               // من ${appointment.availableSlots} ل ${appointment.endTime}"),
// // // //               actions: [
// // // //                 TextButton(
// // // //                     onPressed: () => Navigator.of(context).pop(),
// // // //                     child: const Text('إلغاء')),
// // // //                 CustomButton(
// // // //                   label: "تأكيد",
// // // //                   onTap: () {
// // // //                     Navigator.of(context).pop();
// // // //                     _bookAppointment(context, appointment);
// // // //                   },
// // // //                 )
// // // //               ],
// // // //             ));
// // // //   }

// // // //   void _bookAppointment(BuildContext context, AppointmentEntity appointment) {
// // // //     ScaffoldMessenger.of(context).showSnackBar(
// // // //       SnackBar(
// // // //         content: Text(
// // // //             "تم حجز موعد يوم ${_convertDayToArabic(appointment.day)} بنجاح"),
// // // //         backgroundColor: ColorManager.babyGreen,
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // //-------------------------------
// // // import 'package:flutter/material.dart';
// // // import 'package:graduation_project/core/resources/color_manager.dart';
// // // import 'package:graduation_project/core/widgets/custom_botton.dart';
// // // import 'package:graduation_project/features/user/booking/domain/entities/appointment_entity.dart';

// // // class AppointmentList extends StatefulWidget {
// // //   final AppointmentEntity appointmentEntity;
// // //   const AppointmentList({super.key, required this.appointmentEntity});

// // //   @override
// // //   _AppointmentListState createState() => _AppointmentListState();
// // // }

// // // class _AppointmentListState extends State<AppointmentList> {
// // //   String? selectedDay; // اليوم المختار
// // //   String? selectedTime; // الوقت المختار

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     bool isDaySelected = selectedDay == widget.appointmentEntity.day;

// // //     return SizedBox(
// // //       height: 100,
// // //       width: 180,
// // //       child: Card(
// // //         margin: const EdgeInsets.symmetric(vertical: 8),
// // //         child: Padding(
// // //           padding: const EdgeInsets.all(12.0),
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               // ✅ اختيار اليوم
// // //               GestureDetector(
// // //                 onTap: () {
// // //                   setState(() {
// // //                     selectedDay = widget.appointmentEntity.day;
// // //                     selectedTime = null; // تصفير الوقت عند تغيير اليوم
// // //                   });
// // //                 },
// // //                 child: Container(
// // //                   padding:
// // //                       const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
// // //                   decoration: BoxDecoration(
// // //                     color:
// // //                         isDaySelected ? ColorManager.primary : Colors.grey[300],
// // //                     borderRadius: BorderRadius.circular(8),
// // //                   ),
// // //                   child: Text(
// // //                     "${widget.appointmentEntity.day} - ${widget.appointmentEntity.date}",
// // //                     style: TextStyle(
// // //                       fontSize: 16,
// // //                       fontWeight: FontWeight.bold,
// // //                       color: isDaySelected ? Colors.white : Colors.black,
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 10),

// // //               // ✅ عرض الأوقات المتاحة فقط عند اختيار اليوم
// // //               if (isDaySelected)
// // //                 Wrap(
// // //                   spacing: 10,
// // //                   children: widget.appointmentEntity.availableSlots.map((time) {
// // //                     bool isSelected = selectedTime == time;
// // //                     return GestureDetector(
// // //                       onTap: () {
// // //                         setState(() {
// // //                           selectedTime = time;
// // //                         });
// // //                       },
// // //                       child: Container(
// // //                         padding: const EdgeInsets.symmetric(
// // //                             vertical: 8, horizontal: 12),
// // //                         decoration: BoxDecoration(
// // //                           color: isSelected
// // //                               ? ColorManager.primary
// // //                               : Colors.blue[100],
// // //                           borderRadius: BorderRadius.circular(8),
// // //                         ),
// // //                         child: Text(
// // //                           time,
// // //                           style: TextStyle(
// // //                             color: isSelected ? Colors.white : Colors.black,
// // //                             fontWeight: FontWeight.bold,
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     );
// // //                   }).toList(),
// // //                 ),

// // //               const SizedBox(height: 15),

// // //               // ✅ زر الحجز
// // //               if (selectedTime != null)
// // //                 Center(
// // //                   child: CustomButton(
// // //                     label: "حجز موعد",
// // //                     onTap: () {
// // //                       _confirmBooking(widget.appointmentEntity, context);
// // //                     },
// // //                   ),
// // //                 ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   void _confirmBooking(AppointmentEntity appointment, BuildContext context) {
// // //     showDialog(
// // //       context: context,
// // //       builder: (_) => AlertDialog(
// // //         title: const Text("تأكيد الحجز"),
// // //         content: Text(
// // //             "هل تريد حجز موعد يوم ${appointment.day} الساعة $selectedTime؟"),
// // //         actions: [
// // //           TextButton(
// // //             onPressed: () => Navigator.of(context).pop(),
// // //             child: const Text('إلغاء'),
// // //           ),
// // //           CustomButton(
// // //             label: "تأكيد",
// // //             onTap: () {
// // //               Navigator.of(context).pop();
// // //               _bookAppointment(context, appointment);
// // //             },
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   void _bookAppointment(BuildContext context, AppointmentEntity appointment) {
// // //     ScaffoldMessenger.of(context).showSnackBar(
// // //       SnackBar(
// // //         content: Text(
// // //             "تم حجز موعد يوم ${appointment.day} الساعة $selectedTime بنجاح"),
// // //         backgroundColor: ColorManager.babyGreen,
// // //       ),
// // //     );
// // //   }
// // // }
// // /////////////////////////////////////////////////////////----
// // import 'package:flutter/material.dart';
// // import 'package:graduation_project/core/resources/color_manager.dart';
// // import 'package:graduation_project/core/widgets/custom_botton.dart';
// // import 'package:graduation_project/features/user/booking/domain/entities/appointment_entity.dart';

// // class AppointmentList extends StatefulWidget {
// //   final List<AppointmentEntity> appointments;
// //   const AppointmentList({super.key, required this.appointments});

// //   @override
// //   _AppointmentListState createState() => _AppointmentListState();
// // }

// // class _AppointmentListState extends State<AppointmentList> {
// //   String? selectedDay;
// //   List<String> availableSlots = [];
// //   String? selectedTime;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         // ✅ قائمة الأيام المتاحة
// //         Wrap(
// //           spacing: 10,
// //           children: widget.appointments.map((appointment) {
// //             bool isAvailable = appointment.availableSlots.isNotEmpty;
// //             bool isSelected = selectedDay == appointment.day;

// //             return GestureDetector(
// //               onTap: isAvailable
// //                   ? () {
// //                       setState(() {
// //                         selectedDay = appointment.day;
// //                         availableSlots = appointment.availableSlots;
// //                         selectedTime = null;
// //                       });
// //                     }
// //                   : null,
// //               child: Container(
// //                 padding:
// //                     const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
// //                 decoration: BoxDecoration(
// //                   color: isAvailable
// //                       ? (isSelected ? ColorManager.primary : Colors.blue[100])
// //                       : Colors.grey[300], // رمادي للأيام غير المتاحة
// //                   borderRadius: BorderRadius.circular(8),
// //                 ),
// //                 child: Text(
// //                   appointment.day,
// //                   style: TextStyle(
// //                     fontSize: 16,
// //                     fontWeight: FontWeight.bold,
// //                     color: isAvailable
// //                         ? (isSelected ? Colors.white : Colors.black)
// //                         : Colors.grey,
// //                   ),
// //                 ),
// //               ),
// //             );
// //           }).toList(),
// //         ),

// //         const SizedBox(height: 15),

// //         // ✅ قائمة الأوقات المتاحة
// //         if (selectedDay != null)
// //           Wrap(
// //             spacing: 10,
// //             children: availableSlots.map((time) {
// //               bool isSelected = selectedTime == time;
// //               return GestureDetector(
// //                 onTap: () {
// //                   setState(() {
// //                     selectedTime = time;
// //                   });
// //                 },
// //                 child: Container(
// //                   padding:
// //                       const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
// //                   decoration: BoxDecoration(
// //                     color: isSelected ? ColorManager.primary : Colors.blue[100],
// //                     borderRadius: BorderRadius.circular(8),
// //                   ),
// //                   child: Text(
// //                     time,
// //                     style: TextStyle(
// //                       color: isSelected ? Colors.white : Colors.black,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                 ),
// //               );
// //             }).toList(),
// //           ),

// //         const SizedBox(height: 15),

// //         // ✅ زر الحجز
// //         if (selectedTime != null)
// //           CustomButton(
// //             label: "حجز موعد",
// //             onTap: () {
// //               _confirmBooking(context);
// //             },
// //           ),
// //       ],
// //     );
// //   }

// //   void _confirmBooking(BuildContext context) {
// //     showDialog(
// //       context: context,
// //       builder: (_) => AlertDialog(
// //         title: const Text("تأكيد الحجز"),
// //         content:
// //             Text("هل تريد حجز موعد يوم $selectedDay الساعة $selectedTime؟"),
// //         actions: [
// //           TextButton(
// //             onPressed: () => Navigator.of(context).pop(),
// //             child: const Text('إلغاء'),
// //           ),
// //           CustomButton(
// //             label: "تأكيد",
// //             onTap: () {
// //               Navigator.of(context).pop();
// //               _bookAppointment(context);
// //             },
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   void _bookAppointment(BuildContext context) {
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(
// //         content:
// //             Text("تم حجز موعد يوم $selectedDay الساعة $selectedTime بنجاح"),
// //         backgroundColor: ColorManager.babyGreen,
// //       ),
// //     );
// //   }
// // }
// /////////////////////////////////////111111111111111111111
import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/features/user/booking/domain/entities/appointment_entity.dart';

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

// class _AppointmentListState extends State<AppointmentList> {
//   String? selectedDay;
//   List<String> availableSlots = [];
//   String? selectedTime;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // ✅ قائمة الأيام المتاحة
//         Wrap(
//           spacing: 10,
//           children: widget.appointments.map((appointment) {
//             bool isAvailable = appointment.availableSlots.isNotEmpty;
//             bool isSelected = selectedDay == appointment.day;

//             return GestureDetector(
//               onTap: isAvailable
//                   ? () {
//                       setState(() {
//                         selectedDay = appointment.day;
//                         availableSlots = appointment.availableSlots;
//                         selectedTime = null;
//                       });

//                       // ✅ إرسال القيم المختارة إلى DoctorDetails
//                       widget.onSelectionChanged(selectedDay, null);
//                     }
//                   : null,
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                 decoration: BoxDecoration(
//                   color: isAvailable
//                       ? (isSelected ? ColorManager.primary : Colors.blue[100])
//                       : Colors.grey[300], // رمادي للأيام غير المتاحة
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Text(
//                   appointment.day,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: isAvailable
//                         ? (isSelected ? Colors.white : Colors.black)
//                         : Colors.grey,
//                   ),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),

//         const SizedBox(height: 15),

//         // ✅ قائمة الأوقات المتاحة
//         if (selectedDay != null)
//           Wrap(
//             spacing: 10,
//             children: availableSlots.map((time) {
//               bool isSelected = selectedTime == time;
//               return GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     selectedTime = time;
//                   });
//                 },
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//                   decoration: BoxDecoration(
//                     color: isSelected ? ColorManager.primary : Colors.blue[100],
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Text(
//                     time,
//                     style: TextStyle(
//                       color: isSelected ? Colors.white : Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),

//         const SizedBox(height: 15),

//         // ✅ زر الحجز (يظهر دائمًا، لكنه يكون معطل إذا لم يتم اختيار يوم ووقت)
//         ElevatedButton(
//           onPressed: (selectedDay != null && selectedTime != null)
//               ? () {
//                   _confirmBooking(context);
//                 }
//               : null,
//           style: ButtonStyle(
//               backgroundColor: MaterialStatePropertyAll(
//             (selectedDay != null && selectedTime != null)
//                 ? ColorManager.primary
//                 : Colors.grey,
//           )), // تعطيل الزر إذا لم يتم اختيار موعد // تغيير اللون ليكون واضحًا, child: child)
//           child: Text("حجز موعد"),
//         )
//         // (

//         //   label: "حجز موعد",
//         //   onTap: (selectedDay != null && selectedTime != null)
//         //       ? () {
//         //           _confirmBooking(context);
//         //         }
//         //       : null, // تعطيل الزر إذا لم يتم اختيار موعد
//         //   color: (selectedDay != null && selectedTime != null)
//         //       ? ColorManager.primary
//         //       : Colors.grey, // تغيير اللون ليكون واضحًا
//         // ),
//       ],
//     );
//   }

//   void _confirmBooking(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("تأكيد الحجز"),
//         content:
//             Text("هل تريد حجز موعد يوم $selectedDay الساعة $selectedTime؟"),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: const Text('إلغاء'),
//           ),
//           CustomButton(
//             label: "تأكيد",
//             onTap: () {
//               Navigator.of(context).pop();
//               _bookAppointment(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   void _bookAppointment(BuildContext context) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content:
//             Text("تم حجز موعد يوم $selectedDay الساعة $selectedTime بنجاح"),
//         backgroundColor: ColorManager.babyGreen,
//       ),
//     );
//   }
// }
////////////////////////////////////////////////////////////////////////////////////////////////////////////
class _AppointmentListState extends State<AppointmentList> {
  String? selectedDay;
  List<String> availableSlots = [];
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 10,
          children: widget.appointments.map((appointment) {
            bool isAvailable = appointment.availableSlots.isNotEmpty;
            bool isSelected = selectedDay == appointment.day;

            return InkWell(
              splashColor: ColorManager.blue,
              onTap: isAvailable
                  ? () {
                      setState(() {
                        selectedDay = appointment.day;
                        availableSlots = appointment.availableSlots;
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
                      : ColorManager.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  appointment.day,
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
        if (selectedDay != null)
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
                    time,
                    style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black),
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}
