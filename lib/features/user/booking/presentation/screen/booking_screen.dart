// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/core/di/service_locator.dart';
// import 'package:graduation_project/core/resources/color_manager.dart';
// import 'package:graduation_project/core/resources/styles_manager.dart';
// import 'package:graduation_project/core/widgets/error_indicator.dart';
// import 'package:graduation_project/core/widgets/loading_indicator.dart';
// import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_patient_response/booking_patient_response.dart';
// import 'package:graduation_project/features/user/booking/domain/entities/booking_entity.dart';
// import 'package:graduation_project/features/user/booking/domain/entities/booking_patient_entity.dart';
// import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart';
// import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart';
// import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_states.dart';

// class BookingScreen extends StatefulWidget {
//   const BookingScreen({super.key});
//   static const booking = "/booking";

//   @override
//   State<BookingScreen> createState() => _BookingScreenState();
// }

// class _BookingScreenState extends State<BookingScreen> {
//   // // late BookingCubit _bookingCubit;
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   // _bookingCubit = serviceLocator.get<BookingCubit>();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       // value: serviceLocator.get<BookingCubit>()..getPatientBooking(),
//       create: (context) =>
//           serviceLocator.get<BookingPatientCubit>(),
//       child: BlocBuilder<BookingCubit, BookingStates>(
//         builder: (context, state) {
//           return Directionality(
//             textDirection: TextDirection.rtl,
//             child: DefaultTabController(
//                 length: 2,
//                 child: Scaffold(
//                   appBar: AppBar(
//                     title: const Text("حجوزاتي"),
//                     centerTitle: true,
//                     bottom: TabBar(
//                       tabs: const [
//                         Tab(
//                           text: "الحجوزات القادمة",
//                         ),
//                         Tab(
//                           text: "الحجوزات السابقة",
//                         )
//                       ],
//                       labelStyle: getMediumStyle(color: ColorManager.primary),
//                       indicatorColor: ColorManager.primary,
//                     ),
//                   ),
//                   body: state is GetBookingLoading
//                       ? const LoadingIndicator()
//                       : state is GetBookingError
//                           ? ErrorIndicator(
//                               message: state.message,
//                             )
//                           : state is GetBookingPatientSuccess
//                               ? TabBarView(children: [
//                                   bookingList(
//                                       state.bookingPatientResponse
//                                           .where(
//                                               (element) => element.isUpcoming)
//                                           .toList(),
//                                       context),
//                                   bookingList(
//                                       state.bookingPatientResponse
//                                           .where(
//                                               (element) => !element.isUpcoming)
//                                           .toList(),
//                                       context),
//                                 ])
//                               : Center(
//                                   child: Text(
//                                     "لا توجد بيانات متاحة",
//                                     style:
//                                         getMediumStyle(color: ColorManager.red),
//                                   ),
//                                 ),
//                 )),
//           );
//         },
//       ),
//     );
//   }

