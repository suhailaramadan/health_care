import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/update_appointment_request.dart';
import 'package:graduation_project/features/user/booking/domain/use_cases/update_appointment.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
import 'package:injectable/injectable.dart';

@singleton
class UpdateAppointmentCubit extends Cubit<AppointmentStates> {
  final UpdateAppointmentUseCase updateAppointmentUseCase;
  UpdateAppointmentCubit(this.updateAppointmentUseCase)
      : super(AppointmentInitial());
  Future<void> updateAppointment(UpdateAppointmentRequest request) async {
    emit(GetAppointmentLoading());
    final result = await updateAppointmentUseCase(request);
    result.fold((failure) => emit(GetAppointmentError(failure.message)),
        (update) => emit(UpdateAppointmentSuccess(update)));
  }
}
