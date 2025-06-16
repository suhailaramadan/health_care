// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:graduation_project/core/constants.dart';
// import 'package:graduation_project/core/resources/color_manager.dart';
// import 'package:graduation_project/core/resources/styles_manager.dart';
// import 'package:graduation_project/core/utils/formated.dart';
// import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart';
// import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart';
// import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart';
// import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart';
// import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_states.dart';
// import 'package:graduation_project/features/user/booking/presentation/widgets/re_booking.dart';
// import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart';

// class BookingCard extends StatelessWidget {
//   final String doctorFirstName;
//   final String doctorlastName;
//   final String clinicName;
//   final String doctorImage;
//   final String bookingDate;
//   final String bookingTime;
//   final String doctorId;
//   final int clinicId;
//   final VoidCallback onCancel;
//   final int bookingId;
//   final VoidCallback onReschedule;
//   const BookingCard(
//       {super.key,
//       required this.clinicName,
//       required this.doctorImage,
//       required this.bookingDate,
//       required this.bookingTime,
//       required this.onCancel,
//       required this.bookingId,
//       required this.onReschedule,
//       required this.doctorFirstName,
//       required this.doctorlastName,
//       required this.clinicId,
//       required this.doctorId});

//   @override
//   Widget build(BuildContext context) {
//     return FractionallySizedBox(
//       widthFactor: 0.93,
//       child: Card(
//         shadowColor: ColorManager.greyDark,
//         surfaceTintColor: ColorManager.white,
//         color: ColorManager.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         elevation: 3,
//         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: Padding(
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 40,
//                     backgroundColor: ColorManager.greyDark,
//                     backgroundImage: AssetImage(doctorImage),
//                   ),
//                   const SizedBox(width: 20),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("د. $doctorFirstName $doctorlastName",
//                             style: getBoldStyle(
//                                 fontSize: 16, color: ColorManager.textColor)),
//                         const SizedBox(height: 4),
//                         Row(
//                           children: [
//                             const Icon(Icons.local_hospital,
//                                 size: 14, color: Colors.grey),
//                             const SizedBox(width: 4),
//                             Expanded(
//                                 child: Text(clinicName,
//                                     style: getRegularStyle(
//                                         fontSize: 13,
//                                         color: ColorManager.textColor))),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               Row(
//                 // mainAxisAlignment: MainAxisAlignment.cente,
//                 children: [
//                   const Icon(Icons.calendar_today,
//                       size: 14, color: Colors.grey),
//                   const SizedBox(width: 4),
//                   Text(FormatedDate.formateArabicDate(bookingDate, day: ''),
//                       style: getLightStyle(color: ColorManager.black)),
//                   const SizedBox(width: 12),
//                   const Icon(Icons.access_time, size: 14, color: Colors.grey),
//                   const SizedBox(width: 4),
//                   Text(FormatedDate.formateTime(bookingTime),
//                       style: getLightStyle(color: ColorManager.black)),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     ElevatedButton(
//                       style: ButtonStyle(
//                           shape: MaterialStatePropertyAll(
//                               RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(5))),
//                           backgroundColor: const MaterialStatePropertyAll(
//                               ColorManager.primary)),
//                       onPressed: onReschedule,
//                       // showReBooking(context,bookingId,clinicId,doctorId,bookingDate,bookingTime);
//                       // showModalBottomSheet(
//                       //   context: context,
//                       //   isScrollControlled: true,
//                       //   shape: const RoundedRectangleBorder(
//                       //     borderRadius:
//                       //         BorderRadius.vertical(top: Radius.circular(25)),
//                       //   ),
//                       //   builder: (_) => Padding(
//                       //     padding: EdgeInsets.only(
//                       //         bottom:
//                       //             MediaQuery.of(context).viewInsets.bottom),
//                       //     child: ReBooking(oldBookingId: bookingId),
//                       //   ),
//                       // );

