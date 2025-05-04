import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/user/booking/domain/entities/appointment_entity.dart';
import 'package:graduation_project/features/user/booking/domain/use_cases/delete_appointment.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
import 'package:injectable/injectable.dart';

@singleton
class DeleteAppointmentCubit extends Cubit<AppointmentStates> {
  final DeleteAppointmentUseCase deleteAppointmentUseCase;
  DeleteAppointmentCubit(this.deleteAppointmentUseCase)
      : super(AppointmentInitial());
  Future<void> deleteAppointment(int id) async {
    emit(GetAppointmentLoading());
    try {
      final result = await deleteAppointmentUseCase.call(id);
      result.fold((failure) => emit(GetAppointmentError(failure.message)),
          (appointment) => emit(DeleteAppointmentSuccess(appointment)));
    } catch (e) {
      emit(GetAppointmentError(e.toString()));
    }
  }
}
