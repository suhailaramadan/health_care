// // // import 'package:flutter/foundation.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // import 'package:graduation_project/core/di/service_locator.dart';
// // // import 'package:graduation_project/core/resources/color_manager.dart';
// // // import 'package:graduation_project/core/widgets/error_indicator.dart';
// // // import 'package:graduation_project/core/widgets/loading_indicator.dart';
// // // import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart';
// // // import 'package:graduation_project/features/doctor/presentation/cubit/doctor_states.dart';
// // // import 'package:graduation_project/features/doctor/presentation/widgets/appointment_list.dart';
// // // import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_request.dart';
// // // import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart';
// // // import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
// // // import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart';
// // // import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart';
// // // import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_states.dart';

// // // class ReBooking extends StatefulWidget {
// // //   final int oldBookingId;
// // //   const ReBooking({super.key, required this.oldBookingId});

// // //   @override
// // //   State<ReBooking> createState() => _ReBookingState();
// // // }

// // // class _ReBookingState extends State<ReBooking> {
// // //   int? selectedClinicId;
// // //   String? selectedDoctorId;
// // //   String? selectedDate;
// // //   String? selectedTime;
// // //   // final List<String> clinics = ['عيادة 1', 'عيادة 2'];
// // //   // final List<String> doctors = ['دكتور 1', 'دكتور 2'];
// // //   // final List<String> dates = ['20-1-2012', '15-8-2025'];
// // //   // final List<String> time = ['10.00', '8.00'];
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     context.read<ClinicCubit>().getClinics();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return BlocProvider(
// // //       create: (context) => serviceLocator.get<DoctorsCubit>(),
// // //       child: Padding(
// // //         padding: const EdgeInsets.all(20),
// // //         child: SingleChildScrollView(
// // //           child: Column(
// // //             children: [
// // //               BlocBuilder<ClinicCubit, ClinicState>(
// // //                 builder: (context, state) {
// // //                   if (state is GetClinicsLoading) {
// // //                     return const LoadingIndicator();
// // //                   } else if (state is GetClinicsError) {
// // //                     return const ErrorIndicator();
// // //                   } else if (state is GetClinicsSuccess) {
// // //                     return DropdownButtonFormField(
// // //                       dropdownColor: ColorManager.white,
// // //                       hint: const Text('اختر العيادة'),
// // //                       value: selectedClinicId,
// // //                       items: state.clinicEntity.map((clinic) {
// // //                         return DropdownMenuItem(
// // //                           value: clinic.id,
// // //                           child: Text(clinic.name),
// // //                         );
// // //                       }).toList(),
// // //                       onChanged: (val) {
// // //                         setState(() {
// // //                           selectedClinicId = val;
// // //                           selectedDoctorId = null;
// // //                         });
// // //                         context.read<DoctorsCubit>().getDoctorsByClinicId(val);
// // //                       },
// // //                     );
// // //                   }
// // //                   return const SizedBox(height: 10);
// // //                 },
// // //               ),
// // //               const SizedBox(
// // //                 height: 10,
// // //               ),
// // //               BlocBuilder<DoctorsCubit, DoctorsStates>(
// // //                   builder: (context, state) {
// // //                 if (state is GetDoctorsLoading) {
// // //                   return const LoadingIndicator();
// // //                 } else if (state is GetDoctorsError) {
// // //                   return const ErrorIndicator();
// // //                 } else if (state is GetDoctorsSuccess) {
// // //                   return DropdownButtonFormField(
// // //                       hint: const Text('اختر الدكتور'),
// // //                       items: state.doctorEntity
// // //                           .map((doctor) => DropdownMenuItem(
// // //                               value: doctor.id,
// // //                               child: Text(
// // //                                   '${doctor.firstName} ${doctor.lastName}')))
// // //                           .toList(),
// // //                       onChanged: (val) {
// // //                         setState(() {
// // //                           selectedDoctorId = val;
// // //                         });
// // //                         context
// // //                             .read<AppointmentCubit>()
// // //                             .getAppointmentDoctorById(val ?? '');
// // //                       });
// // //                 }
// // //                 return const SizedBox(
// // //                   height: 10,
// // //                 );
// // //               }),
// // //               const SizedBox(
// // //                 height: 10,
// // //               ),
// // //               BlocBuilder<AppointmentCubit, AppointmentStates>(
// // //                 builder: (context, state) {
// // //                   if (state is GetAppointmentLoading) {
// // //                     return const LoadingIndicator();
// // //                   } else if (state is GetAppointmentError) {
// // //                     return const ErrorIndicator();
// // //                   } else if (state is GetAppointmentSuccess) {
// // //                     return AppointmentList(
// // //                         appointments: state.appointmentEntity,
// // //                         onSelectionChanged: (day, time) {
// // //                           setState(() {
// // //                             selectedDate = day;
// // //                             selectedTime = time;
// // //                           });
// // //                         });
// // //                     // DropdownButtonFormField(
// // //                     //     items: dates
// // //                     //         .map((e) => DropdownMenuItem(child: Text(e)))
// // //                     //         .toList(),
// // //                     //     onChanged: (val) => setState(() {
// // //                     //           selectedDate = val;
// // //                     //         }));
// // //                   }
// // //                   return const SizedBox(
// // //                     height: 10,
// // //                   );
// // //                 },
// // //               ),
// // //               // const SizedBox(
// // //               //   height: 10,
// // //               // ),
// // //               // DropdownButtonFormField(
// // //               //     items:
// // //               //         dates.map((e) => DropdownMenuItem(child: Text(e))).toList(),
// // //               //     onChanged: (val) => setState(() {
// // //               //           selectedDate = val;
// // //               //         })),
// // //               const SizedBox(
// // //                 height: 20,
// // //               ),
// // //               ElevatedButton(
// // //                   onPressed: selectedClinicId != null &&
// // //                           selectedDate != null &&
// // //                           selectedTime != null &&
// // //                           selectedDoctorId != null
// // //                       ? () {
// // //                           context.read<BookingCubit>().bookAppointment(
// // //                               BookingRequest(
// // //                                   time: selectedTime!,
// // //                                   date: selectedDate!,
// // //                                   doctorId: selectedDoctorId!,
// // //                                   isBooking: true));
// // //                           Navigator.of(context).pop();
// // //                           context
// // //                               .read<DeleteBookingCubit>()
// // //                               .deleteBooking(widget.oldBookingId);
// // //                         }
// // //                       : null,

// // //                   //   final request = BookingRequest(
// // //                   //       time: time.first,
// // //                   //       date: selectedDate ?? '',
// // //                   //       doctorId: selectedDoctor ?? '',
// // //                   //       isBooking: true);
// // //                   //   context.read<BookingCubit>().bookAppointment(request);
// // //                   //   Navigator.of(context).pop();
// // //                   // }

// // //                   child: const Text("تأكيد الحجز"))
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'dart:math';

// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:graduation_project/core/constants.dart';
// // import 'package:graduation_project/core/resources/color_manager.dart';
// // import 'package:graduation_project/core/resources/styles_manager.dart';
// // import 'package:graduation_project/core/widgets/loading_indicator.dart';
// // import 'package:graduation_project/features/doctor/domain/entities/doctor_entity.dart';
// // import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart';
// // import 'package:graduation_project/features/doctor/presentation/cubit/doctor_states.dart';
// // import 'package:graduation_project/features/doctor/presentation/widgets/appointment_list.dart';
// // import 'package:graduation_project/features/doctor/presentation/widgets/doctor_details.dart';
// // import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_request.dart';
// // import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart';
// // import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
// // import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart';
// // import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart';
// // import 'package:graduation_project/features/user/clinic/domain/entities/clinic_entity.dart';
// // import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart';
// // import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_states.dart';

// // class ReBooking extends StatefulWidget {
// //   final int oldBookingId;
// //   final int initialClinicId;
// //   final String initialDoctorId;
// //   final String initialDate;
// //   final String initialTime;
// //   final String clinicName;
// //   final String firstName;
// //   final String lastName;
// //   const ReBooking(
// //       {super.key,
// //       required this.oldBookingId,

// //       required this.initialClinicId,
// //       required this.initialDoctorId,
// //       required this.initialDate,
// //       required this.initialTime,
// //       required this.clinicName,
// //       required this.firstName,
// //       required this.lastName
// //       });

// //   @override
// //   State<ReBooking> createState() => _ReBookingState();
// // }

// // class _ReBookingState extends State<ReBooking> {
// //   int? selectedClinicId;
// //   String? selectedDoctorId;
// //   String? selectedDate;
// //   String? selectedTime;

// //   @override
// //   void initState() {
// //     super.initState();
// //     selectedClinicId = widget.initialClinicId;
// //     selectedDoctorId = widget.initialDoctorId;
// //     selectedDate = widget.initialDate;
// //     selectedTime = widget.initialTime;
// //     context.read<ClinicCubit>().getClinics();
// //     context.read<DoctorsCubit>().getDoctorsByClinicId(widget.initialClinicId);
// //     context
// //         .read<AppointmentCubit>()
// //         .getAppointmentDoctorById(widget.initialDoctorId);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     bool isChange = selectedClinicId != widget.initialClinicId ||
// //         selectedDoctorId != widget.initialDoctorId &&
// //             selectedDate != widget.initialDate &&
// //             selectedTime != widget.initialTime;
// //     return Directionality(
// //       textDirection: TextDirection.rtl,
// //       child: SizedBox(
// //         height: 350,
// //         width: 450,
// //         child: Padding(
// //           padding: const EdgeInsets.all(0.0),
// //           child: SingleChildScrollView(
// //             child: Column(
// //               // mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 BlocBuilder<ClinicCubit, ClinicState>(
// //                     builder: (context, state) {
// //                   if (state is GetClinicsLoading) {
// //                     return const LoadingIndicator();
// //                   }
// //                   if (state is GetClinicsSuccess) {
// //                     var clinics = List<ClinicEntity>.from(state.clinicEntity);

// //                     if (selectedClinicId != null &&
// //                         !clinics.any(
// //                             (element) => element.id == selectedClinicId!)) {
// //                       clinics.insert(
// //                           0,
// //                           ClinicEntity(
// //                               selectedClinicId ?? 0, widget.clinicName, ''));
// //                     }
// //                     return DropdownButtonFormField<int>(
// //                       focusColor: ColorManager.primary,
// //                       decoration: const InputDecoration(
// //                           contentPadding: EdgeInsets.all(2)),
// //                       value: selectedClinicId,
// //                       hint: Text("اختر العيادة",
// //                           style: getMediumStyle(color: ColorManager.textColor)),
// //                       items: clinics
// //                           .map((clinic) => DropdownMenuItem(
// //                                 alignment: Alignment.topRight,
// //                                 value: clinic.id,
// //                                 child: Text(clinic.name),
// //                               ))
// //                           .toList(),
// //                       onChanged: (val) {
// //                         setState(() {
// //                           selectedClinicId = val;
// //                           selectedDoctorId = null;
// //                         });
// //                         context.read<DoctorsCubit>().getDoctorsByClinicId(val!);
// //                       },
// //                     );
// //                   }
// //                   return const SizedBox();
// //                 }),
// //                 const SizedBox(height: 10),
// //                 BlocBuilder<DoctorsCubit, DoctorsStates>(
// //                   builder: (context, state) {
// //                     if (state is GetDoctorsLoading) {
// //                       return const LoadingIndicator();
// //                     }
// //                     if (state is GetDoctorsSuccess) {
// //                       var doctors = List<DoctorEntity>.from(state.doctorEntity);
// //                       if (selectedDoctorId != null &&
// //                           !doctors.any(
// //                               (element) => element.id == selectedDoctorId)) {
// //                         doctors.insert(
// //                             0,
// //                             DoctorEntity(
// //                                 selectedDoctorId!,
// //                                 "${widget.firstName} ${widget.lastName}",
// //                                 '',
// //                                 "",
// //                                 0,
// //                                 "",
// //                                 "",
// //                                 "",
// //                                 "",
// //                                 ""));
// //                       }
// //                       return DropdownButtonFormField<String>(
// //                         isExpanded: true,
// //                         value: selectedDoctorId,
// //                         hint: Text("${widget.firstName} ${widget.lastName}",
// //                             style:
// //                                 getMediumStyle(color: ColorManager.textColor)),
// //                         items: doctors
// //                             .map((doc) => DropdownMenuItem(
// //                                   value: doc.id,
// //                                   child:
// //                                       Text("${doc.firstName} ${doc.lastName}"),
// //                                 ))
// //                             .toList(),
// //                         onChanged: (val) {
// //                           setState(() => selectedDoctorId = val);
// //                           context
// //                               .read<AppointmentCubit>()
// //                               .getAppointmentDoctorById(val!);
// //                         },
// //                       );
// //                     }
// //                     return const SizedBox();
// //                   },
// //                 ),
// //                 const SizedBox(height: 10),
// //                 BlocBuilder<AppointmentCubit, AppointmentStates>(
// //                   builder: (context, state) {
// //                     if (state is GetAppointmentLoading) {
// //                       return const LoadingIndicator();
// //                     }
// //                     if (state is GetAppointmentSuccess) {
// //                       return AppointmentList(
// //                         appointments: state.appointmentEntity,
// //                         onSelectionChanged: (day, time) {
// //                           setState(() {
// //                             selectedDate = day;
// //                             selectedTime = time;
// //                           });
// //                         },
// //                       );
// //                     }
// //                     return const SizedBox();
// //                   },
// //                 ),
// //                 const SizedBox(height: 15),
// //                 ElevatedButton(
// //                   onPressed: (selectedClinicId != null &&
// //                           selectedDoctorId != null &&
// //                           selectedDate != null &&
// //                           selectedTime != null &&
// //                           isChange)
// //                       ? () {
// //                           context.read<BookingCubit>().bookAppointment(
// //                                 BookingRequest(
// //                                   doctorId: selectedDoctorId!,
// //                                   date: selectedDate!,
// //                                   time: selectedTime!,
// //                                   isBooking: true,
// //                                 ),
// //                               );

// //                           ScaffoldMessenger.of(context)
// //                               .showSnackBar(const SnackBar(
// //                             content: Text(
// //                               "تم إعادة الحجز بنجاح",
// //                             ),
// //                             backgroundColor: Colors.green,
// //                           ));
// //                           context
// //                               .read<DeleteBookingCubit>()
// //                               .deleteBooking(widget.oldBookingId);
// //                           Navigator.of(context).pop();
// //                           context
// //                               .read<BookingPatientCubit>()
// //                               .getBookingPatient(CacheConstants.tokenKey);
// //                         }
// //                       : null,
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: ColorManager.primary,
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(8),
// //                     ),
// //                   ),
// //                   child: Text(
// //                     "تأكيد الحجز",
// //                     style: getMediumStyle(color: ColorManager.white),
// //                   ),
// //                 )
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //     // SizedBox(
// //     //   width: double.maxFinite,
// //     //   child: SingleChildScrollView(
// //     //     child: Column(
// //     //       mainAxisSize: MainAxisSize.min,
// //     //       children: [
// //     //         BlocBuilder<ClinicCubit, ClinicState>(
// //     //           builder: (context, state) {
// //     //             if (state is GetClinicsLoading) return const LoadingIndicator();
// //     //             if (state is GetClinicsSuccess) {
// //     //               return DropdownButtonFormField<int>(
// //     //                 value: selectedClinicId,
// //     //                 hint: const Text("اختر العيادة"),
// //     //                 items: state.clinicEntity
// //     //                     .map((clinic) => DropdownMenuItem(
// //     //                           value: clinic.id,
// //     //                           child: Text(clinic.name),
// //     //                         ))
// //     //                     .toList(),
// //     //                 onChanged: (val) {
// //     //                   setState(() {
// //     //                     selectedClinicId = val;
// //     //                     selectedDoctorId = null;
// //     //                   });
// //     //                   context.read<DoctorsCubit>().getDoctorsByClinicId(val);
// //     //                 },
// //     //               );
// //     //             }
// //     //             return const SizedBox();
// //     //           },
// //     //         ),
// //     //         const SizedBox(height: 10),
// //     //         BlocBuilder<DoctorsCubit, DoctorsStates>(
// //     //           builder: (context, state) {
// //     //             if (state is GetDoctorsLoading) return const LoadingIndicator();
// //     //             if (state is GetDoctorsSuccess) {
// //     //               return DropdownButtonFormField<String>(
// //     //                 value: selectedDoctorId,
// //     //                 hint: const Text("اختر الدكتور"),
// //     //                 items: state.doctorEntity
// //     //                     .map((doc) => DropdownMenuItem(
// //     //                           value: doc.id,
// //     //                           child: Text("${doc.firstName} ${doc.lastName}"),
// //     //                         ))
// //     //                     .toList(),
// //     //                 onChanged: (val) {
// //     //                   setState(() => selectedDoctorId = val);
// //     //                   context
// //     //                       .read<AppointmentCubit>()
// //     //                       .getAppointmentDoctorById(val ?? '');
// //     //                 },
// //     //               );
// //     //             }
// //     //             return const SizedBox();
// //     //           },
// //     //         ),
// //     //         const SizedBox(height: 10),
// //     //         BlocBuilder<AppointmentCubit, AppointmentStates>(
// //     //           builder: (context, state) {
// //     //             if (state is GetAppointmentLoading) {
// //     //               return const LoadingIndicator();
// //     //             }
// //     //             if (state is GetAppointmentSuccess) {
// //     //               return AppointmentList(
// //     //                 appointments: state.appointmentEntity,
// //     //                 onSelectionChanged: (day, time) {
// //     //                   setState(() {
// //     //                     selectedDate = day;
// //     //                     selectedTime = time;
// //     //                   });
// //     //                 },
// //     //               );
// //     //             }
// //     //             return const SizedBox();
// //     //           },
// //     //         ),
// //     //         const SizedBox(height: 15),
// //     //         ElevatedButton(
// //     //           onPressed: (selectedClinicId != null &&
// //     //                   selectedDoctorId != null &&
// //     //                   selectedDate != null &&
// //     //                   selectedTime != null)
// //     //               ? () {
// //     //                   context.read<BookingCubit>().bookAppointment(
// //     //                         BookingRequest(
// //     //                           doctorId: selectedDoctorId!,
// //     //                           date: selectedDate!,
// //     //                           time: selectedTime!,
// //     //                           isBooking: true,
// //     //                         ),
// //     //                       );
// //     //                   context
// //     //                       .read<DeleteBookingCubit>()
// //     //                       .deleteBooking(widget.oldBookingId);
// //     //                   Navigator.of(context).pop();
// //     //                 }
// //     //               : null,
// //     //           style: ElevatedButton.styleFrom(
// //     //             backgroundColor: ColorManager.primary,
// //     //             shape: RoundedRectangleBorder(
// //     //               borderRadius: BorderRadius.circular(8),
// //     //             ),
// //     //           ),
// //     //           child: Text(
// //     //             "تأكيد الحجز",
// //     //             style: getMediumStyle(color: ColorManager.white),
// //     //           ),
// //     //         )
// //     //       ],
// //     //     ),
// //     //   ),
// //     // );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/core/resources/color_manager.dart';
// import 'package:graduation_project/core/resources/styles_manager.dart';
// import 'package:graduation_project/core/widgets/loading_indicator.dart';
// import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart';
// import 'package:graduation_project/features/doctor/presentation/cubit/doctor_states.dart';
// import 'package:graduation_project/features/doctor/presentation/widgets/appointment_list.dart';
// import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_patient_response/booking_patient_model.dart';
// import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_request.dart';
// import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart';
// import 'package:graduation_project/features/user/booking/presentation/screen/booking_screen.dart';
// import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart';
// import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_states.dart';
// import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart';
// import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';

// class ReBooking extends StatefulWidget {
//   final int oldBookingId;
//   final BookingPatientModel booking;
//   // final int initialClinicId;
//   // final String initialDoctorId;
//   // final String initialDate;
//   // final String initialTime;
//   // final String clinicName;
//   // final String firstName;
//   // final String lastName;

//   const ReBooking({super.key, required this.oldBookingId, required this.booking
//       // required this.initialClinicId,
//       // required this.initialDoctorId,
//       // required this.initialDate,
//       // required this.initialTime,
//       // required this.clinicName,
//       // required this.firstName,
//       // required this.lastName,
//       });

//   @override
//   State<ReBooking> createState() => _ReBookingState();
// }

// class _ReBookingState extends State<ReBooking> {
//   int? selectedClinicId;
//   String? selectedDoctorId;
//   String? selectedDate;
//   String? selectedTime;

//   @override
//   void initState() {
//     super.initState();
//     selectedClinicId = widget.booking.id;
//     selectedDoctorId = widget.booking.doctorId;
//     selectedDate = widget.booking.date;
//     selectedTime = widget.booking.time;

//     context.read<ClinicCubit>().getClinics();
//     context.read<DoctorsCubit>().getDoctorsByClinicId(widget.booking.id);
//     context
//         .read<AppointmentCubit>()
//         .getAppointmentDoctorById(widget.booking.doctorId ?? '');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       // child: Scaffold(
//       // appBar: AppBar(
//       //   title: const Text("إعادة الحجز"),
//       // ),
//       // body:
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _buildClinicDropdown(),
//           const SizedBox(height: 10),
//           _buildDoctorDropdown(),
//           const SizedBox(height: 10),
//           _buildAppointmentList(),
//           const SizedBox(height: 15),
//           _buildConfirmButton(),
//         ],
//       ),
//       // ),
//     );
//   }

// // باقي ال Widgets زي ما كانت من غير تغيير }

//   Widget _buildClinicDropdown() {
//     return BlocBuilder<ClinicCubit, ClinicState>(
//       builder: (context, state) {
//         if (state is GetClinicsLoading) {
//           return const LoadingIndicator();
//         }
//         if (state is GetClinicsSuccess) {
//           bool exists = state.clinicEntity.any(
//             (clinic) => clinic.id == selectedClinicId,
//           );
//           if (!exists) {
//             selectedClinicId = null;
//           }
//           return DropdownButtonFormField<int>(
//             value: selectedClinicId,
//             decoration:
//                 const InputDecoration(contentPadding: EdgeInsets.all(8)),
//             hint: Text(
//               widget.booking.clinicName ?? '',
//               style: getMediumStyle(color: ColorManager.textColor),
//             ),
//             items: state.clinicEntity
//                 .map((clinic) => DropdownMenuItem(
//                       value: clinic.id,
//                       child: Text(clinic.name),
//                     ))
//                 .toList(),
//             onChanged: (val) {
//               setState(() {
//                 selectedClinicId = val;
//                 selectedDoctorId = null;
//               });
//               context.read<DoctorsCubit>().getDoctorsByClinicId(val!);
//             },
//           );
//         }
//         return const SizedBox();
//       },
//     );
//   }

//   Widget _buildDoctorDropdown() {
//     return BlocBuilder<DoctorsCubit, DoctorsStates>(
//       builder: (context, state) {
//         if (state is GetDoctorsLoading) {
//           return const LoadingIndicator();
//         }
//         if (state is GetDoctorsSuccess) {
//           return DropdownButtonFormField<String>(
//             value: selectedDoctorId,
//             decoration:
//                 const InputDecoration(contentPadding: EdgeInsets.all(8)),
//             hint: Text(
//               "${widget.booking.doctorFirstName} ${widget.booking.doctorLastName}",
//               style: getMediumStyle(color: ColorManager.textColor),
//             ),
//             items: state.doctorEntity
//                 .map((doctor) => DropdownMenuItem(
//                       value: doctor.id,
//                       child: Text(
//                         "${doctor.firstName} ${doctor.lastName}",
//                         style: getMediumStyle(color: ColorManager.textColor),
//                       ),
//                     ))
//                 .toList(),
//             onChanged: (val) {
//               setState(() => selectedDoctorId = val);
//               context.read<AppointmentCubit>().getAppointmentDoctorById(val!);
//             },
//           );
//         }
//         return const SizedBox();
//       },
//     );
//   }

//   Widget _buildAppointmentList() {
//     return BlocBuilder<AppointmentCubit, AppointmentStates>(
//       builder: (context, state) {
//         if (state is GetAppointmentLoading) {
//           return const LoadingIndicator();
//         }
//         if (state is GetAppointmentSuccess) {
//           return AppointmentList(
//             appointments: state.appointmentEntity,
//             onSelectionChanged: (day, time) {
//               setState(() {
//                 selectedDate = day;
//                 selectedTime = time;
//               });
//             },
//           );
//         }
//         return const SizedBox();
//       },
//     );
//   }

//   Widget _buildConfirmButton() {
//     bool isChanged = (selectedClinicId != widget.booking.id ||
//         selectedDoctorId != widget.booking.doctorId ||
//         selectedDate != widget.booking.date ||
//         selectedTime != widget.booking.time);
//     return ElevatedButton(
//         onPressed: (selectedClinicId != null &&
//                 selectedDoctorId != null &&
//                 selectedDate != null &&
//                 selectedTime != null &&
//                 isChanged)
//             ? () async {
//                 // أول حاجة نعمل إعادة الحجز الجديد
//                 await context.read<BookingCubit>().bookAppointment(
//                       BookingRequest(
//                         doctorId: selectedDoctorId!,
//                         date: selectedDate!,
//                         time: selectedTime!,
//                         isBooking: true,
//                       ),
//                     );

//                 // بعد كده نمسح الحجز القديم
//                 await context
//                     .read<DeleteBookingCubit>()
//                     .deleteBooking(widget.oldBookingId);

//                 // نعرض SnackBar للتأكيد
//                 if (context.mounted) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text("تمت إعادة الحجز بنجاح"),
//                       backgroundColor: Colors.green,
//                       duration: Duration(seconds: 3),
//                     ),
//                   );

//                   // نرجع للشاشة الأساسية بعد إظهار الـ SnackBar
//                   Future.delayed(const Duration(seconds: 3), () {
//                     Navigator.of(context).pop();
//                   });
//                 }
//               }
//             : null,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: ColorManager.primary,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//         child: Text(
//           "تأكيد الحجز",
//           style: getMediumStyle(color: ColorManager.white),
//         ));
//     // return
//     //     //         const SizedBox(height: 15),
//     //     ElevatedButton(
//     //   onPressed: (selectedClinicId != null &&
//     //           selectedDoctorId != null &&
//     //           selectedDate != null &&
//     //           selectedTime != null)
//     //       ? () {
//     //           context.read<BookingCubit>().bookAppointment(
//     //                 BookingRequest(
//     //                   doctorId: selectedDoctorId!,
//     //                   date: selectedDate!,
//     //                   time: selectedTime!,
//     //                   isBooking: true,
//     //                 ),
//     //               );
//     //           context
//     //               .read<DeleteBookingCubit>()
//     //               .deleteBooking(widget.oldBookingId);
//     //           Navigator.of(context).pop();
//     //         }
//     //       : null,
//     //   style: ElevatedButton.styleFrom(
//     //     backgroundColor: ColorManager.primary,
//     //     shape: RoundedRectangleBorder(
//     //       borderRadius: BorderRadius.circular(8),
//     //     ),
//     //   ),
//     //   child: Text(
//     //     "تأكيد الحجز",
//     //     style: getMediumStyle(color: ColorManager.white),
//     //   ),
//     // );
//   }
// }
// //

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_states.dart';
import 'package:graduation_project/features/doctor/presentation/widgets/appointment_list.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_patient_response/booking_patient_model.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_request.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_states.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';

class ReBooking extends StatefulWidget {
  final int oldBookingId;
  final BookingPatientModel booking;

  const ReBooking(
      {super.key, required this.oldBookingId, required this.booking});

  @override
  State<ReBooking> createState() => _ReBookingState();
}

class _ReBookingState extends State<ReBooking> {
  int? selectedClinicId;
  String? selectedDoctorId;
  String? selectedDate;
  String? selectedTime;
  String? selectedClinicName;
  @override
  void initState() {
    super.initState();
    selectedClinicId = widget.booking.id;
    selectedDoctorId = widget.booking.doctorId;
    selectedDate = widget.booking.date;
    selectedTime = widget.booking.time;
    selectedClinicName = widget.booking.clinicName;
    context.read<ClinicCubit>().getClinics();
    context.read<DoctorsCubit>().getDoctorsByClinicId(widget.booking.id);
    context
        .read<AppointmentCubit>()
        .getAppointmentDoctorById(widget.booking.doctorId ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildClinicDropdown(),
              const SizedBox(height: 10),
              _buildDoctorDropdown(),
              const SizedBox(height: 10),
              _buildAppointmentList(),
              const SizedBox(height: 15),
              _buildConfirmButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClinicDropdown() {
    return BlocBuilder<ClinicCubit, ClinicState>(
      builder: (context, state) {
        if (state is GetClinicsLoading) {
          return Container(
            margin: EdgeInsets.all(10),
            child: const CircularProgressIndicator(
              color: ColorManager.blue,
            ),
          );
        }
        if (state is GetClinicsSuccess) {
          bool exists = state.clinicEntity.any(
            (clinic) => clinic.id == selectedClinicId,
          );
          if (!exists) {
            selectedClinicId = null;
          }
          return DropdownButtonFormField<int>(
            focusColor: ColorManager.primary,
            iconEnabledColor: ColorManager.primary,
            borderRadius: BorderRadius.circular(25),
            value: selectedClinicId,
            decoration: const InputDecoration(
                hoverColor: ColorManager.primary,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(8)),
            // focusColor: ColorManager.primary,
            // hoverColor: ColorManager.primary,
            // contentPadding: EdgeInsets.all(8)),
            hint: Text(
              widget.booking.clinicName ?? '',
              style: getMediumStyle(color: ColorManager.textColor),
            ),
            items: state.clinicEntity
                .map((clinic) => DropdownMenuItem(
                      value: clinic.id,
                      child: Text(
                        clinic.name,
                        style: getMediumStyle(color: ColorManager.textColor),
                      ),
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
      },
    );
  }

  Widget _buildDoctorDropdown() {
    return BlocBuilder<DoctorsCubit, DoctorsStates>(
      builder: (context, state) {
        if (state is GetDoctorsLoading) {
          return Container(
            margin: EdgeInsets.all(10),
            child: const CircularProgressIndicator(
              color: ColorManager.blue,
            ),
          );
        }
        if (state is GetDoctorsSuccess) {
          return DropdownButtonFormField<String>(
            focusColor: ColorManager.primary,
            iconEnabledColor: ColorManager.primary,
            borderRadius: BorderRadius.circular(25),
            value: selectedDoctorId,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                focusColor: ColorManager.primary,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorManager.primary),
                )),
            // contentPadding: EdgeInsets.all(8)),
            hint: Text(
              "${widget.booking.doctorFirstName} ${widget.booking.doctorLastName}",
              style: getMediumStyle(color: ColorManager.textColor),
            ),
            items: state.doctorEntity
                .map((doctor) => DropdownMenuItem(
                      value: doctor.id,
                      child: Text(
                        "${doctor.firstName} ${doctor.lastName}",
                        style: getMediumStyle(color: ColorManager.textColor),
                      ),
                    ))
                .toList(),
            onChanged: (val) {
              setState(() => selectedDoctorId = val);
              context.read<AppointmentCubit>().getAppointmentDoctorById(val!);
            },
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildAppointmentList() {
    return BlocBuilder<AppointmentCubit, AppointmentStates>(
      builder: (context, state) {
        if (state is GetAppointmentLoading) {
          return Container(
            margin: EdgeInsets.all(10),
            child: const CircularProgressIndicator(
              color: ColorManager.blue,
            ),
          );
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
    );
  }

  Widget _buildConfirmButton() {
    bool isChanged = (
        // selectedClinicId != widget.booking.id ||
        // selectedDoctorId != widget.booking.doctorId ||
        selectedDate != widget.booking.date ||
            selectedTime != widget.booking.time);

    return ElevatedButton(
      onPressed: (selectedClinicId != null &&
              selectedDoctorId != null &&
              selectedDate != null &&
              selectedTime != null &&
              isChanged)
          ? () async {
              await context.read<BookingCubit>().bookAppointment(
                    BookingRequest(
                      doctorId: selectedDoctorId!,
                      date: selectedDate!,
                      time: selectedTime!,
                      isBooking: true,
                    ),
                  );
              Navigator.pop(context);
              context
                  .read<DeleteBookingCubit>()
                  .deleteBooking(widget.oldBookingId);

              await context.read<BookingPatientCubit>().getBookingPatient();

              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "تمت إعادة الحجز بنجاح",
                      style: getMediumStyle(color: ColorManager.white),
                    ),
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 2),
                  ),
                );

                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.of(context).pop();
                });
              }
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
    );
  }
}