//                       child: Text("إعادة الحجز",
//                           style: getRegularStyle(
//                               color: ColorManager.white, fontSize: 16)),
//                     ),
//                     const Spacer(),
//                     ElevatedButton(
//                       style: ButtonStyle(
//                           shape: MaterialStatePropertyAll(
//                               RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(5))),
//                           backgroundColor: const MaterialStatePropertyAll(
//                               ColorManager.white)),
//                       onPressed: () {
//                         showDialog(
//                             context: context,
//                             builder: (_) => Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Directionality(
//                                     textDirection: TextDirection.rtl,
//                                     child: AlertDialog(
//                                       backgroundColor: ColorManager.blue,
//                                       title: Center(
//                                         child: Text(
//                                           "تأكيد",
//                                           style: getSemiBoldStyle(
//                                               color: ColorManager.textColor),
//                                         ),
//                                       ),
//                                       content: Text(
//                                         "هل أنت متأكد من إلغاء الحجز؟",
//                                         style: getMediumStyle(
//                                             color: ColorManager.textColor,
//                                             fontSize: 16),
//                                       ),
//                                       actions: [
//                                         TextButton(
//                                           onPressed: () {
//                                             context
//                                                 .read<DeleteBookingCubit>()
//                                                 .deleteBooking(bookingId);
//                                             Navigator.pop(context);
//                                           },
//                                           child: Text("نعم",
//                                               style: getRegularStyle(
//                                                 color: ColorManager.primary,
//                                               )),
//                                         ),
//                                         TextButton(
//                                           onPressed: () =>
//                                               Navigator.pop(context),
//                                           child: Text("لا",
//                                               style: getRegularStyle(
//                                                   color: Colors.red)),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ));
//                       },
//                       child: Text("إلغاء الحجز",
//                           style:
//                               getRegularStyle(color: Colors.red, fontSize: 16)),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// //     return Card(
// //       color: ColorManager.white,
// //       surfaceTintColor: ColorManager.white,
// //       margin: const EdgeInsets.all(10),
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
// //       elevation: 3,
// //       child: Padding(
// //         padding: const EdgeInsets.all(10),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               children: [
// //                 CircleAvatar(
// //                   backgroundColor: Colors.transparent,
// //                   radius: 35,
// //                   backgroundImage: AssetImage(doctorImage),
// //                 ),
// //                 const SizedBox(
// //                   width: 10,
// //                 ),
// //                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //                   Text(
// //                     " د/ $doctorFirstName $doctorlastName",
// //                     style: getSemiBoldStyle(
// //                         color: ColorManager.black, fontSize: 18),
// //                   ),
// //                   Text(
// //                     clinicName,
// //                     style: getRegularStyle(color: ColorManager.grey),
// //                   ),
// //                 ])
// //               ],
// //             ),
// //             const SizedBox(
// //               height: 15,
// //             ),
// //             Row(
// //               children: [
// //                 Text(
// //                   FormatedDate.formateArabicDate(bookingDate, day: ""),
// //                   style: getLightStyle(color: ColorManager.black),
// //                 ),
// //                 const SizedBox(
// //                   width: 7,
// //                 ),
// //                 Text(
// //                   FormatedDate.formateTime(bookingTime),
// //                   style: getLightStyle(color: ColorManager.black),
// //                 )
// //               ],
// //             ),
// //             const SizedBox(
// //               height: 15,
// //             ),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               children: [
// //                 ElevatedButton(
// //                     onPressed: () {
// //                       showModalBottomSheet(
// //                           context: context,
// //                           isScrollControlled: true,
// //                           shape: RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(25)),
// //                           builder: (_) => Padding(
// //                                 padding: EdgeInsets.only(
// //                                     bottom: MediaQuery.of(context)
// //                                         .viewInsets
// //                                         .bottom),
// //                                 // child: ReBooking(oldBookingId: bookingId, initialClinicId: null,),
// //                               ));
// //                     },
// //                     style: ElevatedButton.styleFrom(
// //                       padding: const EdgeInsets.all(15),
// //                       backgroundColor: ColorManager.primary,
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(5),
// //                       ),
// //                     ),
// //                     child: Text(
// //                       "إعادة حجز",
// //                       style: getRegularStyle(color: ColorManager.white),
// //                     )),
// //                 OutlinedButton(
// //                   onPressed: () {
// //                     showDialog(
// //                         context: context,
// //                         builder: (_) => Directionality(
// //                               textDirection: TextDirection.rtl,
// //                               child: AlertDialog(
// //                                 backgroundColor: ColorManager.blue,
// //                                 title: Center(
// //                                   child: Text(
// //                                     "تأكيد",
// //                                     style: getMediumStyle(
// //                                         color: ColorManager.textColor),
// //                                   ),
// //                                 ),
// //                                 content: Text(
// //                                   'هل أنت متأكد من إلغاء الحجز؟',
// //                                   style: getMediumStyle(
// //                                       color: ColorManager.textColor),
// //                                 ),
// //                                 actions: [
// //                                   TextButton(
// //                                       onPressed: () {
// //                                         Navigator.of(context).pop();
// //                                       },
// //                                       child: Text(
// //                                         'لا',
// //                                         style: getRegularStyle(
// //                                             color: ColorManager.red),
// //                                       )),
// //                                   TextButton(
// //                                       onPressed: () {
// //                                         context
// //                                             .read<DeleteBookingCubit>()
// //                                             .deleteBooking(bookingId);
// //                                         Navigator.of(context).pop();
// //                                       },
// //                                       child: Text(
// //                                         "نعم",
// //                                         style: getRegularStyle(
// //                                             color: ColorManager.primary),
// //                                       ))
// //                                 ],
// //                               ),
// //                             ));
// //                   },
// //                   style: OutlinedButton.styleFrom(
// //                       padding: const EdgeInsets.all(12),
// //                       backgroundColor: ColorManager.white,
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(8),
// //                       )),
// //                   child: Text("إلغاء الحجز",
// //                       style: getRegularStyle(color: ColorManager.red)),
// //                   // )
// //                 )
// //               ],
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// // // );
// //   }
// //   // }

