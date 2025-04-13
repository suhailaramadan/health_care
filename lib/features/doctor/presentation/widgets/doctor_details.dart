import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/utils/formated_date_time.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/error_indicator.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/doctor/domain/entities/doctor_entity.dart';
import 'package:graduation_project/features/doctor/presentation/widgets/appointment_list.dart';
import 'package:graduation_project/features/home/presentation/widgets/doctor_item.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_request.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_states.dart';

class DoctorDetails extends StatefulWidget {
  final String doctorId;
  const DoctorDetails({
    super.key,
    required this.doctorId,
  });
  static const dectorDetails = '/doctorDetails';

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  String? selectedDay;
  String? selectedTime;
  bool isBooking = false;

  void _updateSelectedAppointment(String? day, String? time) {
    setState(() {
      selectedDay = day;
      selectedTime = time;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<AppointmentCubit>().getAppointmentDoctorById(widget.doctorId);
    context.read<BookingCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null || args is! DoctorArg) {
      return const Scaffold(
        body: Center(child: Text("حدث خطأ: لم يتم العثور على بيانات الطبيب")),
      );
    }
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                height: 400,
                width: double.infinity,
                imageUrl: "${ApiConstants.imageBaseUrl}${args.imageUrl}",
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Image.asset("assets/images/doctor_image.png"),
              ),
            ),
            const SizedBox(height: 15),
            Text("${args.firstName} ${args.lastName}",
                style: getMediumStyle(
                    color: const Color.fromARGB(204, 82, 151, 221))),
            const SizedBox(height: 20),
            Text("مواعيد الحجز",
                style: getMediumStyle(color: ColorManager.grey)),
            const SizedBox(height: 20),
            BlocBuilder<AppointmentCubit, AppointmentStates>(
              builder: (context, state) {
                if (state is GetAppointmentLoading) {
                  return const CircularProgressIndicator(
                    color: ColorManager.primary,
                  );
                }
                if (state is GetAppointmentError) {
                  return Text('خطأ: ${state.message}');
                }
                if (state is GetAppointmentSuccess) {
                  return AppointmentList(
                    appointments: state.appointmentEntity,
                    onSelectionChanged: _updateSelectedAppointment,
                  );
                }
                return const Text('لم يتم تحميل البيانات');
              },
            ),
            const SizedBox(height: 20),
            BlocListener<BookingCubit, BookingStates>(
              listener: (context, state) {
                if (state is GetBookingLoading) {
                  setState(() => isBooking = true);
                } else if (state is GetBookingSuccess) {
                  setState(() => isBooking = false);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 3),
                      content: Text(
                          "تم حجز موعد يوم ${FormatedDate.formateArabicDate(state.booking.data!.date ?? '', day: '')} الساعة ${FormatedDate.formateArabicDate(state.booking.data!.time ?? '', day: '')} بنجاح"),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else if (state is GetBookingError) {
                  setState(() => isBooking = false);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red),
                  );
                }
              },
              child: ElevatedButton(
                onPressed:
                    (selectedDay != null && selectedTime != null && !isBooking)
                        ? () => _showConfirmationDialog(context)
                        : null,
                style: ButtonStyle(
                  shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  )),
                  foregroundColor:
                      const MaterialStatePropertyAll(ColorManager.white),
                  backgroundColor:
                      MaterialStateProperty.all(ColorManager.primary),
                ),
                child: isBooking
                    ? const CircularProgressIndicator(color: ColorManager.white)
                    : Text("حجز موعد",
                        style: getMediumStyle(color: ColorManager.white)
                            .copyWith(fontSize: 20)),
              ),
            ),
            const SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // shape: ContinuousRectangleBorder(
          //     borderRadius: BorderRadius.circular(25)),
          title: const Center(child: Text("تأكيد الحجز")),
          backgroundColor: ColorManager.blue,

          content: Text(
              "هل تريد تأكيد حجز موعد يوم${FormatedDate.formateArabicDate(selectedDay!, day: '')} الساعة ${FormatedDate.formateTime(selectedTime!)}؟"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child:
                  Text("إلغاء", style: getMediumStyle(color: ColorManager.red)),
            ),
            TextButton(
              onPressed: () {
                final bookingCubit = context.read<BookingCubit>();
                bookingCubit.bookAppointment(
                  BookingRequest(
                    time: selectedTime!,
                    date: selectedDay!,
                    doctorId: widget.doctorId,
                    isBooking: isBooking,
                  ),
                );
                Navigator.of(context).pop();
              },
              child: Text("تأكيد",
                  style: getMediumStyle(color: ColorManager.primary)),
            ),
          ],
        );
      },
    );
  }
}

