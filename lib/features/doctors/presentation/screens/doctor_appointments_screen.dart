// // // import 'package:flutter/foundation.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // import 'package:graduation_project/core/di/service_locator.dart';
// // // import 'package:graduation_project/core/widgets/loading_indicator.dart';
// // // import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
// // // import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/doctor_appointments_cubit.dart';

// // // class DoctorAppointmentsScreen extends StatelessWidget {
// // //   static const doctorAppointments = '/doctorAppointments';
// // //   const DoctorAppointmentsScreen({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return BlocProvider(
// // //         create: (context) => serviceLocator.get<DoctorAppointmentsCubit>()
// // //           ..getDoctorsAppointments,
// // //         child: Scaffold(
// // //           appBar: AppBar(
// // //             title: Text("المواعيد المسجلة"),
// // //           ),
// // //           body: BlocBuilder<DoctorAppointmentsCubit, AppointmentStates>(
// // //             builder: (context, state) {
// // //               if (state is GetAppointmentLoading) {
// // //                 return LoadingIndicator();
// // //               } else if (state is GetDoctorAppointmentsSuccess) {
// // //                 return ListView.builder(
// // //                   itemBuilder: (context, index) {
// // //                     final appointment = state.appointment[index];
// // //                     return ListTile(
// // //                       title: Text("اليوم: ${appointment.day}"),
// // //                       subtitle: Text(
// // //                           "من ${appointment.startTime} إلي ${appointment.endTime}"),
// // //                     );
// // //                   },
// // //                   itemCount: state.appointment.length,
// // //                 );
// // //               } else if (state is GetAppointmentError) {
// // //                 return Center(
// // //                   child: Text(state.message),
// // //                 );
// // //               }
// // //               return Container();
// // //             },
// // //           ),
// // //         ));
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:graduation_project/core/constants.dart';
// // import 'package:graduation_project/core/di/service_locator.dart';
// // import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/doctors_appointment_model.dart';
// // import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/doctors_appointment_response.dart';
// // import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
// // import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/doctor_appointments_cubit.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class DoctorAppointmentsScreen extends StatelessWidget {
// //   static const doctorAppointments = '/doctorAppointments';

// //   const DoctorAppointmentsScreen({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     Future.delayed(Duration.zero, () {
// //       context.read<DoctorAppointmentsCubit>().getAppointments();
// //     });
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('مواعيدي'),
// //       ),
// //       body: BlocBuilder<DoctorAppointmentsCubit, AppointmentStates>(
// //         builder: (context, state) {
// //           if (state is GetAppointmentLoading) {
// //             return const Center(child: CircularProgressIndicator());
// //           } else if (state is GetDoctorAppointmentsSuccess) {
// //             final appointments = state.appointment;

// //             if (appointments.isEmpty) {
// //               return const Center(child: Text('لا يوجد مواعيد.'));
// //             }

// //             return SingleChildScrollView(
// //               child: ListView.builder(
// //                 padding: const EdgeInsets.all(16),
// //                 itemCount: appointments.length,
// //                 itemBuilder: (context, index) {
// //                   final appointment = appointments[index];
// //                   return AppointmentItem(appointment: appointment);
// //                 },
// //               ),
// //             );
// //           } else if (state is GetAppointmentError) {
// //             return Center(child: Text(state.message));
// //           } else {
// //             return const SizedBox.shrink();
// //           }
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           // هنا هنتنقل لشاشة إنشاء ميعاد جديد
// //         },
// //         child: const Icon(Icons.add),
// //       ),
// //     );
// //   }
// // }

// // class AppointmentItem extends StatelessWidget {
// //   final DoctorsAppointmentModel appointment;

