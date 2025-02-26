import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/clinic/domain/use_case/get_clinics.dart';
import 'package:graduation_project/features/clinic/presentation/cubit/clinic_states.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ClinicCubit extends Cubit<ClinicState> {
  final GetClinics _getClinics;
  ClinicCubit(
    this._getClinics,
  ) : super(ClinicInitial()) {
    getClinics();
  }
  Future<void> getClinics() async {
    emit(GetClinicsLoading());
    final result = await _getClinics();
    result.fold((failure) => emit(GetClinicsError(failure.message)),
        (clinics) => emit(GetClinicsSuccess(clinics)));
  }
}
