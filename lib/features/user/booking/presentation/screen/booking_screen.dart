import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/utils/formated.dart';
import 'package:graduation_project/core/widgets/error_indicator.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/auth/presentation/screens/login_screen.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:graduation_project/features/medical_record/presentation/cubit/medical_record_cubit.dart';
import 'package:graduation_project/features/medical_record/presentation/cubit/medical_record_states.dart';
import 'package:graduation_project/features/medical_record/presentation/widgets/medical_record_card.dart';
import 'package:graduation_project/features/notification/presentiation/cubit/notification_cubit.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_patient_response/booking_patient_model.dart';
import 'package:graduation_project/features/user/booking/domain/entities/booking_entity.dart';
import 'package:graduation_project/features/user/booking/domain/entities/booking_patient_entity.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_states.dart';
import 'package:graduation_project/features/user/booking/presentation/widgets/booking_card.dart';
import 'package:graduation_project/features/user/booking/presentation/widgets/re_booking.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart';
import 'package:intl/intl.dart';

class BookingTab extends StatefulWidget {
  static const booking = "/booking";
  const BookingTab({super.key});

  @override
  State<BookingTab> createState() => _BookingTabState();
}

class _BookingTabState extends State<BookingTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    context.read<BookingPatientCubit>().getBookingPatient();
    context.read<MedicalRecordCubit>().getPatientMedicalRecord();
  }

  void didPopNext() {
    context.read<BookingPatientCubit>().getBookingPatient();
    context.read<MedicalRecordCubit>().getPatientMedicalRecord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          title: Text(
            "حجوزاتي",
            style: getSemiBoldStyle(color: ColorManager.black),
          ),
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            labelStyle: getMediumStyle(color: ColorManager.primary),
            indicatorColor: ColorManager.primary,
            unselectedLabelStyle: getMediumStyle(color: ColorManager.textColor),

//
            tabs: const [
              Tab(text: 'القادمة'),
              Tab(text: "المكتملة"),
              Tab(text: "الغير مكتملة")
            ],
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<BookingPatientCubit>().getBookingPatient();
            context.read<MedicalRecordCubit>().getPatientMedicalRecord();
            await Future.delayed(const Duration(seconds: 1));
          },
          child: BlocBuilder<BookingPatientCubit, BookingStates>(
              builder: (context, bookingState) {
            return BlocBuilder<MedicalRecordCubit, MedicalResocrdSates>(
              builder: (context, recordState) {
                if (bookingState is GetBookingLoading ||
                    recordState is GetMedicalRecordLoading) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ));
                }
                //  else if (bookingState is GetBookingError || recordState is GetMedicalRecordError) {
                //   return Center(child: Text("حدث خطأ: ${state.message}"));
                else if (bookingState is GetBookingPatientSuccess &&
                    recordState is GetMedicalRecordPatientSuccess) {
                  // final data = state.bookingPatientResponse.data;
                  final bookings =
                      bookingState.bookingPatientResponse.data ?? [];

                  final records = recordState.medicalRecord;

                  bool datesMatch(String? bookingDate, String? recordDate) {
                    if (bookingDate == null || recordDate == null) return false;
                    final bDate = DateTime.tryParse(bookingDate);
                    final rDate = DateTime.tryParse(recordDate);
                    if (bDate == null || rDate == null) {
                      return false;
                    }
                    return bDate.year == rDate.year &&
                        bDate.month == rDate.month &&
                        bDate.day == rDate.day;
                  }

                  List<BookingPatientModel> upComingBookings =
                      bookings.where((e) {
                    // b.dateOfVisit == e.date);

                    return _isUpComing(e);
                  }).toList();
                  // if (data == null || data.isEmpty) {
                  //   return Center(
                  //       child: Text(
                  //     "لا توجد حجوزات",
                  //     style: getMediumStyle(color: ColorManager.textColor),
                  //   ));
                  // }
                  List<BookingPatientModel> completedBookings =
                      bookings.where((e) {
                    final hasRecord =
                        records.any((b) => b.dateOfVisit == e.date);
                    return hasRecord && !_isUpComing(e);
                  }).toList();
                  final upComingNotCompleted = bookings.where((e) {
                    bool hasRecord =
                        records.any((r) => datesMatch(e.date, r.dateOfVisit));

                    return !_isUpComing(e) && !hasRecord;
                  }).toList();
                  // List<BookingPatientModel> upcomingBookings =
                  //     data.where((booking) => _isUpComing(booking)).toList();
                  // List<BookingPatientModel> completedBookings =
                  //     data.where((booking) => !_isUpComing(booking)).toList();

                  return TabBarView(
                    controller: _tabController,
                    children: [
                      _buildBookingList(upComingBookings, "لا توجد حجوزات",
                          BookingStatus.upComming),
                      _buildBookingList(completedBookings,
                          "لا توجد حجوزات مكتملة", BookingStatus.completed),
                      _buildBookingList(
                          upComingNotCompleted,
                          "لا توجد حجوزات غير مكتملة",
                          BookingStatus.notCompleted)
                    ],
                  );
                }
                return const Center(child: Text("لم يتم تحميل البيانات"));
              },
            );
          }),
        ));
  }
  // if (state is GetBookingLoading) {
  //       return
  //        const Center(
  //           child: CircularProgressIndicator(
  //         color: ColorManager.primary,
  //       ));
  //     } else if (state is GetBookingError) {
  //       return Center(child: Text("حدث خطأ: ${state.message}"));
  //     } else if (state is GetBookingPatientSuccess) {
  //       final data = state.bookingPatientResponse.data;

  //       if (data == null || data.isEmpty) {
  //         return Center(
  //             child: Text(
  //           "لا توجد حجوزات",
  //           style: getMediumStyle(color: ColorManager.textColor),
  //         ));
  //       }

  //       List<BookingPatientModel> upcomingBookings =
  //           data.where((booking) => _isUpComing(booking)).toList();
  //       List<BookingPatientModel> completedBookings =
  //           data.where((booking) => !_isUpComing(booking)).toList();

  //       return TabBarView(
  //         controller: _tabController,
  //         children: [
  // _buildBookingList(upcomingBookings, "لا توجد حجوزات"),
  //           _buildBookingList(completedBookings, "لا توجد حجوزات مكتملة"),
  //         ],
  //       );
  //     }
  //     return const Center(child: Text("لم يتم تحميل البيانات"));
  //   },
  // ));
}
// }

