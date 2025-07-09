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