// //   void showReBooking(BuildContext context, int oldBookingId, int clinicId,
// //       String doctorId, String date, String time) {
// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         return MultiBlocProvider(
// //           providers: [
// //             BlocProvider.value(value: context.read<ClinicCubit>()),
// //             BlocProvider.value(value: context.read<DoctorsCubit>()),
// //             BlocProvider.value(value: context.read<AppointmentCubit>()),
// //             BlocProvider.value(value: context.read<BookingCubit>()),
// //             BlocProvider.value(value: context.read<DeleteBookingCubit>()),
// //           ],
// //           child: Directionality(
// //             textDirection: TextDirection.rtl,
// //             child: AlertDialog(
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(20),
// //               ),
// //               title: Center(
// //                 child: Text(
// //                   "إعادة الحجز",
// //                   style: getSemiBoldStyle(
// //                       color: ColorManager.primary, fontSize: 18),
// //                 ),
// //               ),
// //               content: ReBooking(
// //                 oldBookingId: oldBookingId,
// //                 initialClinicId: clinicId,
// //                 initialDate: date,
// //                 initialDoctorId: doctorId,
// //                 initialTime: time,
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
// // // *******************************************************************************************
// //   // void showReBookingDialog(BuildContext context) {
// //   //   showDialog(
// //   //     context: context,
// //   //     builder: (context) {
// //   //       return Directionality(
// //   //         textDirection: TextDirection.rtl,
// //   //         child: AlertDialog(
// //   //           shape:
// //   //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
// //   //           title: Center(
// //   //             child: Text(
// //   //               "إعادة الحجز",
// //   //               style: getSemiBoldStyle(color: ColorManager.textColor),
// //   //             ),
// //   //           ),
// //   //           content: Column(
// //   //             children: [
// //   //               ElevatedButton.icon(
// //   //                   onPressed: () {},
// //   //                   icon: const Icon(Icons.date_range),
// //   //                   label: Text("اختر التاريخ"))
// //   //             ],
// //   //           ),
// //   //         ),
// //   //       );
// //   //     },
// //   //   );
// //   // }
// // // }/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/formated.dart';
import 'package:graduation_project/core/utils/ui_utils.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_states.dart';
import 'package:graduation_project/features/user/booking/presentation/widgets/re_booking.dart';
import 'package:intl/intl.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_patient_response/booking_patient_model.dart';