// bool _isUpComing(String? date) {
//   if (date == null) return false;
//   DateTime bookingDate = DateTime.parse(date);
//   DateTime today = DateTime.now();
//   Duration difference = bookingDate.difference(today);
//   return difference.inHours >= 24;
//   // return bookingDate.compareTo(today) >= 0;
// }

// bool _isUpComing(BookingPatientModel booking) {
//   if (booking.date == null || booking.time == null) {
//     return false;
//   }
//   DateTime bookingDate = DateTime.parse(booking.date!);
//   DateTime now = DateTime.now();
//   DateTime today = DateTime(now.year, now.month, now.day);
//   List<String> timeParts = booking.time!.split(':');
//   int hour = int.parse(timeParts[0]);
//   int minute = int.parse(timeParts[1]);
//   DateTime bookingDateTime = DateTime(
//       bookingDate.year, bookingDate.month, bookingDate.day, hour, minute);
//   if (bookingDateTime.isAfter(now)) return true;
//   if (bookingDateTime.isAtSameMomentAs(now) ||
//       (bookingDateTime.isAfter(now) && bookingDateTime.isAtSameMomentAs(today)))
//     return true;
//   return false;
// }
bool _isUpComing(BookingPatientModel booking) {
  if (booking.date == null || booking.time == null) return false;

  final bookingDate = DateTime.tryParse(booking.date!);
  if (bookingDate == null) return false;

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  if (bookingDate.isAfter(today)) return true;

  if (bookingDate.year == now.year &&
      bookingDate.month == now.month &&
      bookingDate.day == now.day) {
    final timeParts = booking.time!.split(':');
    if (timeParts.length < 2) return false;

    final hour = int.tryParse(timeParts[0]) ?? 0;
    final minute = int.tryParse(timeParts[1]) ?? 0;

    final bookingDateTime = DateTime(
        bookingDate.year, bookingDate.month, bookingDate.day, hour, minute);

    return bookingDateTime.isAfter(now);
  }

  return false;
}

