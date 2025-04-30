import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_states.dart';
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
        (appointments) => emit(GetDoctorAppointmentsSuccess(appointments)));
  }
}
