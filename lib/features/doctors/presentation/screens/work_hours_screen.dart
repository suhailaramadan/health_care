import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart';
import 'package:graduation_project/features/doctors/presentation/widgets/appointment_item.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/doctor_appointments_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorksHoursScreen extends StatelessWidget {
  static const worksHours = '/worksHours';
  const WorksHoursScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('المواعيد المسجلة'),
          centerTitle: true,
        ),
        body: BlocBuilder<DoctorAppointmentsCubit, AppointmentStates>(
          builder: (context, state) {
            if (state is GetAppointmentLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetDoctorAppointmentsSuccess) {
              final appointments = state.appointment;

              return Container(
                // padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorManager.grey)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text("اليوم",
                                  style: getMediumStyle(
                                      color: ColorManager.white)),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text("البداية",
                                  style: getMediumStyle(
                                      color: ColorManager.white)),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text("النهاية",
                                  style: getMediumStyle(
                                      color: ColorManager.white)),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text("الإجراءات",
                                  style: getMediumStyle(
                                      color: ColorManager.white)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: appointments.length,
                        itemBuilder: (context, index) {
                          final appointment = appointments[index];
                          return DoctorAppointmentItem(
                            day: _getDayName(appointment.day ?? 0),
                            startTime: appointment.startTime ?? '',
                            endTime: appointment.endTime ?? '',
                            onEdit: () {
                              // أكشن التعديل
                            },
                            onDelete: () {
                              // أكشن الحذف
                            },
                          );
                        },
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(12.0),
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       // إنشاء ميعاد جديد
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: Colors.blue,
                    //       padding: const EdgeInsets.symmetric(
                    //           horizontal: 24, vertical: 12),
                    //     ),
                    //     child: const Text("إنشاء ميعاد جديد"),
                    //   ),
                    // ),
                  ],
                ),
              );
            } else if (state is GetAppointmentError) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<DoctorAppointmentsCubit>()
                            .getAppointments();
                      },
                      child: const Text("حاول مرة أخرى")),
                  Text(state.message),
                ],
              ));
            } else {
              return const SizedBox();
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorManager.primary,
          foregroundColor: ColorManager.white,
          splashColor: ColorManager.blue,
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            final doctorId = prefs.getString(CacheConstants.doctorId);
            // if (doctorId !) {
            // ignore: use_build_context_synchronously
            Navigator.of(context)
                .pushNamed(Routes.createAppointment, arguments: doctorId);
            // } else {
            //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //       content: Text("حدث خطأ, لم يتم العثور على حساب الدكتور")));
            // }
          },
          child: const Icon(Icons.add),
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