// class _DoctorDetailsState extends State<DoctorDetails> {
//   String? selectedDay;
//   String? selectedTime;
//   // String doctorId='';
//   bool isBooking = false;

//   void _updateSelectedAppointment(String? day, String? time) {
//     print("🔄 تحديث القيم في DoctorDetails -> يوم: $day، وقت: $time");
//     setState(() {
//       selectedDay = day;
//       selectedTime = time;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     print("loading data");
//     context.read<AppointmentCubit>().getAppointmentDoctorById(widget.doctorId);
//     context.read<BookingCubit>().bookAppointment;
//     // final request = BookingReque
//   }
//   // @override
//   // void didUpdateWidget(covariant DoctorDetails oldWidget) {
//   //   super.didUpdateWidget(oldWidget);
//   //   if (oldWidget.doctorId != widget.doctorId) {
//   //     context
//   //         .read<AppointmentCubit>()
//   //         .getAppointmentDoctorById(widget.doctorId);
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final args = ModalRoute.of(context)?.settings.arguments;
//     if (args == null || args is! DoctorArg) {
//       return const Scaffold(
//         body: Center(child: Text("حدث خطأ: لم يتم العثور على بيانات الطبيب")),
//       );
//     }

//     return Scaffold(
//       body: Directionality(
//         textDirection: TextDirection.rtl,
//         child: SingleChildScrollView(
//           child: Column(children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(25),
//               child: CachedNetworkImage(
//                 fit: BoxFit.fill,
//                 height: 400,
//                 width: double.infinity,
//                 imageUrl: "${ApiConstants.imageBaseUrl}${args.imageUrl}",
//                 placeholder: (context, url) =>
//                     const Center(child: CircularProgressIndicator()),
//                 errorWidget: (context, url, error) =>
//                     Image.asset("assets/images/doctor_image.png"),
//               ),
//             ),
//             const SizedBox(height: 15),
//             Padding(
//               padding: const EdgeInsets.only(right: 10),
//               child: Align(
//                   alignment: Alignment.topRight,
//                   child: Text(
//                     "عن الطبيب",
//                     style: getMediumStyle(color: ColorManager.grey),
//                   )),
//             ),
//             // six
//             Center(
//               child: Text(
//                 "${args.firstName} ${args.lastName}",
//                 style: getMediumStyle(
//                     color: const Color.fromARGB(204, 82, 151, 221)),
//               ),
//             ),
//             Center(
//               child: Text(
//                 '${args.description}',
//                 style: getMediumStyle(
//                   color: const Color.fromARGB(204, 82, 151, 221),
//                   fontSize: FontSize.s12,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.only(right: 10),
//               child: Align(
//                   alignment: Alignment.topRight,
//                   child: Text(
//                     "مواعيد الحجز",
//                     style: getMediumStyle(color: ColorManager.grey),
//                   )),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             // BlocProvider.value(
//             //   // create: (context) =>
//             //   value: serviceLocator.get<AppointmentCubit>()
//             //     ..getAppointmentDoctorById(widget.doctorId),
//             // /child:
//             BlocBuilder<AppointmentCubit, AppointmentStates>(
//               builder: (context, state) {
//                 if (state is GetAppointmentLoading) {
//                   return const LoadingIndicator();
//                 } else if (state is GetAppointmentError) {
//                   return Center(child: ErrorIndicator(message: state.message));
//                 } else if (state is GetAppointmentSuccess) {
//                   return
//                       // Column(
//                       //   children: [
//                       //     SizedBox(
//                       //       height: 300,
//                       //       child:
//                       AppointmentList(
//                     appointments: state.appointmentEntity,
//                     onSelectionChanged: _updateSelectedAppointment,
//                   );
//                 } else {
//                   return const Center(child: Text('لم يتم تحميل اليانات'));
//                 }
//               },
//             ),
//             // ),

