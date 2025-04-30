// import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/create_request_model.dart';
// import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
// import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/create_appointment_cubit.dart';
// import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/doctor_appointments_cubit.dart';
// import 'package:intl/intl.dart';

// class CreateAppointmentScreen extends StatefulWidget {
//   static const createAppointment = "/createAppointment";
//   final String doctorId;
//   const CreateAppointmentScreen({super.key, required this.doctorId});

//   @override
//   State<CreateAppointmentScreen> createState() =>
//       _CreateAppointmentScreenState();
// }

// class _CreateAppointmentScreenState extends State<CreateAppointmentScreen> {
//   final List<int> selectedDays = [];
//   TimeOfDay? startTime;
//   TimeOfDay? endTime;
//   final TextEditingController durationController = TextEditingController();

//   final Map<String, int> daysMap = {
//     'السبت': 0,
//     'الأحد': 1,
//     'الإثنين': 2,
//     'الثلاثاء': 3,
//     'الأربعاء': 4,
//     'الخميس': 5,
//     'الجمعة': 6,
//   };

//   Future<void> pickTime(bool isStart) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (picked != null) {
//       setState(() {
//         if (isStart) {
//           startTime = picked;
//         } else {
//           endTime = picked;
//         }
//       });
//     }
//   }

//   String formatTimeOfDay(TimeOfDay time) {
//     final now = DateTime.now();
//     final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
//     return DateFormat.Hms().format(dt);
//   }

//   void submit() {
//     if (selectedDays.isEmpty ||
//         startTime == null ||
//         endTime == null ||
//         durationController.text.isEmpty) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text('املأ جميع الحقول')));
//       return;
//     }

//     final duration = int.tryParse(durationController.text);
//     if (duration == null) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text('مدة غير صالحة')));
//       return;
//     }

//     for (final day in selectedDays) {
//       final request = CreateRequestModel(
//         day: day,
//         startTime: formatTimeOfDay(startTime!),
//         endTime: formatTimeOfDay(endTime!),
//         duration: duration,
//         doctorId: widget.doctorId,
//       );

//       context.read<CreateAppointmentCubit>().createAppointment(request);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(title: const Text('إنشاء ميعاد جديد')),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text('اختر أيام العمل'),
//                 Wrap(
//                   children: daysMap.entries.map((entry) {
//                     return CheckboxListTile(
//                       title: Text(entry.key),
//                       value: selectedDays.contains(entry.value),
//                       onChanged: (val) {
//                         setState(() {
//                           if (val == true) {
//                             selectedDays.add(entry.value);
//                           } else {
//                             selectedDays.remove(entry.value);
//                           }
//                         });
//                       },
//                     );
//                   }).toList(),
//                 ),
//                 const SizedBox(height: 16),
//                 TextButton(
//                   onPressed: () => pickTime(true),
//                   child: Text(startTime == null
//                       ? 'اختر ساعة البداية'
//                       : 'ساعة البداية: ${startTime!.format(context)}'),
//                 ),
//                 TextButton(
//                   onPressed: () => pickTime(false),
//                   child: Text(endTime == null
//                       ? 'اختر ساعة النهاية'
//                       : 'ساعة النهاية: ${endTime!.format(context)}'),
//                 ),
//                 TextField(
//                   controller: durationController,
//                   keyboardType: TextInputType.number,
//                   decoration:
//                       const InputDecoration(labelText: 'اختر مدة الكشف بالدقائق'),
//                 ),
//                 const SizedBox(height: 24),
//                 BlocConsumer<CreateAppointmentCubit, AppointmentStates>(
//                   listener: (context, state) {
//                     if (state is CreateAppointmentSuccess) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('تم إنشاء الموعد بنجاح')),
//                       );
//                       Navigator.pop(context);
//                     } else if (state is GetAppointmentError) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text(state.message)),
//                       );
//                     }
//                   },
//                   builder: (context, state) {
//                     return ElevatedButton(
//                       onPressed: () {
//                         state is GetAppointmentLoading ? null : submit;
//                         context.read<DoctorAppointmentsCubit>().getAppointments();
//                       },
//                       child: const Text('إنشاء'),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
/////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/create_request_model.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/create_appointment_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/doctor_appointments_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class CreateAppointmentScreen extends StatefulWidget {
  static const createAppointment = "/createAppointment";
  final String doctorId;
  const CreateAppointmentScreen({super.key, required this.doctorId});

  @override
  State<CreateAppointmentScreen> createState() =>
      _CreateAppointmentScreenState();
}

class _CreateAppointmentScreenState extends State<CreateAppointmentScreen> {
  final List<int> selectedDays = [];
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  final TextEditingController durationController = TextEditingController();

