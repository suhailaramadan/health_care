import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/create_request_model.dart';
import 'package:graduation_project/features/user/booking/domain/use_cases/create_appointment_use_case.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateAppointmentCubit extends Cubit<AppointmentStates> {
  final CreateAppointmentUseCase createAppointmentUseCase;
  CreateAppointmentCubit(this.createAppointmentUseCase)
      : super(AppointmentInitial());
  Future<void> createAppointment(CreateRequestModel request) async {
    emit(GetAppointmentLoading());

    final result = await createAppointmentUseCase(request);
    result.fold((failure) => emit(GetAppointmentError(failure.message)),
        (appointment) => emit(CreateAppointmentSuccess(appointment)));
  }
}