//             const SizedBox(height: 20),
//             // BlocListener<BookingCubit, BookingStates>(
//             //   listener: (context, state) {
//             //     print("لآمخؤ/هسفىثق hsjrfg pjjjjjjjjحديد");
//             //     if (state is GetBookingLoading) {
//             //       setState(() {
//             //         isBooking = true;
//             //       });
//             //     } else if (state is GetBookingSuccess) {
//             //       setState(() {
//             //         isBooking = false;
//             //       });
//             //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             //         content: Text(
//             //             "تم حجز موعد يوم $selectedDay الساعة $selectedTime بنجاح"),
//             //         backgroundColor: Colors.green,
//             //       ));
//             //     } else if (state is GetBookingError) {
//             //       setState(() {
//             //         isBooking = false;
//             //       });
//             //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             //         content: Text(state.message),
//             //         backgroundColor: ColorManager.red,
//             //       ));
//             //     }
//             //   },
//             // child:
//             BlocConsumer<BookingCubit, BookingStates>(
//               listener: (context, state) {
//                 print("لآمخؤ/هسفىثق hsjrfg pjjjjjjjjحديد");
//                 if (state is GetBookingLoading) {
//                   setState(() {
//                     isBooking = true;
//                   });
//                 } else if (state is GetBookingSuccess) {
//                   setState(() {
//                     isBooking = false;
//                   });
//                   print(
//                       "${state.booking.data!.date}---${state.booking.data!.time}");
//                   Future.delayed(const Duration(milliseconds: 500), () {
//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content: Text(
//                           "تم حجز موعد يوم ${state.booking.data!.date} الساعة ${state.booking.data!.time} بنجاح"),
//                       backgroundColor: Colors.green,
//                     ));
//                   });
//                 } else if (state is GetBookingError) {
//                   setState(() {
//                     isBooking = false;
//                   });
//                   print("فشل الحجز: ${state.message}");
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                     content: Text(state.message),
//                     backgroundColor: ColorManager.red,
//                   ));
//                 }

//                 SizedBox(
//                   width: 180,
//                   child: BlocBuilder<BookingCubit, BookingStates>(
//                     builder: (context, state) {
//                       return ElevatedButton(
//                         onPressed: (selectedDay != null &&
//                                 selectedTime != null &&
//                                 !isBooking)
//                             ? () {
//                                 _confirmBooking(context);
//                               }
//                             : null,
//                         style: ButtonStyle(
//                           shape: const MaterialStatePropertyAll(
//                               RoundedRectangleBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(8)),
//                           )),
//                           foregroundColor: const MaterialStatePropertyAll(
//                               ColorManager.white),
//                           backgroundColor: MaterialStateProperty.all(
//                             // (selectedDay != null && selectedTime != null)
//                             // ?
//                             ColorManager.primary,
//                             // : ColorManager.grey,
//                           ),
//                         ),
//                         child: state is GetBookingLoading
//                             ? const CircularProgressIndicator(
//                                 color: ColorManager.white,
//                               )
//                             : Text(
//                                 "حجز موعد",
//                                 style: getMediumStyle(color: ColorManager.white)
//                                     .copyWith(fontSize: FontSize.s20),
//                               ),
//                       );
//                     },
//                   ),
//                 );
//               },
//               // builder: (context, state) {
//               //   return SizedBox(
//               //       width: 180,
//               //       child: ElevatedButton(
//               //         onPressed: (selectedDay != null &&
//               //                 selectedTime != null &&
//               //                 !isBooking)
//               //             ? () {

