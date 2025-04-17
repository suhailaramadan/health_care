// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/core/di/service_locator.dart';
// import 'package:graduation_project/core/resources/color_manager.dart';
// import 'package:graduation_project/core/widgets/error_indicator.dart';
// import 'package:graduation_project/core/widgets/loading_indicator.dart';
// import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart';
// import 'package:graduation_project/features/doctor/presentation/cubit/doctor_states.dart';
// import 'package:graduation_project/features/doctor/presentation/widgets/appointment_list.dart';
// import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_request.dart';
// import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart';
// import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
// import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart';
// import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart';
// import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_states.dart';

// class ReBooking extends StatefulWidget {
//   final int oldBookingId;
//   const ReBooking({super.key, required this.oldBookingId});

//   @override
//   State<ReBooking> createState() => _ReBookingState();
// }

// class _ReBookingState extends State<ReBooking> {
//   int? selectedClinicId;
//   String? selectedDoctorId;
//   String? selectedDate;
//   String? selectedTime;
//   // final List<String> clinics = ['عيادة 1', 'عيادة 2'];
//   // final List<String> doctors = ['دكتور 1', 'دكتور 2'];
//   // final List<String> dates = ['20-1-2012', '15-8-2025'];
//   // final List<String> time = ['10.00', '8.00'];
//   @override
//   void initState() {
//     super.initState();
//     context.read<ClinicCubit>().getClinics();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => serviceLocator.get<DoctorsCubit>(),
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               BlocBuilder<ClinicCubit, ClinicState>(
//                 builder: (context, state) {
//                   if (state is GetClinicsLoading) {
//                     return const LoadingIndicator();
//                   } else if (state is GetClinicsError) {
//                     return const ErrorIndicator();
//                   } else if (state is GetClinicsSuccess) {
//                     return DropdownButtonFormField(
//                       dropdownColor: ColorManager.white,
//                       hint: const Text('اختر العيادة'),
//                       value: selectedClinicId,
//                       items: state.clinicEntity.map((clinic) {
//                         return DropdownMenuItem(
//                           value: clinic.id,
//                           child: Text(clinic.name),
//                         );
//                       }).toList(),
//                       onChanged: (val) {
//                         setState(() {
//                           selectedClinicId = val;
//                           selectedDoctorId = null;
//                         });
//                         context.read<DoctorsCubit>().getDoctorsByClinicId(val);
//                       },
//                     );
//                   }
//                   return const SizedBox(height: 10);
//                 },
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               BlocBuilder<DoctorsCubit, DoctorsStates>(
//                   builder: (context, state) {
//                 if (state is GetDoctorsLoading) {
//                   return const LoadingIndicator();
//                 } else if (state is GetDoctorsError) {
//                   return const ErrorIndicator();
//                 } else if (state is GetDoctorsSuccess) {
//                   return DropdownButtonFormField(
//                       hint: const Text('اختر الدكتور'),
//                       items: state.doctorEntity
//                           .map((doctor) => DropdownMenuItem(
//                               value: doctor.id,
//                               child: Text(
//                                   '${doctor.firstName} ${doctor.lastName}')))
//                           .toList(),
//                       onChanged: (val) {
//                         setState(() {
//                           selectedDoctorId = val;
//                         });
//                         context
//                             .read<AppointmentCubit>()
//                             .getAppointmentDoctorById(val ?? '');
//                       });
//                 }
//                 return const SizedBox(
//                   height: 10,
//                 );
//               }),
//               const SizedBox(
//                 height: 10,
//               ),
//               BlocBuilder<AppointmentCubit, AppointmentStates>(
//                 builder: (context, state) {
//                   if (state is GetAppointmentLoading) {
//                     return const LoadingIndicator();
//                   } else if (state is GetAppointmentError) {
//                     return const ErrorIndicator();
//                   } else if (state is GetAppointmentSuccess) {
//                     return AppointmentList(
//                         appointments: state.appointmentEntity,
//                         onSelectionChanged: (day, time) {
//                           setState(() {
//                             selectedDate = day;
//                             selectedTime = time;
//                           });
//                         });
//                     // DropdownButtonFormField(
//                     //     items: dates
//                     //         .map((e) => DropdownMenuItem(child: Text(e)))
//                     //         .toList(),
//                     //     onChanged: (val) => setState(() {
//                     //           selectedDate = val;
//                     //         }));
//                   }
//                   return const SizedBox(
//                     height: 10,
//                   );
//                 },
//               ),
//               // const SizedBox(
//               //   height: 10,
//               // ),
//               // DropdownButtonFormField(
//               //     items:
//               //         dates.map((e) => DropdownMenuItem(child: Text(e))).toList(),
//               //     onChanged: (val) => setState(() {
//               //           selectedDate = val;
//               //         })),
//               const SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                   onPressed: selectedClinicId != null &&
//                           selectedDate != null &&
//                           selectedTime != null &&
//                           selectedDoctorId != null
//                       ? () {
//                           context.read<BookingCubit>().bookAppointment(
//                               BookingRequest(
//                                   time: selectedTime!,
//                                   date: selectedDate!,
//                                   doctorId: selectedDoctorId!,
//                                   isBooking: true));
//                           Navigator.of(context).pop();
//                           context
//                               .read<DeleteBookingCubit>()
//                               .deleteBooking(widget.oldBookingId);
//                         }
//                       : null,

//                   //   final request = BookingRequest(
//                   //       time: time.first,
//                   //       date: selectedDate ?? '',
//                   //       doctorId: selectedDoctor ?? '',
//                   //       isBooking: true);
//                   //   context.read<BookingCubit>().bookAppointment(request);
//                   //   Navigator.of(context).pop();
//                   // }

//                   child: const Text("تأكيد الحجز"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/doctor/domain/entities/doctor_entity.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_states.dart';
import 'package:graduation_project/features/doctor/presentation/widgets/appointment_list.dart';
import 'package:graduation_project/features/doctor/presentation/widgets/doctor_details.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_request.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart';
import 'package:graduation_project/features/user/clinic/domain/entities/clinic_entity.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_states.dart';

class ReBooking extends StatefulWidget {
  final int oldBookingId;
  final int initialClinicId;
  final String initialDoctorId;
  final String initialDate;
  final String initialTime;
  const ReBooking(
      {super.key,
      required this.oldBookingId,
      required this.initialClinicId,
      required this.initialDoctorId,
      required this.initialDate,
      required this.initialTime});

  @override
  State<ReBooking> createState() => _ReBookingState();
}

class _ReBookingState extends State<ReBooking> {
  int? selectedClinicId;
  String? selectedDoctorId;
  String? selectedDate;
  String? selectedTime;

  @override
  void initState() {
    super.initState();
    selectedClinicId = widget.initialClinicId;
    selectedDoctorId = widget.initialDoctorId;
    selectedDate = widget.initialDate;
    selectedTime = widget.initialTime;
    context.read<ClinicCubit>().getClinics();
    context.read<DoctorsCubit>().getDoctorsByClinicId(widget.initialClinicId);
    context
        .read<AppointmentCubit>()
        .getAppointmentDoctorById(widget.initialDoctorId);
  }

  @override
  Widget build(BuildContext context) {
    bool isChange = selectedClinicId != widget.initialClinicId ||
        selectedDoctorId != widget.initialDoctorId &&
            selectedDate != widget.initialDate &&
            selectedTime != widget.initialTime;
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<ClinicCubit, ClinicState>(builder: (context, state) {
                if (state is GetClinicsLoading) {
                  return const LoadingIndicator();
                }
                if (state is GetClinicsSuccess) {
                  var clinics = List<ClinicEntity>.from(state.clinicEntity);

                  if (selectedClinicId != null &&
                      !clinics
                          .any((element) => element.id == selectedClinicId!)) {
                    clinics.insert(
                        0, ClinicEntity(selectedClinicId ?? 0, 'العيادة', ''));
                  }
                  return DropdownButtonFormField<int>(
                    value: selectedClinicId,
                    hint: const Text("اختر العيادة"),
                    items: clinics
                        .map((clinic) => DropdownMenuItem(
                              value: clinic.id,
                              child: Text(clinic.name),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedClinicId = val;
                        selectedDoctorId = null;
                      });
                      context.read<DoctorsCubit>().getDoctorsByClinicId(val!);
                    },
                  );
                }
                return const SizedBox();
              }),
              const SizedBox(height: 10),
              BlocBuilder<DoctorsCubit, DoctorsStates>(
                builder: (context, state) {
                  if (state is GetDoctorsLoading) {
                    return const LoadingIndicator();
                  }
                  if (state is GetDoctorsSuccess) {
                    var doctors = List<DoctorEntity>.from(state.doctorEntity);
                    if (selectedDoctorId != null &&
                        !doctors
                            .any((element) => element.id == selectedDoctorId)) {
                      doctors.insert(
                          0,
                          DoctorEntity(selectedDoctorId!, 'الدكتور', "المحتار",
                              "", 0, "", "", "", "", ""));
                    }
                    return DropdownButtonFormField<String>(
                      isExpanded: true,
                      value: selectedDoctorId,
                      hint: const Text("اختر الدكتور"),
                      items: doctors
                          .map((doc) => DropdownMenuItem(
                                value: doc.id,
                                child: Text("${doc.firstName} ${doc.lastName}"),
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() => selectedDoctorId = val);
                        context
                            .read<AppointmentCubit>()
                            .getAppointmentDoctorById(val!);
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
              const SizedBox(height: 10),
              BlocBuilder<AppointmentCubit, AppointmentStates>(
                builder: (context, state) {
                  if (state is GetAppointmentLoading) {
                    return const LoadingIndicator();
                  }
                  if (state is GetAppointmentSuccess) {
                    return AppointmentList(
                      appointments: state.appointmentEntity,
                      onSelectionChanged: (day, time) {
                        setState(() {
                          selectedDate = day;
                          selectedTime = time;
                        });
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: (selectedClinicId != null &&
                        selectedDoctorId != null &&
                        selectedDate != null &&
                        selectedTime != null &&
                        isChange)
                    ? () {
                        context.read<BookingCubit>().bookAppointment(
                              BookingRequest(
                                doctorId: selectedDoctorId!,
                                date: selectedDate!,
                                time: selectedTime!,
                                isBooking: true,
                              ),
                            );

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "تم إعادة الحجز بنجاح",
                          ),
                          backgroundColor: Colors.green,
                        ));
                        context
                            .read<DeleteBookingCubit>()
                            .deleteBooking(widget.oldBookingId);
                        Navigator.of(context).pop();
                        context
                            .read<BookingPatientCubit>()
                            .getBookingPatient(CacheConstants.tokenKey);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "تأكيد الحجز",
                  style: getMediumStyle(color: ColorManager.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
    // SizedBox(
    //   width: double.maxFinite,
    //   child: SingleChildScrollView(
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         BlocBuilder<ClinicCubit, ClinicState>(
    //           builder: (context, state) {
    //             if (state is GetClinicsLoading) return const LoadingIndicator();
    //             if (state is GetClinicsSuccess) {
    //               return DropdownButtonFormField<int>(
    //                 value: selectedClinicId,
    //                 hint: const Text("اختر العيادة"),
    //                 items: state.clinicEntity
    //                     .map((clinic) => DropdownMenuItem(
    //                           value: clinic.id,
    //                           child: Text(clinic.name),
    //                         ))
    //                     .toList(),
    //                 onChanged: (val) {
    //                   setState(() {
    //                     selectedClinicId = val;
    //                     selectedDoctorId = null;
    //                   });
    //                   context.read<DoctorsCubit>().getDoctorsByClinicId(val);
    //                 },
    //               );
    //             }
    //             return const SizedBox();
    //           },
    //         ),
    //         const SizedBox(height: 10),
    //         BlocBuilder<DoctorsCubit, DoctorsStates>(
    //           builder: (context, state) {
    //             if (state is GetDoctorsLoading) return const LoadingIndicator();
    //             if (state is GetDoctorsSuccess) {
    //               return DropdownButtonFormField<String>(
    //                 value: selectedDoctorId,
    //                 hint: const Text("اختر الدكتور"),
    //                 items: state.doctorEntity
    //                     .map((doc) => DropdownMenuItem(
    //                           value: doc.id,
    //                           child: Text("${doc.firstName} ${doc.lastName}"),
    //                         ))
    //                     .toList(),
    //                 onChanged: (val) {
    //                   setState(() => selectedDoctorId = val);
    //                   context
    //                       .read<AppointmentCubit>()
    //                       .getAppointmentDoctorById(val ?? '');
    //                 },
    //               );
    //             }
    //             return const SizedBox();
    //           },
    //         ),
    //         const SizedBox(height: 10),
    //         BlocBuilder<AppointmentCubit, AppointmentStates>(
    //           builder: (context, state) {
    //             if (state is GetAppointmentLoading) {
    //               return const LoadingIndicator();
    //             }
    //             if (state is GetAppointmentSuccess) {
    //               return AppointmentList(
    //                 appointments: state.appointmentEntity,
    //                 onSelectionChanged: (day, time) {
    //                   setState(() {
    //                     selectedDate = day;
    //                     selectedTime = time;
    //                   });
    //                 },
    //               );
    //             }
    //             return const SizedBox();
    //           },
    //         ),
    //         const SizedBox(height: 15),
    //         ElevatedButton(
    //           onPressed: (selectedClinicId != null &&
    //                   selectedDoctorId != null &&
    //                   selectedDate != null &&
    //                   selectedTime != null)
    //               ? () {
    //                   context.read<BookingCubit>().bookAppointment(
    //                         BookingRequest(
    //                           doctorId: selectedDoctorId!,
    //                           date: selectedDate!,
    //                           time: selectedTime!,
    //                           isBooking: true,
    //                         ),
    //                       );
    //                   context
    //                       .read<DeleteBookingCubit>()
    //                       .deleteBooking(widget.oldBookingId);
    //                   Navigator.of(context).pop();
    //                 }
    //               : null,
    //           style: ElevatedButton.styleFrom(
    //             backgroundColor: ColorManager.primary,
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(8),
    //             ),
    //           ),
    //           child: Text(
    //             "تأكيد الحجز",
    //             style: getMediumStyle(color: ColorManager.white),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
