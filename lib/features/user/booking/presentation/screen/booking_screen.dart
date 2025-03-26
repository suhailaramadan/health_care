import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widgets/error_indicator.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/user/booking/domain/entities/booking_entity.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_states.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});
  static const booking = "/booking";

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  // // late BookingCubit _bookingCubit;
  // @override
  // void initState() {
  //   super.initState();
  //   // _bookingCubit = serviceLocator.get<BookingCubit>();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // value: serviceLocator.get<BookingCubit>()..getPatientBooking(),
      create: (context) =>
          serviceLocator.get<BookingCubit>()..getPatientBooking(),
      child: BlocBuilder<BookingCubit, BookingStates>(
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text("حجوزاتي"),
                    centerTitle: true,
                    bottom: TabBar(
                      tabs: const [
                        Tab(
                          text: "الحجوزات القادمة",
                        ),
                        Tab(
                          text: "الحجوزات السابقة",
                        )
                      ],
                      labelStyle: getMediumStyle(color: ColorManager.primary),
                      indicatorColor: ColorManager.primary,
                    ),
                  ),
                  body: state is GetBookingLoading
                      ? const LoadingIndicator()
                      : state is GetBookingError
                          ? ErrorIndicator(
                              message: state.message,
                            )
                          : state is GetBookingSuccess
                              ? TabBarView(children: [
                                  bookingList(
                                      state.bookingEntity
                                          .where(
                                              (element) => element.isUpcoming)
                                          .toList(),
                                      context),
                                  bookingList(
                                      state.bookingEntity
                                          .where(
                                              (element) => !element.isUpcoming)
                                          .toList(),
                                      context),
                                ])
                              : Center(
                                  child: Text(
                                    "لا توجد بيانات متاحة",
                                    style:
                                        getMediumStyle(color: ColorManager.red),
                                  ),
                                ),
                )),
          );
        },
      ),
    );
  }

  Widget bookingList(List<BookingEntity> bookings, BuildContext context) {
    if (bookings.isEmpty) {
      return Center(
        child: Text("لا يوجد حجوزات لديك",
            style: getMediumStyle(color: ColorManager.red)),
      );
    }
    // final List<Map<String, dynamic>> dummBooking = [
    //   {
    //     "clinic": "عيادة الأسنان",
    //     "doctor": "د./صطفى ",
    //     "date": "25-07-2005",
    //     "isCancelleable": true
    //   },
    //   {
    //     "clinic": "عيادة الأسنان",
    //     "doctor": "د./صطفى ",
    //     "date": "28-07-2005",
    //     "isCancelleable": false
    //   },
    //   // {
    //   //   "clinic": "عيادة الأسنان",
    //   //   "doctor": "د./صطفى ",
    //   //   "date": "29-07-2005",
    //   //   "isCancelleable": true
    //   // }
    // ];
    return ListView.builder(
      itemBuilder: (context, index) {
        final booking = bookings[index];
        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
              title: Text(booking.clinicName ?? ''),
              subtitle: Text(
                  "الطبيب ${booking.doctorFirstName} ${booking.doctorLastName} \n التاريخ ${booking.date}"),
              trailing: booking.isCancellable
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.cancel,
                        color: ColorManager.red,
                      ))
                  : null),
        );
      },
      itemCount: bookings.length,
    );
  }
}