//               //                 // _confirmBooking(context);
//               //                 AlertDialog(
//               //                   // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//               //                   backgroundColor: ColorManager.white,
//               //                   title: Center(
//               //                     child: Text(
//               //                       "تأكيد الحجز",
//               //                       style: getMediumStyle(
//               //                           color: ColorManager.black),
//               //                     ),
//               //                   ),
//               //                   content: Text(
//               //                     "هل تريد حجز موعد يوم ${FormatedDate.formateArabicDate(selectedDay!, day: '')} الساعة ${FormatedDate.formateTime(selectedTime!)}",
//               //                     style: getMediumStyle(
//               //                         color: ColorManager.black, fontSize: 13),
//               //                   ),
//               //                   actions: [
//               //                     TextButton(
//               //                       onPressed: () {
//               //                         Navigator.of(context).pop();
//               //                         // setState(() {
//               //                         //   selectedDay = null;
//               //                         //   selectedTime = null;
//               //                         // });
//               //                       },
//               //                       child: Text(
//               //                         'إلغاء',
//               //                         style: getMediumStyle(
//               //                           color: ColorManager.red,
//               //                         ),
//               //                       ),
//               //                     ),
//               //                     // (state is GetBookingLoading)
//               //                     // ? const LoadingIndicator()
//               //                     // :
//               //                     TextButton(
//               //                       onPressed: () {
//               //                         print("تم الضغط على زر التاكيد");

//               //                         print(" تم استدعاء ال bookingCubit");
//               //                         final bookingCubit =
//               //                             context.read<BookingCubit>();
//               //                         bookingCubit.bookAppointment(
//               //                             BookingRequest(
//               //                                 time: selectedTime!,
//               //                                 date: selectedDay!,
//               //                                 doctorId: widget.doctorId,
//               //                                 isBooking: isBooking));
//               //                         Navigator.of(context).pop();
//               //                         print("تم الاستعادء ");
//               //                         SizedBox(
//               //                           height: 150,
//               //                           width: 150,
//               //                           child: AlertDialog(
//               //                             backgroundColor: ColorManager.white,
//               //                             content: Column(
//               //                               children: [
//               //                                 Text(selectedDay!),
//               //                                 Text(selectedTime!),
//               //                                 const Text("تم تأكيد الحجز"),
//               //                               ],
//               //                             ),
//               //                           ),
//               //                         );
//               //                       },
//               //                       child: Text('تأكيد',
//               //                           style: getMediumStyle(
//               //                               color: ColorManager.primary)),
//               //                     ),
//               //                   ],
//               //                 );
//               //               }
//               //             : null,
//               //         style: ButtonStyle(
//               //           shape: const MaterialStatePropertyAll(
//               //               RoundedRectangleBorder(
//               //             borderRadius: BorderRadius.all(Radius.circular(8)),
//               //           )),
//               //           foregroundColor:
//               //               const MaterialStatePropertyAll(ColorManager.white),
//               //           backgroundColor: MaterialStateProperty.all(
//               //             // (selectedDay != null && selectedTime != null)
//               //             // ?
//               //             ColorManager.primary,
//               //             // : ColorManager.grey,
//               //           ),
//               //         ),
//               //         child: state is GetBookingLoading
//               //             ? const CircularProgressIndicator(
//               //                 color: ColorManager.white,
//               //               )
//               //             : Text(
//               //                 "حجز موعد",
//               //                 style: getMediumStyle(color: ColorManager.white)
//               //                     .copyWith(fontSize: FontSize.s20),
//               //               ),
//               //       ));
//               // },
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             // BlocBuilder<BookingCubit, BookingStates>(
//             //   builder: (context, state) {
//             //     if (state is GetBookingLoading) {
//             //       return CircularProgressIndicator();
//             //     } else if (state is GetBookingSuccess) {
//             //       return Padding(
//             //           padding: EdgeInsets.all(8),
//             //           child: Text(
//             //               "تم حجز موعد يوم ${state.booking.data!.date} الساعة ${state.booking.data!.time}"));
//             //     } else if (state is GetBookingError) {
//             //       return Padding(
//             //         padding: EdgeInsets.all(8),
//             //         child: Text('خطأ: ${state.message}'),
//             //       );
//             //     } else {
//             //       return SizedBox();
//             //     }
//             //   },
//             // )
//           ]),