Widget _buildBookingList(List<BookingPatientModel> bookings,
    String emptyMessage, BookingStatus bookingStatus) {
  if (bookings.isEmpty) {
    return Center(
        child: Text(emptyMessage,
            style: getSemiBoldStyle(color: ColorManager.kuhly)));
  }

  return ListView.builder(
    itemCount: bookings.length,
    itemBuilder: (context, index) {
      final booking = bookings[index];
      return BookingCard(
        booking: booking,
        bookingStatus: bookingStatus,
        // isComplete: _isUpComing(booking) ? false : true,
        // isNotCompleted: true,
        onReschedule: bookingStatus == BookingStatus.notCompleted ||
                bookingStatus == BookingStatus.upComming
            //  _isUpComing(booking)
            ? () {
                showReBooking(context, booking.id ?? 0, booking);
              }
            : () {},
      );
    },
  );
}

//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);

//     context
//         .read<BookingPatientCubit>()
//         .getBookingPatient(CacheConstants.tokenKey);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return
//         // selectedRole == 'User'
//         //     ?
//         Scaffold(
//       backgroundColor: ColorManager.blue,
//       appBar: AppBar(
//         toolbarHeight: 70,
//         backgroundColor: ColorManager.white,
//         title: Text(
//           "حجوزاتي",
//           style: getSemiBoldStyle(color: ColorManager.black),
//         ),
//         centerTitle: true,
//         bottom: TabBar(
//           controller: _tabController,
//           labelStyle: getMediumStyle(color: ColorManager.primary),
//           indicatorColor: ColorManager.primary,
//           unselectedLabelStyle: getMediumStyle(color: ColorManager.textColor),
//           tabs: const [
//             Tab(
//               text: 'القادمة',
//             ),
//             Tab(text: "المكتملة"),
//           ],
//         ),
//       ),
//       body: BlocBuilder<BookingPatientCubit, BookingStates>(
//         builder: (context, state) {
//           if (state is GetBookingLoading) {
//             return const Center(child: LoadingIndicator());
//           } else if (state is GetBookingError) {
//             return Center(child: ErrorIndicator(message: state.message));
//           } else if (state is GetBookingPatientSuccess) {
//             const SizedBox(
//               height: 15,
//             );
//             final data = state.bookingPatientResponse.data;
//             if (data == null || data.isEmpty) {
//               return const Center(
//                 child: Text("لا توجد حجوزات"),
//               );
//             }
//             List<BookingPatientModel> upcomingBookings =
//                 data.where((booking) => _isUpComing(booking.date)).toList()
//                   ..sort((a, b) {
//                     if (a.date == null || b.date == null) {
//                       return 0;
//                     }
//                     DateTime dateA = DateFormat('yyyy-MM-dd').parse(a.date!);
//                     DateTime dateB = DateFormat('yyyy-MM-dd').parse(b.date!);
//                     return dateA.compareTo(dateB);
//                   });
//             List<BookingPatientModel> completedBookings =
//                 data.where((booking) => !_isUpComing(booking.date)).toList()
//                   ..sort((a, b) {
//                     DateTime dateA = DateFormat('yyyy-MM-dd').parse(a.date!);
//                     DateTime dateB = DateFormat('yyyy-MM-dd').parse(b.date!);
//                     return dateB.compareTo(dateA);
//                   });

//             return TabBarView(
//               controller: _tabController,
//               children: [
//                 _buildBookingList(upcomingBookings, "لا توجد حجوزات"),
//                 _buildBookingList(completedBookings, "لا توجد حجوزات مكتملة"),
//               ],
//             );
//           }
//           return const Center(child: Text("لم يتم تحميل البيانات"));
//         },
//       ),
//       // )
//       // : const Scaffold(
//       //     body: Center(child: Text("المواعيد المسجلة")),
//     );
//   }

