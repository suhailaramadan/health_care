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
    print("رجعنا لشاشة الحجوزات");
    context.read<BookingPatientCubit>().getBookingPatient();
    context.read<MedicalRecordCubit>().getPatientMedicalRecord();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    route?.addScopedWillPopCallback(() {
      didPopNext();
      return Future.value(true);
    });
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
                if (bookingState is GetBookingPatientSuccess &&
                    recordState is GetMedicalRecordPatientSuccess) {
                  final bookingCubit = context.read<BookingPatientCubit>();
                  final recordCubit = context.read<MedicalRecordCubit>();
                  final records = recordCubit.allRecords;

                  final upcoming = bookingCubit.getUpcomingBookings();
                  final completed = bookingCubit.getCompletedBookings(records);
                  final notCompleted =
                      bookingCubit.getNotCompletedBookings(records);

                  return TabBarView(
                    controller: _tabController,
                    children: [
                      _buildBookingList(
                          upcoming, "لا توجد حجوزات", BookingStatus.upComming),
                      _buildBookingList(completed, "لا توجد حجوزات مكتملة",
                          BookingStatus.completed),
                      _buildBookingList(
                          notCompleted,
                          "لا توجد حجوزات غير مكتملة",
                          BookingStatus.notCompleted),
                    ],
                  );
                }

                return const Center(child: Text("لم يتم تحميل البيانات"));
              },
            );
          }),
        ));
  }
}

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
        ),
        // ),
      );
    },
  );
}