class BookingCard extends StatelessWidget {
  final BookingPatientModel booking;
  final VoidCallback onReschedule;
  // final VoidCallback onCancel;
  final BookingStatus bookingStatus;
  // final bool isNotCompleted;
  const BookingCard({
    Key? key,
    required this.booking,
    required this.onReschedule,
    required this.bookingStatus,

    // required this.onCancel,
  }) : super(key: key);
  String getBookingStausText() {
    switch (bookingStatus) {
      case BookingStatus.completed:
        return 'تم الكشف ';
      case BookingStatus.notCompleted:
        return 'غير مكتملة';
      case BookingStatus.upComming:
        return 'محجوزة';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteBookingCubit, BookingStates>(
      listener: (context, state) {
        if (state is DeleteBookingSuccess) {
          UIUtils.showMessage(
              context, "تم إلغاء الحجز بنجاح", ColorManager.green);
          context.read<BookingPatientCubit>().getBookingPatient();
        } else if (state is GetBookingError) {
          UIUtils.showMessage(context, "حاول مرة أخرى", ColorManager.red);
        } else if (state is GetBookingLoading) {
          const CircularProgressIndicator(
            color: ColorManager.primary,
          );
        }
      },
      child: Container(
        // surfaceTintColor: ColorManager.white,

        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: ColorManager.white,
            border: Border.all(color: ColorManager.primary, width: .4),
            borderRadius: BorderRadius.circular(15)),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(15),
        // ),
        // elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorManager.primary),
                        borderRadius: BorderRadius.circular(50)),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: ColorManager.white,
                      backgroundImage: CachedNetworkImageProvider(
                        "${ApiConstants.imageBaseUrl}${booking.doctorImageUrl}",
                        errorListener: (p0) {
                          Image.asset("assets/images/doctor_image.png");
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "د. ${booking.doctorFirstName ?? ''} ${booking.doctorLastName ?? ''}",
                          style: getSemiBoldStyle(
                              fontSize: 18, color: ColorManager.textColor),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            booking.clinicName ?? '',
                            style: getRegularStyle(
                                fontSize: 16,
                                color:
                                    const Color.fromARGB(255, 113, 109, 109)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      // color: ColorManager.green,
                      border: Border.all(color: ColorManager.primary),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      getBookingStausText(),
                      style: getMediumStyle(
                          fontSize: 14, color: ColorManager.primary),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Divider(color: ColorManager.grey),
              const SizedBox(height: 12),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_today,
                          size: 18, color: ColorManager.grey),
                      const SizedBox(width: 5),
                      Text(
                        FormatedDate.formateArabicDay(booking.date ?? '',
                            day: booking.day),
                        // DateFormat.yMMMMd('ar')
                        //     .format(DateTime.parse("${booking.date}")),
                        style: getMediumStyle(
                            fontSize: 16, color: ColorManager.textColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.access_time,
                          size: 18, color: ColorManager.grey),
                      const SizedBox(width: 5),
                      Text(
                        FormatedDate.formateTime(booking.time ?? ''),
                        style: getMediumStyle(
                            fontSize: 16, color: ColorManager.textColor),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (bookingStatus == BookingStatus.upComming ||
                      bookingStatus == BookingStatus.notCompleted) ...[
                    bookingStatus == BookingStatus.notCompleted
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width * .8,
                            child: ElevatedButton(
                                onPressed: onReschedule,
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  backgroundColor: ColorManager.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: Text(
                                  "إعادة حجز",
                                  style: getRegularStyle(
                                      color: ColorManager.white),
                                )),
                          )
                        : ElevatedButton(
                            onPressed: onReschedule,
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              backgroundColor: ColorManager.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Text(
                              "إعادة حجز",
                              style: getRegularStyle(color: ColorManager.white),
                            )),
                  ],
                  const SizedBox(
                    width: 0,
                    height: 0,
                  ),
                  // const SizedBox(width: 20),
                  if (bookingStatus == BookingStatus.upComming) ...[
                    OutlinedButton(
                      onPressed: () => showDialog(
                          context: context,
                          builder: (_) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AlertDialog(
                                  backgroundColor: ColorManager.blue,
                                  title: Center(
                                    child: Text(
                                      "تأكيد",
                                      style: getSemiBoldStyle(
                                          color: ColorManager.textColor),
                                    ),
                                  ),
                                  content: Text(
                                    "هل أنت متأكد من إلغاء الحجز؟",
                                    style: getMediumStyle(
                                        color: ColorManager.textColor,
                                        fontSize: 16),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () async {
                                        context
                                            .read<DeleteBookingCubit>()
                                            .deleteBooking(booking.id ?? 0);
                                        Navigator.pop(context);
                                        // context
                                        //     .read<BookingPatientCubit>()
                                        //     .getBookingPatient(
                                        //         CacheConstants.tokenKey);
                                      },
                                      child: Text("نعم",
                                          style: getRegularStyle(
                                            color: ColorManager.primary,
                                          )),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("لا",
                                          style: getRegularStyle(
                                              color: Colors.red)),
                                    ),
                                  ],
                                ),
                              )),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: ColorManager.primary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("إلغاء الحجز",
                          style: TextStyle(color: ColorManager.primary)),
                    )
                  ],
                  if (bookingStatus == BookingStatus.completed) ...[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .8,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              Routes.patientMedicalRecord,
                              arguments: {booking.id});
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: ColorManager.primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text("تفاصيل الكشف",
                            style: TextStyle(color: ColorManager.primary)),
                      ),
                    )
                  ]
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum BookingStatus {
  completed,
  upComming,
  notCompleted,
}
