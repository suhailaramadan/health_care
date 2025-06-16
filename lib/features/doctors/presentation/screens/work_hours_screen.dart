// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:graduation_project/core/constants.dart';
// import 'package:graduation_project/core/di/service_locator.dart';
// import 'package:graduation_project/core/resources/color_manager.dart';
// import 'package:graduation_project/core/resources/styles_manager.dart';
// import 'package:graduation_project/core/routes/routes.dart';
// import 'package:graduation_project/core/utils/ui_utils.dart';
// import 'package:graduation_project/core/widgets/custom_botton.dart';
// import 'package:graduation_project/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart';
// import 'package:graduation_project/features/doctors/presentation/widgets/appointment_item.dart';
// import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
// import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/delete_appointment_cubit.dart';
// import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/doctor_appointments_cubit.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class WorksHoursScreen extends StatelessWidget {
//   static const worksHours = '/worksHours';
//   const WorksHoursScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: serviceLocator.get<DeleteAppointmentCubit>(),
//       child: BlocListener<DeleteAppointmentCubit, AppointmentStates>(
//         listener: (context, state) {
//           if (state is DeleteAppointmentSuccess) {
//             UIUtils.showMessage(
//               context,
//               state.bookingResponse.message ?? '',
//               ColorManager.green,
//             );
//             context.read<DoctorAppointmentsCubit>().getAppointments();
//           } else if (state is GetAppointmentError) {
//             UIUtils.showMessage(
//               context,
//               state.message,
//               ColorManager.red,
//             );
//           }
//         },
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: Scaffold(
//             appBar: AppBar(
//               title: Text(
//                 'المواعيد المسجلة',
//                 style: getSemiBoldStyle(color: ColorManager.textColor),
//               ),
//               centerTitle: true,
//             ),
//             body: ListView(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 BlocBuilder<DoctorAppointmentsCubit, AppointmentStates>(
//                   builder: (context, state) {
//                     if (state is GetAppointmentLoading) {
//                       return const Center(
//                           child: CircularProgressIndicator(
//                         color: ColorManager.primary,
//                       ));
//                     } else if (state is GetDoctorAppointmentsSuccess) {
//                       final appointments = state.appointment;
//                       print("Number of Appointmenr ${appointments.length}");
//                       for (var appointment in appointments) {
//                         print(
//                             "Appointment ${appointment.startTime}- ${appointment.endTime} ${appointment.day}");
//                       }
//                       return Container(
//                         padding: const EdgeInsets.all(10),
//                         margin: const EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: ColorManager.grey)),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               padding: const EdgeInsets.symmetric(vertical: 12),
//                               decoration: BoxDecoration(
//                                   color: ColorManager.primary,
//                                   borderRadius: BorderRadius.circular(10)),
//                               child: SizedBox(
//                                 height: 50,
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Text("اليوم",
//                                         style: getSemiBoldStyle(
//                                             color: ColorManager.white)),
//                                     Text("البداية",
//                                         style: getSemiBoldStyle(
//                                             color: ColorManager.white)),
//                                     Text("النهاية",
//                                         style: getSemiBoldStyle(
//                                             color: ColorManager.white)),
//                                     Text("الإجراءات",
//                                         style: getSemiBoldStyle(
//                                             color: ColorManager.white)),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * .66,
//                               child: ListView.builder(
//                                 itemCount: appointments.length,
//                                 itemBuilder: (context, index) {
//                                   final appointment = appointments[index];
//                                   return DoctorAppointmentItem(
//                                     day: _getDayName(appointment.day ?? 0),
//                                     startTime: appointment.startTime ?? '',
//                                     endTime: appointment.endTime ?? '',
//                                     onEdit: () {
//                                       Navigator.pushNamed(
//                                           context, Routes.updateAppointment,
//                                           arguments: appointment);
//                                     },
//                                     onDelete: () async {
//                                       final cubit = context
//                                           .read<DeleteAppointmentCubit>();
//                                       showDialog(
//                                         context: context,
//                                         builder: (context) {
//                                           return Directionality(
//                                             textDirection: TextDirection.rtl,
//                                             child: AlertDialog(
//                                               surfaceTintColor:
//                                                   ColorManager.white,
//                                               backgroundColor:
//                                                   ColorManager.white,
//                                               title: const Icon(
//                                                 Icons.warning_amber,
//                                                 color: ColorManager.red,
//                                                 size: 35,
//                                               ),
//                                               content: Text(
//                                                 "هل أنت متأكد أنك تريد إلغاء الموعد",
//                                                 style: getBoldStyle(
//                                                     fontSize: 18,
//                                                     color:
//                                                         ColorManager.textColor),
//                                               ),
//                                               actions: [
//                                                 TextButton(
//                                                     onPressed: () {
//                                                       Navigator.of(context)
//                                                           .pop();

//                                                       cubit.deleteAppointment(
//                                                           appointment.id ?? 0);
//                                                     },
//                                                     style: ButtonStyle(
//                                                         padding:
//                                                             const MaterialStatePropertyAll(
//                                                                 EdgeInsets.all(
//                                                                     12)),
//                                                         backgroundColor:
//                                                             const MaterialStatePropertyAll(
//                                                                 ColorManager
//                                                                     .red),
//                                                         shape: MaterialStatePropertyAll(
//                                                             RoundedRectangleBorder(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             5),
//                                                                 side: const BorderSide(
//                                                                     width:
//                                                                         .3)))),
//                                                     child: Text(
//                                                       "إلغاء الموعد",
//                                                       style: getRegularStyle(
//                                                           color: ColorManager
//                                                               .white),
//                                                     )),
//                                                 SizedBox(
//                                                   width: 50.w,
//                                                 ),
//                                                 TextButton(
//                                                     onPressed: () {
//                                                       Navigator.of(context)
//                                                           .pop();
//                                                     },
//                                                     style: ButtonStyle(
//                                                         padding:
//                                                             const MaterialStatePropertyAll(
//                                                                 EdgeInsets.all(
//                                                                     15)),
//                                                         backgroundColor:
//                                                             const MaterialStatePropertyAll(
//                                                                 ColorManager
//                                                                     .transparent),
//                                                         shape: MaterialStatePropertyAll(
//                                                             RoundedRectangleBorder(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             5),
//                                                                 side: const BorderSide(
//                                                                     width:
//                                                                         .3)))),
//                                                     child: Text(
//                                                       "لا أريد ذلك",
//                                                       style: getRegularStyle(
//                                                           color: ColorManager
//                                                               .textColor),
//                                                     )),
//                                                 //     onTap: () {
//                                                 //       Navigator.of(context).pop();

//                                                 //       cubit.deleteAppointment(
//                                                 //           appointment.id ?? 0);
//                                                 //     }),
//                                                 // CustomButton(
//                                                 //     label: "لا أريد ذلك",
//                                                 //     backgroundColor:
//                                                 //         ColorManager.transparent,
//                                                 //     onTap: () {
//                                                 //       Navigator.of(context).pop();
//                                                 //     }),
//                                               ],
//                                             ),
//                                           );
//                                         },
//                                       );
//                                     },
//                                   );
//                                 },
//                               ),
//                             ),
//                             // Padding(
//                             //   padding: const EdgeInsets.all(12.0),
//                             //   child: ElevatedButton(
//                             //     onPressed: () {
//                             //       // إنشاء ميعاد جديد
//                             //     },
//                             //     style: ElevatedButton.styleFrom(
//                             //       backgroundColor: Colors.blue,
//                             //       padding: const EdgeInsets.symmetric(
//                             //           horizontal: 24, vertical: 12),
//                             //     ),
//                             //     child: const Text("إنشاء ميعاد جديد"),
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                       );
//                     } else if (state is GetAppointmentError) {
//                       return Center(
//                           child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           ElevatedButton(
//                               onPressed: () {
//                                 context
//                                     .read<DoctorAppointmentsCubit>()
//                                     .getAppointments();
//                               },
//                               child: const Text("حاول مرة أخرى")),
//                           Text(state.message),
//                         ],
//                       ));
//                     } else {
//                       return const SizedBox();
//                     }
//                   },
//                 ),
//               ],
//             ),
//             floatingActionButton: FloatingActionButton(
//               backgroundColor: ColorManager.primary,
//               foregroundColor: ColorManager.white,
//               splashColor: ColorManager.blue,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//               onPressed: () async {
//                 final prefs = await SharedPreferences.getInstance();
//                 final doctorId = prefs.getString(CacheConstants.doctorId);

//                 await Navigator.of(context)
//                     .pushNamed(Routes.createAppointment, arguments: doctorId)
//                     .then((value) async {
//                   final cubit = context.read<DoctorAppointmentsCubit>();
//                   await cubit.getAppointments();
//                 });
//               },
//               child: const Icon(
//                 Icons.add,
//                 size: 29,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   String _getDayName(int dayNumber) {
//     const days = [
//       'الأحد',
//       'الاثنين',
//       'الثلاثاء',
//       'الأربعاء',
//       'الخميس',
//       'الجمعة',
//       'السبت'
//     ];
//     return days[dayNumber % 7];
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/ui_utils.dart';
import 'package:graduation_project/features/notification/presentiation/cubit/notification_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/delete_appointment_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/doctor_appointments_cubit.dart';
import 'package:graduation_project/features/doctors/presentation/widgets/appointment_item.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_by_id_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorksHoursScreen extends StatelessWidget {
  const WorksHoursScreen({super.key});
  static const worksHours = '/worksHours';
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: serviceLocator.get<DeleteAppointmentCubit>(),
      child: BlocListener<DeleteAppointmentCubit, AppointmentStates>(
        listener: (context, state) {
          if (state is DeleteAppointmentSuccess) {
            UIUtils.showMessage(
              context,
              "تم إلغاء اليوم بنجاح",
              // state.bookingResponse.message ?? '',
              ColorManager.green,
            );

            context.read<NotificationCubit>().getNotification();

            context.read<DoctorAppointmentsCubit>().getAppointments();
            if (ModalRoute.of(context)?.settings.name == Routes.booking) {
              context.read<BookingPatientCubit>().getBookingPatient();
            }
          } else if (state is GetAppointmentError) {
            UIUtils.showMessage(
              context,
              state.message,
              ColorManager.red,
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'المواعيد المسجلة',
              style: getSemiBoldStyle(color: ColorManager.textColor),
            ),
            centerTitle: true,
          ),
          body:
              //  BlocBuilder<DoctorAppointmentsCubit, AppointmentStates>(
              //   builder: (context, state) {
              //     if (state is GetAppointmentLoading) {
              //       return const Center(
              //         child: CircularProgressIndicator(
              //           color: ColorManager.primary,
              //         ),
              //       );
              //     } else if (state is GetDoctorAppointmentsSuccess) {
              //       final appointments = state.appointment;

              //       if (appointments.isEmpty) {
              //         return const Center(
              //           child: Text(
              //             "لا توجد مواعيد متاحة",
              //             style: TextStyle(fontSize: 18),
              //           ),
              //         );
              //       }

              // return
              Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ColorManager.grey)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadius.circular(10)),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("اليوم",
                              style:
                                  getSemiBoldStyle(color: ColorManager.white)),
                          Text("البداية",
                              style:
                                  getSemiBoldStyle(color: ColorManager.white)),
                          Text("النهاية",
                              style:
                                  getSemiBoldStyle(color: ColorManager.white)),
                          Text("الإجراءات",
                              style:
                                  getSemiBoldStyle(color: ColorManager.white)),
                        ],
                      ),
                    ),
                  ),
                  BlocBuilder<DoctorAppointmentsCubit, AppointmentStates>(
                      builder: (context, state) {
                    if (state is GetAppointmentLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.primary,
                        ),
                      );
                    } else if (state is GetDoctorAppointmentsSuccess) {
                      final appointments = state.appointment;

                      if (appointments.isEmpty) {
                        return const Center(
                          child: Text(
                            "لا توجد مواعيد متاحة",
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      }
                      return SizedBox(
                          height: MediaQuery.of(context).size.height * .66,
                          child: ListView.builder(
                            itemCount: appointments.length,
                            itemBuilder: (context, index) {
                              final appointment = appointments[index];
                              return DoctorAppointmentItem(
                                day: _getDayName(appointment.day ?? 0),
                                startTime: appointment.startTime ?? '',
                                endTime: appointment.endTime ?? '',
                                onEdit: () {
                                  Navigator.pushNamed(
                                    context,
                                    Routes.updateAppointment,
                                    arguments: appointment,
                                  );
                                },
                                onDelete: () async {
                                  // print("AppointId---<< ${appointment.id}");
                                  final cubit =
                                      context.read<DeleteAppointmentCubit>();

                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: AlertDialog(
                                          surfaceTintColor: ColorManager.white,
                                          backgroundColor: ColorManager.white,
                                          title: const Icon(
                                            Icons.warning_amber,
                                            color: ColorManager.red,
                                            size: 35,
                                          ),
                                          content: Text(
                                            "هل أنت متأكد أنك تريد إلغاء الموعد",
                                            style: getBoldStyle(
                                                fontSize: 18,
                                                color: ColorManager.textColor),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () async {
                                                  Navigator.of(context).pop();

                                                  cubit.deleteAppointment(
                                                    // appointmentId:
                                                    appointment.id ?? 0,
                                                    // startTime: appointment
                                                    //         .startTime ??
                                                    //     '',
                                                    // endTime:
                                                    //     appointment.endTime ??
                                                    //         '',
                                                    // day: appointment.day ?? 0,
                                                    // duration: appointment
                                                    //         .duration ??
                                                    //     0
                                                  );

                                                  // context
                                                  //     .read<
                                                  //         DoctorAppointmentsCubit>()
                                                  //     .getAppointments();
                                                  // SchedulerBinding.instance
                                                  //     .addPostFrameCallback(
                                                  //         (_) {
                                                  //   context
                                                  //       .read<
                                                  //           NotificationCubit>()
                                                  //       .getNotification();
                                                  //   // context
                                                  // });
                                                  //     .read<BookingByIdCubit>()
                                                  //     .getBookingById(
                                                  //         s?? 0);

                                                  print(
                                                      "تم حذف موعدك يوم ${appointment.day} -- ${appointment.startTime}---${appointment.endTime} ---${appointment.duration} ${appointment.id}");
                                                },
                                                style: ButtonStyle(
                                                    padding:
                                                        const MaterialStatePropertyAll(
                                                            EdgeInsets.all(12)),
                                                    backgroundColor:
                                                        const MaterialStatePropertyAll(
                                                            ColorManager.red),
                                                    shape: MaterialStatePropertyAll(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            side:
                                                                const BorderSide(
                                                                    width:
                                                                        .3)))),
                                                child: Text(
                                                  "إلغاء الموعد",
                                                  style: getRegularStyle(
                                                      color:
                                                          ColorManager.white),
                                                )),
                                            SizedBox(
                                              width: 50.w,
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                style: ButtonStyle(
                                                    padding:
                                                        const MaterialStatePropertyAll(
                                                            EdgeInsets.all(15)),
                                                    backgroundColor:
                                                        const MaterialStatePropertyAll(
                                                            ColorManager
                                                                .transparent),
                                                    shape: MaterialStatePropertyAll(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            side:
                                                                const BorderSide(
                                                                    width:
                                                                        .3)))),
                                                child: Text(
                                                  "لا أريد ذلك",
                                                  style: getRegularStyle(
                                                      color: ColorManager
                                                          .textColor),
                                                )),
                                            //     onTap: () {
                                            //       Navigator.of(context).pop();

                                            //       cubit.deleteAppointment(
                                            //           appointment.id ?? 0);
                                            //     }),
                                            // CustomButton(
                                            //     label: "لا أريد ذلك",
                                            //     backgroundColor:
                                            //         ColorManager.transparent,
                                            //     onTap: () {
                                            //       Navigator.of(context).pop();
                                            //     }),
                                          ],
                                        ),
                                      );
                                    },
                                  );

                                  // _showDeleteDialog(context, appointment.id ?? 0);
                                },
                              );
                            },
                          ));
                    } else {
                      return Container(
                        padding: const EdgeInsets.all(20.0),
                        margin: EdgeInsets.all(20),
                        child: Center(
                            child: Text("لا توجد مواعيد مسجلة",
                                style:
                                    getMediumStyle(color: ColorManager.kuhly))),
                      );
                    }
                  }),
                ],
              ),
            ),
            //   );
            // } else if (state is GetAppointmentError) {
            //   return
            //   Center(
            //     child: Text("لا توجد مواعيد مسجلة",style:getSemiBoldStyle(color: ColorManager.kuhly)),
            // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     ElevatedButton(
            //         onPressed: () {
            //           context
            //               .read<DoctorAppointmentsCubit>()
            //               .getAppointments();
            //         },
            //         child: const Text("")),
            //     // Text(state.message),
            //   ],
            // ),
            //     );
            //   } else {
            //     return Center(
            //       child: Text("لا توجد مواعيد مسجلة",style:getSemiBoldStyle(color: ColorManager.kuhly)));
            //   }
            // },
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: ColorManager.primary,
            foregroundColor: ColorManager.white,
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              final doctorId = prefs.getString('doctorId');
              await Navigator.of(context)
                  .pushNamed(Routes.createAppointment, arguments: doctorId)
                  .then((_) {
                context.read<DoctorAppointmentsCubit>().getAppointments();
              });
            },
            child: const Icon(Icons.add, size: 29),
          ),
        ),
      ),
    );
  }

  String _getDayName(int dayNumber) {
    const days = [
      'الأحد',
      'الاثنين',
      'الثلاثاء',
      'الأربعاء',
      'الخميس',
      'الجمعة',
      'السبت'
    ];
    return days[dayNumber % 7];
  }
}