// //   const AppointmentItem({Key? key, required this.appointment})
// //       : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       elevation: 4,
// //       margin: const EdgeInsets.only(bottom: 16),
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //       child: Padding(
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               "اليوم: ${_mapDay(appointment.day ?? 0)}",
// //               style: const TextStyle(fontWeight: FontWeight.bold),
// //             ),
// //             const SizedBox(height: 8),
// //             Text("من: ${appointment.startTime}"),
// //             Text("إلى: ${appointment.endTime}"),
// //             Text("المدة: ${appointment.duration} دقيقة"),
// //             const SizedBox(height: 8),
// //             Text(
// //               appointment.isAvailable ?? true ? "متاح" : "غير متاح",
// //               style: TextStyle(
// //                 color:
// //                     appointment.isAvailable ?? true ? Colors.green : Colors.red,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   String _mapDay(int day) {
// //     switch (day) {
// //       case 0:
// //         return "الأحد";
// //       case 1:
// //         return "الإثنين";
// //       case 2:
// //         return "الثلاثاء";
// //       case 3:
// //         return "الأربعاء";
// //       case 4:
// //         return "الخميس";
// //       case 5:
// //         return "الجمعة";
// //       case 6:
// //         return "السبت";
// //       default:
// //         return "يوم غير معروف";
// //     }
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:graduation_project/core/resources/color_manager.dart';
// import 'package:graduation_project/core/resources/styles_manager.dart';

// class DoctorAppointmentsScreen extends StatelessWidget {
//   const DoctorAppointmentsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final appointments = [
//       {
//         'اسم المرسض': "سهيله",
//         "اليوم": "الأحد",
//         'الوقت': "9.00صباحاً",
//         'الحالة': 'محجوزة'
//       },
//       {
//         'اسم المرسض': "سهيله",
//         "اليوم": "الأحد",
//         'الوقت': "9.00صباحاً",
//         'الحالة': 'محجوزة'
//       },
//       {
//         'اسم المرسض': "سهيله",
//         "اليوم": "الأحد",
//         'الوقت': "9.00صباحاً",
//         'الحالة': 'محجوزة'
//       },
//       {
//         'اسم المرسض': "سهيله",
//         "اليوم": "الأحد",
//         'الوقت': "9.00صباحاً",
//         'الحالة': 'محجوزة'
//       },
//       {
//         'اسم المرسض': "سهيله",
//         "اليوم": "الأحد",
//         'الوقت': "9.00صباحاً",
//         'الحالة': 'محجوزة'
//       }
//     ];
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'ألمواعيد المسجلة',
//           style: getMediumStyle(color: ColorManager.textColor),
//         ),
//       ),
//       body: appointments.isEmpty
//           ? const Center(
//               child: Text("لا توجد مواعيد متاحة"),
//             )
//           : ListView.builder(
//               itemBuilder: (context, index) {
//                 final appointment = appointments[index];
//                 return Card(
//                   child: Column(
//                     children: [
//                       Text("اليوم")
//                     ],
//                   ),
//                 );
//               },
//               itemCount: appointments.length,
//             ),
//     );
//   }
// // }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/features/doctors/presentation/widgets/appointment_item.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/doctor_appointments_cubit.dart';

class DoctorAppointmentsScreen extends StatelessWidget {
  static const doctorAppointments = '/doctorAppointments';
  const DoctorAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
    // Directionality(
    //   textDirection: TextDirection.rtl,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('المواعيد المسجلة'),
    //       centerTitle: true,
    //     ),
    //     body: BlocBuilder<DoctorAppointmentsCubit, AppointmentStates>(
    //       builder: (context, state) {
    //         if (state is GetAppointmentLoading) {
    //           return const Center(child: CircularProgressIndicator());
    //         } else if (state is GetDoctorAppointmentsSuccess) {
    //           final appointments = state.appointment;

