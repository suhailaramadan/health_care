import 'package:flutter/material.dart';
import 'package:graduation_project/features/user/booking/data/models/appointment_by_doctor_id_response/appointment_model.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/doctors_appointment_model.dart';
import 'package:graduation_project/features/user/booking/domain/entities/appointment_entity.dart';
import 'package:graduation_project/features/user/booking/domain/entities/booking_entity.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_states.dart';

abstract class AppointmentStates {}

class AppointmentInitial extends AppointmentStates {}

class GetAppointmentLoading extends AppointmentStates {}

class GetAppointmentSuccess extends AppointmentStates {
  List<AppointmentEntity> appointmentEntity;
  GetAppointmentSuccess(this.appointmentEntity);
}

class GetDoctorAppointmentsSuccess extends AppointmentStates {
  List<DoctorsAppointmentModel> appointment;
  GetDoctorAppointmentsSuccess(this.appointment);
}

class CreateAppointmentSuccess extends AppointmentStates {
  final DoctorsAppointmentModel doctorsAppointmentModel;
  CreateAppointmentSuccess(this.doctorsAppointmentModel);
}

class GetAppointmentError extends AppointmentStates {
  final String message;
  GetAppointmentError(this.message);
}