  final Map<String, int> daysMap = {
    'السبت': 0,
    'الأحد': 1,
    'الإثنين': 2,
    'الثلاثاء': 3,
    'الأربعاء': 4,
    'الخميس': 5,
    'الجمعة': 6,
  };
// /
  Future<void> pickTime(bool isStart) async {
//   //   final TimeOfDay? picked = await showTimePicker(
//   //     context: context,
//   //     initialTime: TimeOfDay.now(),
//   //     initialEntryMode: TimePickerEntryMode.dial, // تأكد من الشكل
//   //     builder: (context, child) {
//   //       return Directionality(
//   //         textDirection: ui.TextDirection.rtl,
//   //         child: Localizations.override(
//   //           context: context,
//   //           locale: const Locale('ar'),
//   //           delegates: GlobalMaterialLocalizations.delegates,
//   //           child: Theme(
//   //             data: Theme.of(context).copyWith(
//   //               timePickerTheme: TimePickerThemeData(
//   //                 dialTextStyle: getRegularStyle(color: ColorManager.primary),
//   //                 hourMinuteTextStyle:
//   //                     getRegularStyle(color: ColorManager.primary),
//   //                 helpTextStyle: getRegularStyle(color: ColorManager.primary),
//   //               ),
//   //             ),
//   //             child: child!,
//   //           ),
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return
            // Theme(
            //       data: Theme.of(context).copyWith(
            //           timePickerTheme: TimePickerThemeData(
            //               dialTextStyle: getRegularStyle(color: ColorManager.white),
            //               hourMinuteTextStyle: getRegularStyle(
            //                 color: ColorManager.white,
            //               ),
            //               helpTextStyle: getRegularStyle(color: ColorManager.primary))),
            Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Localizations.override(
            context: context,
            locale: const Locale('ar'),
            delegates: GlobalMaterialLocalizations.delegates,
            child: Theme(
                data: Theme.of(context).copyWith(
                    timePickerTheme: TimePickerThemeData(
                        dialTextStyle:
                            getRegularStyle(color: ColorManager.primary),
                        hourMinuteTextStyle:
                            getRegularStyle(color: ColorManager.primary),
                        helpTextStyle:
                            getRegularStyle(color: ColorManager.primary))),
                child: child!),
          ),
        );
        // );
      },
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }
  // Future<void> pickTime(bool isStart) async {
  //   final TimeOfDay? picked = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //     builder: (context, child) {
  //       return Directionality(
  //         textDirection: ui.TextDirection.rtl,
  //         child: Localizations.override(
  //           context: context,
  //           locale: const Locale('ar'),
  //           delegates: GlobalMaterialLocalizations.delegates,
  //           child: Theme(
  //             data: Theme.of(context).copyWith(
  //               timePickerTheme: const TimePickerThemeData(
  //                 helpTextStyle: TextStyle(
  //                     color: Colors.blue,
  //                     fontFamily: 'Cairo'), // اسم الخط اللي بتستخدمه
  //                 dialTextStyle: TextStyle(color: Colors.black),
  //                 hourMinuteTextStyle: TextStyle(color: Colors.black),
  //               ),
  //             ),
  //             child: child!,
  //           ),
  //         ),
  //       );
  //     },
  //   );

  //   if (picked != null) {
  //     setState(() {
  //       if (isStart) {
  //         startTime = picked;
  //       } else {
  //         endTime = picked;
  //       }
  //     });
  //   }
  // }

  String formateTimeToArabic(TimeOfDay time) {
    int hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    int minute = time.minute;
    String period = time.period == DayPeriod.am ? 'ص' : 'م';

    String hourStr = convertToArabicNumber(hour, minDigits: 2);
    String minuteStr = convertToArabicNumber(minute, minDigits: 2);

    return '$hourStr:$minuteStr $period';
  }

  String convertToArabicNumber(int number, {int minDigits = 1}) {
    const arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    final digits = number.toString().padLeft(minDigits, '0');
    return digits.split('').map((e) => arabicNumbers[int.parse(e)]).join();
  }

  String getFormattedDuration() {
    final duration = int.tryParse(durationController.text);
    if (duration != null) {
      return '${convertToArabicNumber(duration)} دقيقة';
    }
    return '';
  }
  // String formateTimeToArabic(TimeOfDay time) {
  //   int hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
  //   int minute = time.minute;
  //   String period = time.period == DayPeriod.am ? 'م' : 'ص';
  //   String hourStr = convertToArabicNumber(hour);
  //   String minuteStr = minute < 10
  //       ? convertToArabicNumber(minute)
  //       : convertToArabicNumber(minute);
  //   return '$hourStr : $minuteStr $period';
  // }

  // String convertToArabicNumber(int number) {
  //   const arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
  //   return number
  //       .toString()
  //       .split('')
  //       .map((e) => arabicNumbers[int.parse(e)])
  //       .join();
  // }

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.Hms().format(dt);
  }

  // String formatTimeToArabicString(TimeOfDay time) {
  //   final now = DateTime.now();
  //   final dt = DateTime(now.year, now.month, now.day, now.hour, now.minute);
  //   String period = time.period == DayPeriod.am ? 'ص' : 'م';
  //   String formatted = DateFormat('hh:mm', 'ar').format(dt);
  //   return '$formatted $period';
  // }

  void submit() {
    if (selectedDays.isEmpty ||
        startTime == null ||
        endTime == null ||
        durationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('املأ جميع الحقول'),
          backgroundColor: ColorManager.red,
        ),
      );
      return;
    }

    final duration = int.tryParse(durationController.text);
    if (duration == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('مدة غير صالحة'),
        backgroundColor: ColorManager.red,
      ));
      return;
    }

    for (final day in selectedDays) {
      final request = CreateRequestModel(
        day: day,
        startTime: formatTimeOfDay(startTime!),
        endTime: formatTimeOfDay(endTime!),
        duration: duration,
        doctorId: widget.doctorId,
      );

      context.read<CreateAppointmentCubit>().createAppointment(request);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            //   title: Text(
            // 'إنشاء ميعاد جديد',
            // style: getSemiBoldStyle(color: ColorManager.textColor),
            // )
            ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add_box_outlined, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text(
                        'إنشاء ميعاد جديد',
                        style: getBoldStyle(color: ColorManager.primary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text('اختر أيام العمل',
                      style: getMediumStyle(color: ColorManager.primary)),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 15,
                    children: daysMap.entries.map((entry) {
                      return FilterChip(
                        labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                        checkmarkColor: ColorManager.primary,
                        label: Text(
                          entry.key,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                                width: .4, color: ColorManager.primary)),
                        labelStyle:
                            getRegularStyle(color: ColorManager.textColor),
                        // backgroundColor: ColorManager.blue,
                        selectedColor: ColorManager.blue,
                        selected: selectedDays.contains(entry.value),
                        onSelected: (val) {
                          setState(() {
                            if (val) {
                              selectedDays.add(entry.value);
                            } else {
                              selectedDays.remove(entry.value);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 40),
                  InkWell(
                      onTap: () => pickTime(true),
                      child: Row(
                        children: [
                          Text(
                              startTime == null
                                  ? 'اختر ساعة البداية'
                                  : 'ساعة البداية : ',
                              style:
                                  getMediumStyle(color: ColorManager.primary)),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                              startTime == null
                                  ? ''
                                  : formateTimeToArabic(startTime!),
                              style:
                                  getMediumStyle(color: ColorManager.primary))
                        ],
                      )
                      // Text(
                      //     startTime == null
                      //         ? 'اختر ساعة البداية'
                      //         : 'ساعة البداية :   ${formateTimeToArabic(startTime!)}',
                      //     style: getMediumStyle(color: ColorManager.primary)),
                      ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () => pickTime(false),
                    child: Row(
                      children: [
                        Text(
                            endTime == null
                                ? 'اختر ساعة النهاية'
                                : 'ساعة النهاية : ',
                            style: getMediumStyle(color: ColorManager.primary)),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                            endTime == null
                                ? ''
                                : formateTimeToArabic(endTime!),
                            style: getMediumStyle(color: ColorManager.primary))
                      ],
                    ),
                    // child: Text(
                    //     endTime == null
                    //         ? 'اختر ساعة النهاية'
                    //         : 'ساعة النهاية :   ${formateTimeToArabic(endTime!)}',
                    //     style: getMediumStyle(color: ColorManager.primary)),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'اختر مدة الكشف',
                    style: getMediumStyle(color: ColorManager.primary),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .32,
                      child: CustomTextField(
                        hint: 'بالدقائق',
                        controller: durationController,
                        textInputType: TextInputType.number,
                        hintTextStyle:
                            getRegularStyle(color: ColorManager.grey),
                      )
                      //  TextField(
                      //   controller: durationController,
                      //   keyboardType: TextInputType.number,
                      //   decoration:Outline
                      //   //  InputDecoration(
                      //   //     hintText: 'بالدقائق',
                      //   //     hintStyle: getRegularStyle(color: ColorManager.grey)
                      //   ),
                      // ),
                      ),
                  const SizedBox(height: 32),
                  BlocConsumer<CreateAppointmentCubit, AppointmentStates>(
                    listener: (context, state) {
                      if (state is CreateAppointmentSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              backgroundColor: ColorManager.green,
                              content: Text('تم إنشاء الموعد بنجاح')),
                        );
                        Navigator.pop(context);
                      } else if (state is GetAppointmentError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                            backgroundColor: ColorManager.red,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * .5,
                          height: 40,
                          child: CustomButton(
                            backgroundColor: ColorManager.primary,
                            onTap:
                                // ElevatedButton(
                                //   style: ElevatedButton.styleFrom(
                                //     backgroundColor: ColorManager.primary,
                                //   ),
                                () {
                              if (state is! GetAppointmentLoading) {
                                submit();
                                context
                                    .read<DoctorAppointmentsCubit>()
                                    .getAppointments();
                              } else {
                                const CircularProgressIndicator(
                                  color: ColorManager.primary,
                                );
                              }
                            },
                            textStyle:
                                getMediumStyle(color: ColorManager.white),
                            label: "إنشاء موعد",
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
