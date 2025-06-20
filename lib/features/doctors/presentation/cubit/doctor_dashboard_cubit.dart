import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/features/doctors/domain/use_case/doctor_dashboard_useCase.dart';
import 'package:graduation_project/features/doctors/presentation/cubit/doctor_dashboard_states.dart';
import 'package:injectable/injectable.dart';

@singleton
class DoctorDashboardCubit extends Cubit<DoctorDashboardStates> {
  final DoctorDashboardUseCase useCase;
  DoctorDashboardCubit(this.useCase) : super(DoctorDashboardInitial());
  Future<void> getDoctorDashboard() async {
    try {
      emit(DoctorDashboardLoading());
      final result = await useCase.call();
      result.fold((failure) => emit(DoctorDashboardError(failure.message)),
          (data) => emit(DoctorDashboardSuccess(data)));
    } catch (e) {
      throw RemoteException(e.toString());
    }
  }
}
