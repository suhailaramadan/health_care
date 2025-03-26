import 'package:flutter/material.dart';
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

class GetAppointmentError extends AppointmentStates {
  final String message;
  GetAppointmentError(this.message);
}