//           // ],
//         ),
//         // ),
//       ),
//       // ),
//     );
//   }

//   void _confirmBooking(BuildContext context) {
//     // builder: (_) => BlocConsumer<BookingCubit, BookingStates>(
//     //   listener: (context, state) {
//     //     if (state is GetBookingLoading) {
//     //       print("لاخخنهتىالLoooking");
//     //       setState(() {
//     //         isBooking = true;
//     //       });
//     //     }
//     //     if (state is GetBookingSuccess) {
//     //       print("Booking succsssss");
//     //       setState(() {
//     //         isBooking = false;
//     //       });

//     //       Navigator.of(context).pop();
//     //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//     //         content: Text("تم الحجز بنجاح"),
//     //         backgroundColor: Colors.green,
//     //       ));
//     //     } else if (state is GetBookingError) {
//     //       print("فشل الحجوىىىىىىىىىىىىىى");
//     //       setState(() {
//     //         isBooking = false;
//     //       });
//     //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//     //         content: Text("فشل الحجز ${state.message}"),
//     //         backgroundColor: ColorManager.red,
//     //       ));
//     //     }
//     //   },
//     (context) {
//       print("نافذت التاكيد ظهرت");
//       return AlertDialog(
//         // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//         backgroundColor: ColorManager.white,
//         title: Center(
//           child: Text(
//             "تأكيد الحجز",
//             style: getMediumStyle(color: ColorManager.black),
//           ),
//         ),
//         content: Text(
//           "هل تريد حجز موعد يوم ${FormatedDate.formateArabicDate(selectedDay!, day: '')} الساعة ${FormatedDate.formateTime(selectedTime!)}",
//           style: getMediumStyle(color: ColorManager.black, fontSize: 13),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               // setState(() {
//               //   selectedDay = null;
//               //   selectedTime = null;
//               // });
//             },
//             child: Text(
//               'إلغاء',
//               style: getMediumStyle(
//                 color: ColorManager.red,
//               ),
//             ),
//           ),
//           // (state is GetBookingLoading)
//           // ? const LoadingIndicator()
//           // :
//           TextButton(
//             onPressed: () {
//               print("تم الضغط على زر التاكيد");

//               print(" تم استدعاء ال bookingCubit");
//               final bookingCubit = context.read<BookingCubit>();
//               bookingCubit.bookAppointment(BookingRequest(
//                   time: selectedTime!,
//                   date: selectedDay!,
//                   doctorId: widget.doctorId,
//                   isBooking: isBooking));
//               Navigator.of(context).pop();
//               print("تم الاستعادء ");
//               SizedBox(
//                 height: 150,
//                 width: 150,
//                 child: AlertDialog(
//                   backgroundColor: ColorManager.white,
//                   content: Column(
//                     children: [
//                       Text(selectedDay!),
//                       Text(selectedTime!),
//                       const Text("تم تأكيد الحجز"),
//                     ],
//                   ),
//                 ),
//               );
//             },
//             child: Text('تأكيد',
//                 style: getMediumStyle(color: ColorManager.primary)),
//           ),
//         ],
//       );
//     };
//     // ),
//     // );
//   }

//   // void _bookAppointment(BuildContext context) {
//   //   context.read<BookingCubit>().bookAppointment(BookingRequest(
//   //       time: selectedTime!,
//   //       date: selectedDay!,
//   //       doctorId: widget.doctorId,
//   //       isBooking: isBooking));
//   //   // final request = BookingRequest(
//   //   //     date: selectedDay ?? '',
//   //   //     time: selectedTime ?? '',
//   //   //     doctorId: widget.doctorId,
//   //   //     isBooking: isBooking);

//   //   // ScaffoldMessenger.of(context).showSnackBar(
//   //   //   SnackBar(
//   //   //     content:
//   //   //         Text("تم حجز موعد يوم $selectedDay الساعة $selectedTime بنجاح"),
//   //   //     backgroundColor: Colors.green,
//   //   //     padding: const EdgeInsets.all(8),
//   //   //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//   //   //   ),
//   //   // );
//   // }
// }
