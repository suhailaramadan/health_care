import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/formated.dart';
import 'package:graduation_project/core/utils/ui_utils.dart';
import 'package:graduation_project/core/widgets/error_indicator.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/doctor/presentation/widgets/appointment_list.dart';
import 'package:graduation_project/features/doctors/presentation/widgets/appointment_item.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/doctor_appointments_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_doctor_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorAppointmentsScreen extends StatefulWidget {
  static const doctorAppointments = '/doctorAppointments';
  const DoctorAppointmentsScreen({super.key});

  @override
  State<DoctorAppointmentsScreen> createState() =>
      _DoctorAppointmentsScreenState();
}

class _DoctorAppointmentsScreenState extends State<DoctorAppointmentsScreen> {
  String? selectedDate;

// final prefs =  SharedPreferences.getInstance();
//     final doctorId = prefs.getString(CacheConstants.doctorId);
//     final token = prefs.getString(CacheConstants.tokenKey);
  @override
  void initState() {
    super.initState();
    _loadDoctorData();
    //   context
    //       .read<AppointmentCubit>()
    //       .getAppointmentDoctorById(CacheConstants.doctorId);
    //   context
    //       .read<BookingDoctorCubit>()
    //       .getBookingDoctor(CacheConstants.tokenKey);
  }

  Future<void> _loadDoctorData() async {
    final prefs = await SharedPreferences.getInstance();
    final doctorId = prefs.getString(CacheConstants.doctorId);
    final token = prefs.getString(CacheConstants.tokenKey);
    if (doctorId != null || token != null) {
      context
          .read<AppointmentCubit>()
          .getAppointmentDoctorById(CacheConstants.doctorId);
      context
          .read<BookingDoctorCubit>()
          .getBookingDoctor(CacheConstants.tokenKey);
    }
  }

  void _updateSelectedAppointment(String? day, String? time) {
    setState(() {
      selectedDate = day;
    });
  }

  final Map<String, int> daysMap = {
    'الأحد': 0,
    'الإثنين': 1,
    'الثلاثاء': 2,
    'الأربعاء': 3,
    'الخميس': 4,
    'الجمعة': 5,
    'السبت': 6
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "مواعيدي",
            style: getSemiBoldStyle(color: ColorManager.textColor),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            BlocBuilder<AppointmentCubit, AppointmentStates>(
              builder: (context, state) {
                if (state is GetAppointmentLoading) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ));
                } else if (state is GetAppointmentSuccess) {
                  final slots = state.appointmentEntity;
                  if (selectedDate == null && slots.isNotEmpty) {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      setState(() {
                        selectedDate = slots.first.date;
                      });
                    });
                  }
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: slots.map((slot) {
                        final isSelected = selectedDate == slot.date;

                        return FilterChip(
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 4),
                          checkmarkColor: ColorManager.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                  width: .4, color: ColorManager.primary)),
                          labelStyle:
                              getRegularStyle(color: ColorManager.textColor),
                          backgroundColor: ColorManager.transparent,
                          selectedColor: ColorManager.blue,
                          label: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                slot.day,
                              ),
                              Text(
                                FormatedDate.formateArabicDate(slot.date,
                                    day: ''),
                              ),
                            ],
                          ),
                          selected: isSelected,
                          onSelected: (_) {
                            setState(() {
                              selectedDate = slot.date;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  );
                } else {
                  return const Center(child: Text("حدث خطأ"));
                }
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<BookingDoctorCubit, BookingStates>(
                  builder: (context, state) {
                if (state is GetBookingLoading) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ));
                } else if (state is GetBookingDoctorSuccess) {
                  final filtered = selectedDate == null
                      ? []
                      : state.bookingDoctorResponse
                          .where((b) => b.date == selectedDate)
                          .toList();

                  // if (filtered.isEmpty) {
                  //   return Center(
                  //       child: Text(
                  //     "لا توجد حجوزات لهذا اليوم",
                  //     style: getMediumStyle(color: ColorManager.red),
                  //   ));
                  // } else {
                  return Container(
                    decoration: BoxDecoration(
                        color: ColorManager.blue,
                        border: const Border(
                            left: BorderSide(color: ColorManager.grey),
                            right: BorderSide(color: ColorManager.grey),
                            top: BorderSide(color: ColorManager.grey)),
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: ColorManager.primary,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "قائمة حجوزات اليوم",
                              style: getSemiBoldStyle(
                                  color: ColorManager.textColor),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        filtered.isEmpty
                            ? Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "لا توجد حجوزات لهذا اليوم",
                                    style: getMediumStyle(
                                        color: ColorManager.textColor),
                                  ),
                                ],
                              )
                            : Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                    color: ColorManager.primary,
                                    borderRadius: BorderRadius.circular(8)),
                                height: 60,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("اسم الطالب ",
                                        style: getSemiBoldStyle(
                                            color: ColorManager.white)),
                                    Text('الميعاد',
                                        style: getSemiBoldStyle(
                                            color: ColorManager.white)),
                                    Text("الاجراءات",
                                        style: getSemiBoldStyle(
                                            color: ColorManager.white)),
                                  ],
                                ),
                              ),
                        Expanded(
                          child: ListView.separated(
                            itemCount: filtered.length,
                            separatorBuilder: (_, __) => const Divider(),
                            itemBuilder: (context, index) {
                              final booking = filtered[index];
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        booking.patientImageUrl != null
                                            ? CircleAvatar(
                                                radius: 20,
                                                backgroundImage: NetworkImage(
                                                    "${ApiConstants.imageBaseUrl}${booking.patientImageUrl}"))
                                            : const CircleAvatar(
                                                child: Icon(Icons.person)),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "${booking.patientFirstName} ${booking.patientLastName}",
                                          style: getMediumStyle(
                                              color: ColorManager.textColor),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      FormatedDate.formateTime(booking.time),
                                      style: getMediumStyle(
                                          color: ColorManager.textColor),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(
                                            Routes.medicalRecord,
                                            arguments: booking);
                                      },
                                      child: Text(
                                        "السجل الطبي",
                                        style: getMediumStyle(
                                            color: ColorManager.primary),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                      // ),
                    ),
                  );
                } else if (state is GetBookingError) {
                  return const SizedBox();
                } else {
                  return Text(
                    "حدث خطأ في تحميل الحجوزات",
                    style: getMediumStyle(color: ColorManager.red),
                  );
                }
                // }
                // // else {
                //   return Center(
                //       child: Text(
                //     "حدث خطأ في تحميل الحجوزات",
                //     style: getMediumStyle(color: ColorManager.red),
                //   ));
              }
                  // },
                  ),
            )
          ],
        ));
  }
}
