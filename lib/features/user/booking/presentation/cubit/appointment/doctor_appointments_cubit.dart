import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utils/formated.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_states.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/doctors_appointment_model.dart';
import 'package:graduation_project/features/user/booking/domain/use_cases/get_doctor_appointments.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DoctorAppointmentsCubit extends Cubit<AppointmentStates> {
  final GetDoctorsAppointments getDoctorsAppointments;
  DoctorAppointmentsCubit(this.getDoctorsAppointments)
      : super(AppointmentInitial());
  Future<void> getAppointments() async {
    emit(GetAppointmentLoading());
    final result = await getDoctorsAppointments.call();
    result.fold((failure) => emit(GetAppointmentError(failure.message)),
        // ignore: void_checks
        (appointments) {
      print("appoimnt $appointments");
//
      // FormatedDate.filterAppointments(appointments);
      if (appointments.isEmpty) {
        return "hhhhhhhhhhhhhhhhgggggggggg";
      }
      print("emiiiiiiiitttttttt");
      try {
        emit(GetDoctorAppointmentsSuccess(appointments));
        print("suuccffffffffffffff");
      } catch (e) {
        print("Errrrrrrrrrrrrrrpor $e");
      }
    });
  }
}
