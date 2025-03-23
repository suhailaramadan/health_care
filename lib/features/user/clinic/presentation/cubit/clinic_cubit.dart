import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/user/clinic/domain/use_case/get_clinics.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_states.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ClinicCubit extends Cubit<ClinicState> {
  final GetClinics _getClinics;
  final GetClinicsById _getClinicsById;
  ClinicCubit(
    this._getClinics,
    this._getClinicsById,
  ) : super(ClinicInitial()) {
    getClinics();
    // getClinicsById();
  }
  Future<void> getClinics() async {
    emit(GetClinicsLoading());
    final result = await _getClinics();
    result.fold((failure) => emit(GetClinicsError(failure.message)),
        (clinics) => emit(GetClinicsSuccess(clinics)));
  }

  Future<void> getClinicsById(int id) async {
    emit(GetClinicsLoading());
    final result = await _getClinicsById(id);
    result.fold((failure) => emit(GetClinicsError(failure.message)),
        (clinics) => emit(GetClinicsSuccess(clinics)));
  }
}