//   Widget bookingList(BookingPatientResponse bookings, BuildContext context) {
//     if (bookings.succe) {
//       return Center(
//         child: Text("لا يوجد حجوزات لديك",
//             style: getMediumStyle(color: ColorManager.red)),
//       );
//     }
//     // final List<Map<String, dynamic>> dummBooking = [
//     //   {
//     //     "clinic": "عيادة الأسنان",
//     //     "doctor": "د./صطفى ",
//     //     "date": "25-07-2005",
//     //     "isCancelleable": true
//     //   },
//     //   {
//     //     "clinic": "عيادة الأسنان",
//     //     "doctor": "د./صطفى ",
//     //     "date": "28-07-2005",
//     //     "isCancelleable": false
//     //   },
//     //   // {
//     //   //   "clinic": "عيادة الأسنان",
//     //   //   "doctor": "د./صطفى ",
//     //   //   "date": "29-07-2005",
//     //   //   "isCancelleable": true
//     //   // }
//     // ];
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         final booking = bookings[index];
//         return Card(
//           margin: const EdgeInsets.all(10),
//           child: ListTile(
//               title: Text(booking.clinicName ?? ''),
//               subtitle: Text(
//                   "الطبيب ${booking.doctorFirstName} ${booking.doctorLastName} \n التاريخ ${booking.date}"),
//               trailing: booking.isCancellable
//                   ? IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.cancel,
//                         color: ColorManager.red,
//                       ))
//                   : null),
//         );
//       },
//       itemCount: bookings.length,
//     );
//   }
// }
//////////////////////////////////////////////////////////////////////

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/utils/formated_date_time.dart';
import 'package:graduation_project/core/widgets/error_indicator.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_patient_response/booking_patient_model.dart';
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
    _tabController = TabController(length: 2, vsync: this);

    context
        .read<BookingPatientCubit>()
        .getBookingPatient(CacheConstants.tokenKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.blue,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: ColorManager.white,
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
          tabs: const [
            Tab(
              text: 'القادمة',
            ),
            Tab(text: "المكتملة"),
          ],
        ),
      ),
      body: BlocBuilder<BookingPatientCubit, BookingStates>(
        builder: (context, state) {
          if (state is GetBookingLoading) {
            return const Center(child: LoadingIndicator());
          } else if (state is GetBookingError) {
            return Center(child: ErrorIndicator(message: state.message));
          } else if (state is GetBookingPatientSuccess) {
            const SizedBox(
              height: 15,
            );
            final data = state.bookingPatientResponse.data;
            if (data == null || data.isEmpty) {
              return const Center(
                child: Text("لا توجد حجوزات"),
              );
            }
            List<BookingPatientModel> upcomingBookings =
                data.where((booking) => _isUpComing(booking.date)).toList()
                  ..sort((a, b) {
                    if (a.date == null || b.date == null) {
                      return 0;
                    }
                    DateTime dateA = DateFormat('yyyy-MM-dd').parse(a.date!);
                    DateTime dateB = DateFormat('yyyy-MM-dd').parse(b.date!);
                    return dateA.compareTo(dateB);
                  });
            List<BookingPatientModel> completedBookings =
                data.where((booking) => !_isUpComing(booking.date)).toList()
                  ..sort((a, b) {
                    DateTime dateA = DateFormat('yyyy-MM-dd').parse(a.date!);
                    DateTime dateB = DateFormat('yyyy-MM-dd').parse(b.date!);
                    return dateB.compareTo(dateA);
                  });

            return TabBarView(
              controller: _tabController,
              children: [
                _buildBookingList(upcomingBookings, "لا توجد حجوزات"),
                _buildBookingList(completedBookings, "لا توجد حجوزات مكتملة"),
              ],
            );
          }
          return const Center(child: Text("لم يتم تحميل البيانات"));
        },
      ),
    );
  }

  bool _isUpComing(String? date) {
    if (date == null) return false;
    DateTime bookingDate = DateFormat('yyyy-MM-dd').parse(date);
    DateTime today = DateTime.now();
    return bookingDate.isAfter(today.subtract(const Duration(days: 1)));
  }

  Widget _buildBookingList(
      List<BookingPatientModel> bookings, String emptyMessage) {
    if (bookings.isEmpty) {
      return Center(
          child: Text(emptyMessage, style: const TextStyle(fontSize: 16)));
    }

    return BlocListener<DeleteBookingCubit, BookingStates>(
        listener: (context, state) {
          if (state is DeleteBookingSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              duration: Duration(seconds: 2),
              content: Text("تم إلغاء الحجز بنجاح"),
              backgroundColor: Colors.green,
            ));
            context
                .read<BookingPatientCubit>()
                .getBookingPatient(CacheConstants.tokenKey);
          } else if (state is GetBookingError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.message,
              ),
              backgroundColor: ColorManager.red,
            ));
          }
        },
        child: ListView.builder(
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            final booking = bookings[index];
            return BookingCard(
              clinicName: booking.clinicName ?? '',
              doctorImage: "assets/images/doctor_image.png",
              bookingDate: booking.date ?? "",
              bookingTime: booking.time ?? "",
              bookingId: booking.id ?? 0,
              onReschedule: () {
                showReBooking(context, booking.id ?? 0, booking.doctorId ?? '',
                    booking.id ?? 0, booking.date ?? '', booking.time ?? '');
              },
              doctorFirstName: booking.doctorFirstName ?? "",
              doctorlastName: booking.doctorLastName ?? '',
              doctorId: booking.doctorId ?? '',
              clinicId: booking.id ?? 0,
            );

            // return Card(
            //   margin: EdgeInsets.all(10),
            //   elevation: 3,
            //   child: ListTile(
            //     title: Text(
            //         "دكتور ${booking.doctorFirstName} ${booking.doctorLastName}"),
            //     subtitle: Text(
            //         "التاريخ: ${FormatedDate.formateArabicDate(booking.date ?? '', day: '')} - الوقت: ${FormatedDate.formateTime(booking.time ?? '')}"),
            //     trailing: Icon(
            //       _isUpComing(booking.date) ? Icons.schedule : Icons.check_circle,
            //       color: _isUpComing(booking.date) ? Colors.orange : Colors.green,
            //     ),
            //   ),
            // );
          },
        ));
  }

  void showReBooking(BuildContext context, int oldBookingId, String doctorId,
      int clinicId, String date, String time) {
    showDialog(
      context: context,
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: context.read<ClinicCubit>()),
            BlocProvider.value(value: context.read<DoctorsCubit>()),
            BlocProvider.value(value: context.read<AppointmentCubit>()),
            BlocProvider.value(value: context.read<BookingCubit>()),
            BlocProvider.value(value: context.read<DeleteBookingCubit>()),
          ],
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Center(
              child: Text(
                "إعادة الحجز",
                style:
                    getSemiBoldStyle(color: ColorManager.primary, fontSize: 18),
              ),
            ),
            content: ReBooking(
              oldBookingId: oldBookingId,
              initialDate: date,
              initialDoctorId: doctorId,
              initialTime: time,
              initialClinicId: clinicId,
            ),
          ),
        );
      },
    );
  }
}
