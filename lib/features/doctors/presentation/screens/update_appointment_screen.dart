import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/doctors_appointment_model.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/update_appointment_request.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/doctor_appointments_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/update_appointment_cubit.dart';
import 'package:intl/intl.dart';

class UpdateAppointmentScreen extends StatefulWidget {
  static const updateAppointment = "/updateAppointment";
  final DoctorsAppointmentModel appointment;

  const UpdateAppointmentScreen({super.key, required this.appointment});

  @override
  State<UpdateAppointmentScreen> createState() =>
      _UpdateAppointmentScreenState();
}

class _UpdateAppointmentScreenState extends State<UpdateAppointmentScreen> {
  late int selectedDay;
  late TextEditingController startTimeController;
  late TextEditingController endTimeController;
  late TextEditingController durationController;

  @override
  void initState() {
    super.initState();
    selectedDay = widget.appointment.day ?? 0;
    startTimeController =
        TextEditingController(text: widget.appointment.startTime);
    endTimeController = TextEditingController(text: widget.appointment.endTime);
    durationController =
        TextEditingController(text: widget.appointment.duration.toString());
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

  @override
  void dispose() {
    startTimeController.dispose();
    endTimeController.dispose();
    durationController.dispose();
    super.dispose();
  }

  // String _getDayName(int dayNumber) {
  //   const days = [
  //     'الأحد',
  //     'الاثنين',
  //     'الثلاثاء',
  //     'الأربعاء',
  //     'الخميس',
  //     'الجمعة',
  //     'السبت'
  //   ];
  //   return days[dayNumber % 7];
  // }
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
          "تعديل الموعد",
          style: getSemiBoldStyle(color: ColorManager.textColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text('اختر أيام العمل',
                        style: getMediumStyle(color: ColorManager.primary)),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: daysMap.entries.map((entry) {
                        final isSelected = selectedDay == entry.value;
                        return FilterChip(
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 4),
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
                          selected: isSelected,
                          onSelected: (val) {
                            setState(() {
                              selectedDay = entry.value;
                            });
                          },
                        );
                      }).toList(),
                      // FilterChip(
                      //         labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                      //         checkmarkColor: ColorManager.primary,
                      //         label: Text(
                      //           entry.key,
                      //         ),
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(10),
                      //             side: const BorderSide(
                      //                 width: .4, color: ColorManager.primary)),
                      //         labelStyle:
                      //             getRegularStyle(color: ColorManager.textColor),
                      //         // backgroundColor: ColorManager.blue,
                      //         selectedColor: ColorManager.blue,
                      //         selected: selectedDays.contains(entry.value),
                      //         onSelected: (val) {
                      //           setState(() {
                      //             if (val) {
                      //               selectedDays.add(entry.value);
                      //             } else {
                      //               selectedDays.remove(entry.value);
                      //             }
                      //           });
                      //         },
                      //       );
                      // // List.generate(7, (index) {
                      //   final isSelected = selectedDay == index;
                      //   return GestureDetector(
                      //     onTap: () {
                      //       setState(() {
                      //         selectedDay = index;
                      //       });
                      //     },
                      //     child: Container(
                      //       margin: const EdgeInsets.symmetric(horizontal: 6),
                      //       padding: const EdgeInsets.symmetric(
                      //           horizontal: 16, vertical: 10),
                      //       decoration: BoxDecoration(
                      //         color: isSelected
                      //             ? ColorManager.primary
                      //             : Colors.grey.shade200,
                      //         borderRadius: BorderRadius.circular(12),
                      //         border: Border.all(
                      //           color:
                      //               isSelected ? ColorManager.primary : Colors.grey,
                      //         ),
                      //       ),
                      //       child: Text(
                      //         _getDayName(index),
                      //         style: TextStyle(
                      //           color: isSelected
                      //               ? Colors.white
                      //               : Colors.grey.shade800,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ),
                      //   );
                      // }),
                    ),
                    const SizedBox(height: 30),
                    // TextField(
                    //   controller: startTimeController,
                    //   readOnly: true,
                    //   onTap: () => _selectTime(startTimeController),
                    //   decoration: const InputDecoration(
                    //     labelText: "وقت البداية",
                    //     hintText: "اختر وقت البدء",
                    //     border: OutlineInputBorder(),
                    //   ),
                    // ),
                    Text(
                      "وقت البداية",
                      style: getMediumStyle(color: ColorManager.primary),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * .32,
                        child: CustomTextField(
                          readOnly: true,
                          onTap: () => _selectTime(startTimeController),
                          hint: "اختر وقت البدء",
                          controller: startTimeController,
                          textInputType: TextInputType.number,
                          hintTextStyle:
                              getRegularStyle(color: ColorManager.grey),
                        )),
                    const SizedBox(height: 16),
                    Text(
                      "وقت النهاية",
                      style: getMediumStyle(color: ColorManager.primary),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * .32,
                        child: CustomTextField(
                          readOnly: true,
                          onTap: () => _selectTime(endTimeController),
                          hint: "اختر وقت الإنتهاء",
                          controller: endTimeController,
                          textInputType: TextInputType.number,
                          hintTextStyle:
                              getRegularStyle(color: ColorManager.grey),
                        )),
                    // TextField(
                    //   controller: endTimeController,
                    //   readOnly: true,
                    //   onTap: () => _selectTime(endTimeController),
                    //   decoration: const InputDecoration(
                    //     labelText: "وقت النهاية",
                    //     hintText: "اختر وقت الإنتهاء",
                    //     border: OutlineInputBorder(),
                    //   ),
                    // ),
                    const SizedBox(height: 16),
                    // TextField(
                    //   controller: durationController,
                    //   keyboardType: TextInputType.number,
                    //   decoration: const InputDecoration(
                    //     labelText: "المدة (بالدقائق)",
                    //     border: OutlineInputBorder(),
                    //   ),
                    // ),
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
                        )),
                    // const Spacer(),
                    const SizedBox(
                      height: 30,
                    ),
                    BlocConsumer<UpdateAppointmentCubit, AppointmentStates>(
                      listener: (context, state) {
                        if (state is UpdateAppointmentSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: ColorManager.green,
                                content: Text('تم تحديث الموعد بنجاح')),
                          );
                          // Navigator.pop(context);
                          context
                              .read<DoctorAppointmentsCubit>()
                              .getAppointments();
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
                        if (state is GetAppointmentLoading) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: ColorManager.primary,
                          ));
                        }
                        return Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                            height: 40,
                            child: CustomButton(
                              backgroundColor: ColorManager.primary,
                              label: "تحديث الموعد",
                              onTap: () {
                                context
                                    .read<UpdateAppointmentCubit>()
                                    .updateAppointment(
                                      UpdateAppointmentRequest(
                                        id: widget.appointment.id,
                                        day: selectedDay,
                                        startTime: startTimeController.text,
                                        endTime: endTimeController.text,
                                        duration: int.tryParse(
                                                durationController.text) ??
                                            0,
                                      ),
                                    );
                              },
                            ),
                          ),
                        );
                      },
                    )
                    // builder: (context, state) {
                    //   if (state is GetAppointmentLoading) {
                    //     return const Center(child: CircularProgressIndicator());
                    //   }
                    //   return CustomButton(
                    //     backgroundColor: ColorManager.primary,
                    //     label: "تحديث الموعد",
                    //     onTap: () {
                    //       context
                    //           .read<UpdateAppointmentCubit>()
                    //           .updateAppointment(
                    //             UpdateAppointmentRequest(
                    //               id: widget.appointment.id,
                    //               day: selectedDay,
                    //               startTime: startTimeController.text,
                    //               endTime: endTimeController.text,
                    //               duration:
                    //                   int.tryParse(durationController.text) ??
                    //                       0,
                    //             ),
                    //           );
                    //       context
                    //           .read<DoctorAppointmentsCubit>()
                    //           .getAppointments();
                    //     },
                    //   );
                    // },
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
