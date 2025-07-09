import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/utils/formated.dart';
import 'package:graduation_project/core/utils/ui_utils.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/create_request_model.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/create_appointment_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/doctor_appointments_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:image_picker/image_picker.dart';
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
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  final Map<String, int> daysMap = {
    'الأحد': 0,
    'الإثنين': 1,
    'الثلاثاء': 2,
    'الأربعاء': 3,
    'الخميس': 4,
    'الجمعة': 5,
    'السبت': 6
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
        return Theme(
            data: ThemeData.light().copyWith(
                primaryColor: ColorManager.primary,
                colorScheme: ColorScheme.light(
                  primary: ColorManager.primary,
                ),
                dialogBackgroundColor: ColorManager.white,
                timePickerTheme:
                    TimePickerThemeData(dayPeriodColor: ColorManager.blue)),
            //  Theme.of(context).copyWith(
            //     timePickerTheme: TimePickerThemeData(
            //   backgroundColor: ColorManager.white,
            //   confirmButtonStyle: ButtonStyle(
            //       foregroundColor:
            //           MaterialStatePropertyAll(ColorManager.primary),
            //       textStyle: MaterialStatePropertyAll(
            //           getMediumStyle(color: ColorManager.primary))),
            //   cancelButtonStyle: ButtonStyle(
            //       foregroundColor: MaterialStatePropertyAll(ColorManager.red),
            //       textStyle: MaterialStatePropertyAll(
            //           getMediumStyle(color: ColorManager.red))),
            //   helpTextStyle: getSemiBoldStyle(color: ColorManager.kuhly),
            //   dialHandColor: ColorManager.kuhly,

            //   // dialTextColor: ColorManager.white,
            //   // entryModeIconColor: ColorManager.kuhly,
            //   dayPeriodColor: ColorManager.blue,
            //   // hourMinuteColor: Color.fromARGB(125, 255, 255, 255),
            //   // hourMinuteTextColor: ColorManager.textColor,
            //   // dialBackgroundColor: Color.fromARGB(255, 7, 78, 150),

            //   //   hourMinuteTextColor: ColorManager.kuhly,
            //   //   hourMinuteColor: ColorManager.primaryColor,
            //   //   helpTextStyle: getMediumStyle(color: ColorManager.primary),
            //   // dayPeriodTextColor: ColorManager.kuhly,

            //   // dialTextStyle: getMediumStyle(color: ColorManager.babyGreen),

            //   // ),
            //   // textButtonTheme: TextButtonThemeData(
            //   //     style: TextButton.styleFrom(
            //   //         foregroundColor: ColorManager.primary,
            //   //         textStyle:
            //   //             getMediumStyle(color: ColorManager.textColor))
            // )),
            child: Directionality(
              textDirection: ui.TextDirection.rtl,
              child: Localizations.override(
                  context: context,
                  locale: const Locale('ar'),
                  delegates: GlobalMaterialLocalizations.delegates,
                  child: child!
                  //  Theme(
                  //     data: Theme.of(context).copyWith(
                  //         timePickerTheme: TimePickerThemeData(
                  //             dialTextStyle:
                  //                 getRegularStyle(color: ColorManager.primary),
                  //             hourMinuteTextStyle:
                  //                 getRegularStyle(color: ColorManager.primary),
                  //             helpTextStyle:
                  //                 getRegularStyle(color: ColorManager.primary))
                  // ),
                  // child: child!
                  // ),
                  ),
            ));
      },
    );
    // if (picked != null) {
    //   setState(() {
    //     if (isStart && startTime != null) {
    //       final pickedMinutes = picked.hour * 60 + picked.minute;
    //       final startMinutes = startTime!.hour * 60 + startTime!.minute;
    //       if(pickedMinutes<=startMinutes){
    //         UIUtils.showMessage(context, "لا يجب أن يكون وقت النهاية قبل وقت البداية", C)
    //       }
    //       startTime = picked;
    //       startTimeController.text = picked.format(context);
    //     } else {
    //       endTime = picked;
    //       endTimeController.text = picked.format(context);
    //     }
    //   });
    // }
    if (picked != null) {
      setState(() {
        if (isStart) {
          startTime = picked;
          startTimeController.text = picked.format(context);
        } else {
          endTime = picked;
          endTimeController.text = picked.format(context);
        }
      });
    }
  }

  String getFormattedDuration() {
    final duration = int.tryParse(durationController.text);
    if (duration != null) {
      return '${FormatedDate.convertToArabicNumber(duration)} دقيقة';
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

  Future<void> _selectTime(TextEditingController controller) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      final now = DateTime.now();
      final dt =
          DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
      final formattedTime = DateFormat.Hm().format(dt);
      setState(() {
        controller.text = formattedTime;
      });
    }
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
      UIUtils.showMessage(
        context,
        'املأ جميع الحقول',
        ColorManager.red,
      );
      return;
    }

    final duration = int.tryParse(durationController.text);
    if (duration == null) {
      UIUtils.showMessage(
        context,
        'مدة غير صالحة',
        ColorManager.red,
      );
      return;
    }
    final startMinutes = startTime!.hour * 60 + startTime!.minute;
    final endMinutes = endTime!.hour * 60 + endTime!.minute;
    if (endMinutes <= startMinutes) {
      UIUtils.showMessage(
          context, "يجب أن يكون وقت النهاية بعد وقت البداية", ColorManager.red);
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
                    runSpacing: 10,
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
                  const SizedBox(height: 30),
                  // InkWell(
                  //     onTap: () => pickTime(true),
                  //     child: Row(
                  //       children: [
                  // Text(
                  //     startTime == null
                  //         ? 'اختر ساعة البداية'
                  //         : 'ساعة البداية : ',
                  //     style:
                  //         getMediumStyle(color: ColorManager.primary)),
                  // const SizedBox(
                  //   width: 15,
                  // ),
                  Text(
                    "اختر ساعة البداية",
                    style: getMediumStyle(color: ColorManager.primary),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .4,
                      child: CustomTextField(
                        backgroundColor: ColorManager.transparent,
                        readOnly: true,
                        onTap: () {
                          pickTime(true);
                          //   startTimeController.text = startTime.toString();
                          //   _selectTime(startTimeController);
                          //   setState(() {});
                        },
                        controller: startTimeController,
                        textInputType: TextInputType.number,
                        hintTextStyle:
                            getRegularStyle(color: ColorManager.grey),
                      )),

                  Text(
                    "اختر ساعة النهاية",
                    style: getMediumStyle(color: ColorManager.primary),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .4,
                      child: CustomTextField(
                        readOnly: true,
                        onTap: () {
                          // endTimeController.text = endTime.toString();
                          // _selectTime(endTimeController);
                          // setState(() {});
                          pickTime(false);
                        },
                        backgroundColor: ColorManager.transparent,
                        controller: endTimeController,
                        textInputType: TextInputType.number,
                        hintTextStyle:
                            getRegularStyle(color: ColorManager.grey),
                      )),
                  // InkWell(
                  //   onTap: () => pickTime(false),
                  //   child: Row(
                  //     children: [
                  //       Text(
                  //           endTime == null
                  //               ? 'اختر ساعة النهاية'
                  //               : 'ساعة النهاية : ',
                  //           style: getMediumStyle(color: ColorManager.primary)),
                  //       const SizedBox(
                  //         width: 15,
                  //       ),
                  //       Text(
                  //           endTime == null
                  //               ? ''
                  //               : FormatedDate.formateTimeToArabic(endTime!),
                  //           style: getMediumStyle(color: ColorManager.primary))
                  //     ],
                  //   ),
                  // child: Text(
                  //     endTime == null
                  //         ? 'اختر ساعة النهاية'
                  //         : 'ساعة النهاية :   ${formateTimeToArabic(endTime!)}',
                  //     style: getMediumStyle(color: ColorManager.primary)),
                  // ),
                  const SizedBox(height: 25),
                  Text(
                    'اختر مدة الكشف',
                    style: getMediumStyle(color: ColorManager.primary),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .4,
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
                          width: MediaQuery.of(context).size.width * .6,
                          height: 40,
                          child: CustomButton(
                            backgroundColor: ColorManager.primary,
                            onTap: () {
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