    //           return Column(
    //             children: [
    //               Container(
    //                 color: Colors.blue.shade700,
    //                 padding: const EdgeInsets.symmetric(vertical: 12),
    //                 child: const Row(
    //                   children: [
    //                     Expanded(
    //                       child: Center(
    //                         child: Text("اليوم",
    //                             style: TextStyle(color: Colors.white)),
    //                       ),
    //                     ),
    //                     Expanded(
    //                       child: Center(
    //                         child: Text("البداية",
    //                             style: TextStyle(color: Colors.white)),
    //                       ),
    //                     ),
    //                     Expanded(
    //                       child: Center(
    //                         child: Text("النهاية",
    //                             style: TextStyle(color: Colors.white)),
    //                       ),
    //                     ),
    //                     Expanded(
    //                       child: Center(
    //                         child: Text("الإجراءات",
    //                             style: TextStyle(color: Colors.white)),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Expanded(
    //                 child: ListView.builder(
    //                   itemCount: appointments.length,
    //                   itemBuilder: (context, index) {
    //                     final appointment = appointments[index];
    //                     return DoctorAppointmentItem(
    //                       day: _getDayName(appointment.day ?? 0),
    //                       startTime: appointment.startTime ?? '',
    //                       endTime: appointment.endTime ?? '',
    //                       onEdit: () {
    //                         // أكشن التعديل
    //                       },
    //                       onDelete: () {
    //                         // أكشن الحذف
    //                       },
    //                     );
    //                   },
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.all(12.0),
    //                 child: ElevatedButton(
    //                   onPressed: () {
    //                     // إنشاء ميعاد جديد
    //                   },
    //                   style: ElevatedButton.styleFrom(
    //                     backgroundColor: Colors.blue,
    //                     padding: const EdgeInsets.symmetric(
    //                         horizontal: 24, vertical: 12),
    //                   ),
    //                   child: const Text("إنشاء ميعاد جديد"),
    //                 ),
    //               ),
    //             ],
    //           );
    //         } else if (state is GetAppointmentError) {
    //           return Center(
    //               child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               ElevatedButton(
    //                   onPressed: () {
    //                     context
    //                         .read<DoctorAppointmentsCubit>()
    //                         .getAppointments();
    //                   },
    //                   child: const Text("حاول مرة أخرى")),
    //               Text(state.message),
    //             ],
    //           ));
    //         } else {
    //           return const SizedBox();
    //         }
    //       },
    //     ),
    //   ),
    // );
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
// class DoctorAppointmentsScreen extends StatelessWidget {
//   static const doctorAppointments = '/doctorAppointments';
//   const DoctorAppointmentsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: BlocBuilder<DoctorAppointmentsCubit, AppointmentStates>(
//         builder: (context, state) {
//           if (state is GetAppointmentLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is GetDoctorAppointmentsSuccess) {
//             final appointments = state.appointment;

//             return Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                         child: Text("اليوم",
//                             textAlign: TextAlign.center,
//                             style: Theme.of(context).textTheme.titleSmall)),
                        
//                     Expanded(
//                         child: Text("البداية",
//                             textAlign: TextAlign.center,
//                             style: Theme.of(context).textTheme.titleSmall)),
//                     Expanded(
//                         child: Text("النهاية",
//                             textAlign: TextAlign.center,
//                             style: Theme.of(context).textTheme.titleSmall)),
//                     Expanded(
//                         child: Text("الإجراءات",
//                             textAlign: TextAlign.center,
//                             style: Theme.of(context).textTheme.titleSmall)),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 500,
//                   child: ListView.builder(
//                     itemCount: appointments.length,
//                     itemBuilder: (context, index) {
//                       final appointment = appointments[index];
//                       return DoctorAppointmentItem(
//                         day: _getDayName(appointment.day ?? 0),
//                         startTime: appointment.startTime ?? '',
//                         endTime: appointment.endTime ?? '',
//                         isAvailable: appointment.isAvailable ?? true,
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             );
//           } else if (state is GetAppointmentError) {
//             return Center(
//                 child: Column(
//               children: [
//                 ElevatedButton(
//                     onPressed: () {
//                       context.read<DoctorAppointmentsCubit>().getAppointments();
//                     },
//                     child: const Text("حاول مرة أخرى")),
//                 Text(state.message),
//               ],
//             ));
//           } else {
//             return const SizedBox();
//           }
//         },
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