//   bool _isUpComing(String? date) {
//     if (date == null) return false;
//     DateTime bookingDate = DateFormat('yyyy-MM-dd').parse(date);
//     DateTime today = DateTime.now();
//     return bookingDate.isAfter(today.subtract(const Duration(days: 1)));
//   }

//   Widget _buildBookingList(
//       List<BookingPatientModel> bookings, String emptyMessage) {
//     if (bookings.isEmpty) {
//       return Center(
//           child: Text(emptyMessage, style: const TextStyle(fontSize: 16)));
//     }

//     return BlocListener<DeleteBookingCubit, BookingStates>(
//         listener: (context, state) {
//           if (state is GetBookingError) {
//             print("error message : ${state.message}");
//           }
//           if (state is DeleteBookingSuccess) {
//             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//               duration: Duration(seconds: 2),
//               content: Text("تم إلغاء الحجز بنجاح"),
//               backgroundColor: Colors.green,
//             ));
//             context.read<NotificationCubit>().getNotification();
//             context
//                 .read<BookingPatientCubit>()
//                 .getBookingPatient(CacheConstants.tokenKey);
//             print("قايمة الحجوزااااااااات");
//           } else if (state is GetBookingError) {
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text(
//                 state.message,
//               ),
//               backgroundColor: ColorManager.red,
//             ));
//           }
//         },
//         child: ListView.builder(
//           itemCount: bookings.length,
//           itemBuilder: (context, index) {
//             final booking = bookings[index];
//             return BookingCard(
//               booking: BookingPatientModel(
//                   id: booking.id ?? 0,
//                   clinicName: booking.clinicName ?? '',
//                   date: booking.date ?? '',
//                   doctorFirstName: booking.doctorFirstName ?? '',
//                   doctorId: booking.doctorId ?? '',
//                   doctorLastName: booking.doctorLastName ?? '',
//                   patientId: booking.patientId ?? '',
//                   time: booking.time ?? ''),
//               // clinicName: booking.clinicName ?? '',
//               // doctorImage: "assets/images/doctor_image.png",
//               // bookingDate: booking.date ?? "",
//               // bookingTime: booking.time ?? "",
//               // bookingId: booking.id ?? 0,
//               onReschedule: () {
//                 showReBooking(context, booking.id ?? 0, booking.doctorId ?? '',
//                     booking.id ?? 0, booking.date ?? '', booking.time ?? '');
//               },
//               // doctorFirstName: booking.doctorFirstName ?? "",
//               // doctorlastName: booking.doctorLastName ?? '',
//               // doctorId: booking.doctorId ?? '',
//               // clinicId: booking.id ?? 0,
//               onCancel: () {},
//             );

//             // return Card(
//             //   margin: EdgeInsets.all(10),
//             //   elevation: 3,
//             //   child: ListTile(
//             //     title: Text(
//             //         "دكتور ${booking.doctorFirstName} ${booking.doctorLastName}"),
//             //     subtitle: Text(
//             //         "التاريخ: ${FormatedDate.formateArabicDate(booking.date ?? '', day: '')} - الوقت: ${FormatedDate.formateTime(booking.time ?? '')}"),
//             //     trailing: Icon(
//             //       _isUpComing(booking.date) ? Icons.schedule : Icons.check_circle,
//             //       color: _isUpComing(booking.date) ? Colors.orange : Colors.green,
//             //     ),
//             //   ),
//             // );
//           },
//         ));
//   }

void showReBooking(
    BuildContext context, int oldBookingId, BookingPatientModel booking) {
  showDialog(
    context: context,
    builder: (context) {
      return
          //  MultiBlocProvider(
          //   providers: [
          //     BlocProvider.value(value: context.read<ClinicCubit>()),
          //     BlocProvider.value(value: context.read<DoctorsCubit>()),
          //     BlocProvider.value(value: context.read<AppointmentCubit>()),
          //     BlocProvider.value(value: context.read<BookingCubit>()),
          //     BlocProvider.value(value: context.read<DeleteBookingCubit>()),
          //   ],
          // child:
          AlertDialog(
        surfaceTintColor: ColorManager.white,
        backgroundColor: ColorManager.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Center(
          child: Text(
            "إعادة الحجز",
            style: getBoldStyle(color: ColorManager.primary, fontSize: 18),
          ),
        ),
        content: ReBooking(
          oldBookingId: oldBookingId,
          booking: booking,
          // initialDate: booking.date??'',
          // initialDoctorId: booking.doctorId??'',
          // initialTime: booking.time??'',
          // initialClinicId: booking.id??0,
          // clinicName: booking.clinicName??'',
          // lastName: booking.doctorLastName??'',
          // firstName: booking.doctorFirstName??'',
        ),
        // ),
      );
    },
  );
}
// }

// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:graduation_project/core/constants.dart';
// // import 'package:graduation_project/core/resources/color_manager.dart';
// // import 'package:graduation_project/core/resources/styles_manager.dart';
// // import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart';
// // import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_patient_response/booking_patient_model.dart';
// // import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart';
// // import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart';
// // import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart';
// // import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_states.dart';
// // import 'package:graduation_project/features/user/booking/presentation/widgets/booking_card.dart';
// // import 'package:graduation_project/features/user/booking/presentation/widgets/re_booking.dart';
// // import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart';

// // import 'package:intl/intl.dart';

// // class BookingTab extends StatefulWidget {
// //   // final String patientId;
// //   static const booking = "/booking";
// //   const BookingTab({
// //     Key? key,
// //   }) : super(key: key);

// //   @override
// //   State<BookingTab> createState() => _BookingTabState();
// // }

// // class _BookingTabState extends State<BookingTab> {
// //   void initState() {
// //     super.initState();
// //     context
// //         .read<BookingPatientCubit>()
// //         .getBookingPatient(CacheConstants.tokenKey);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('مواعيدي'),
// //       ),
// //       body: BlocListener<BookingCubit, BookingStates>(
// //         listener: (context, state) {
// //           if (state is GetBookingSuccess) {
// //             ScaffoldMessenger.of(context).showSnackBar(
// //               const SnackBar(content: Text('تم إلغاء الميعاد بنجاح')),
// //             );
// //             context
// //                 .read<BookingPatientCubit>()
// //                 .getBookingPatient(CacheConstants.tokenKey);
// //           } else if (state is GetBookingError) {
// //             ScaffoldMessenger.of(context).showSnackBar(
// //               SnackBar(content: Text(state.message)),
// //             );
// //           }
// //         },
// //         child: BlocBuilder<BookingPatientCubit, BookingStates>(
// //           builder: (context, state) {
// //             if (state is GetBookingLoading) {
// //               return const Center(child: CircularProgressIndicator());
// //             } else if (state is GetBookingPatientSuccess) {
// //               return ListView.builder(
// //                 itemCount: state.bookingPatientResponse.data!.length,
// //                 itemBuilder: (context, index) {
// //                   final booking = state.bookingPatientResponse.data![index];
// //                   return BookingCard(
// //                     bookingDate: booking.date ?? '',
// //                     bookingId: booking.id ?? 0,
// //                     bookingTime: booking.time ?? '',
// //                     clinicName: booking.clinicName ?? '',
// //                     doctorFirstName: booking.doctorFirstName ?? '',
// //                     doctorImage: "",
// //                     doctorlastName: booking.doctorLastName ?? '',
// //                     onReschedule: () {
// //                       showReBooking(
// //                           context,
// //                           booking.id ?? 0,
// //                           booking.doctorId ?? '',
// //                           booking.id ?? 0,
// //                           booking.date ?? '',
// //                           booking.time ?? '');
// //                     },
// //                     clinicId: booking.id ?? 0,
// //                     doctorId: booking.doctorId ?? '',
// //                   );
// //                 },
// //               );
// //               // } else if (state is PatientB) {
// //               //   return const Center(child: Text('لا توجد حجوزات حالياً'));
// //             } else if (state is GetBookingError) {
// //               return Center(child: Text('خطأ: ${state.message}'));
// //             } else {
// //               return const SizedBox.shrink();
// //             }
// //           },
// //         ),
// //       ),
// //     );
// //   }

// //   void showReBooking(BuildContext context, int oldBookingId, String doctorId,
// //       int clinicId, String date, String time) {
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
// //           child: AlertDialog(
// //             shape: RoundedRectangleBorder(
// //               borderRadius: BorderRadius.circular(20),
// //             ),
// //             title: Center(
// //               child: Text(
// //                 "إعادة الحجز",
// //                 style:
// //                     getSemiBoldStyle(color: ColorManager.primary, fontSize: 18),
// //               ),
// //             ),
// //             content: ReBooking(
// //               oldBookingId: oldBookingId,
// //               initialDate: date,
// //               initialDoctorId: doctorId,
// //               initialTime: time,
// //               initialClinicId: clinicId,
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// // // class BookingCard extends StatelessWidget {
// // //   final BookingPatientModel booking;
// // //   const BookingCard({Key? key, required this.booking}) : super(key: key);
// // //   bool isPastAppointment(String date) {
// // //     final parsedDate = DateFormat('yyyy-MM-dd').parse(date);
// // //     return parsedDate.isBefore(DateTime.now());
// // //   }

// //   // @override
// //   // Widget build(BuildContext context) {
// //   //   return Card(
// //   //     margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
// //   //     child: Padding(
// //   //       padding: const EdgeInsets.all(16.0),
// //   //       child: Column(
// //   //         crossAxisAlignment: CrossAxisAlignment.start,
// //   //         children: [
// //   //           Row(
// //   //             children: [
// //   //               // CircleAvatar(
// //   //               //   backgroundImage: NetworkImage(booking.),
// //   //               //   radius: 25,
// //   //               // ),
// //   //               const SizedBox(width: 10),
// //   //               Column(
// //   //                 crossAxisAlignment: CrossAxisAlignment.start,
// //   //                 children: [
// //   //                   Text(
// //   //                     'دكتور ${booking.doctorFirstName} ${booking.doctorLastName}',
// //   //                     style: const TextStyle(
// //   //                       fontSize: 16,
// //   //                       fontWeight: FontWeight.bold,
// //   //                     ),
// //   //                   ),
// //   //                   Text(
// //   //                     booking.clinicName ?? '',
// //   //                     style: const TextStyle(fontSize: 14, color: Colors.grey),
// //   //                   ),
// //   //                 ],
// //   //               ),
// //   //             ],
// //   //           ),
// //   //           const SizedBox(height: 10),
// //   //           Text(
// //   //             'التاريخ: ${booking.date}',
// //   //             style: const TextStyle(fontSize: 14),
// //   //           ),
// //   //           Text(
// //   //             'الوقت: ${booking.time}',
// //   //             style: const TextStyle(fontSize: 14),
// //   //           ),
// //   //           const SizedBox(height: 10),
// //   //           Row(
// //   //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //   //             children: [
// //   //               BlocBuilder<BookingCubit, BookingStates>(
// //   //                 builder: (context, state) {
// //   //                   return ElevatedButton(
// //   //                     onPressed: isPastAppointment(booking.date!) ||
// //   //                             state is GetBookingLoading
// //   //                         ? null
// //   //                         : () {
// //   //                             context.read().cancelBooking(booking.id);
// //   //                           },
// //   //                     child: state is GetBookingLoading
// //   //                         ? const CircularProgressIndicator()
// //   //                         : const Text('إلغاء الميعاد'),
// //   //                   );
// //   //                 },
// //   //               ),
// //   //               Text(
// //   //                 isPastAppointment(booking.date!)
// //   //                     ? 'تم الكشف'
// //   //                     : 'لم يتم الكشف',
// //   //                 style: TextStyle(
// //   //                   color: isPastAppointment(booking.date!)
// //   //                       ? Colors.green
// //   //                       : Colors.orange,
// //   //                   fontWeight: FontWeight.bold,
// //   //                 ),
// //   //               ),
// //   //             ],
// //   //           ),
// //   //         ],
// //   //       ),
// //   //     ),
// //   //   );
// //   // }
// // // }
// // //
