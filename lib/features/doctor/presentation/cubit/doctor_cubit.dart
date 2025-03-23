import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/doctor/domain/use_case.dart/get_doctors.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class DoctorsCubit extends Cubit<DoctorsStates> {
  final GetDoctors _getDoctors;
  final GetDoctorsByClinicId _getDoctorsByClinicId;
  DoctorsCubit(
    this._getDoctors,
    this._getDoctorsByClinicId,
  ) : super(DoctorsInitial());
  // {
  //   // getDoctors();
  // }
  Future<void> getDoctors() async {
    if (isClosed) return;
    emit(GetDoctorsLoading());
    final result = await _getDoctors();
    if (isClosed) return;
    result.fold((failure) {
      if (!isClosed) emit(GetDoctorsError(failure.message));
    }, (doctors) {
      if (!isClosed) emit(GetDoctorsSuccess(doctors));
    });
  }

  Future<void> getDoctorsByClinicId(int? clinicId) async {
    if (clinicId == null) {
      print("حدث خطأ ما");
      GetDoctorsError("حدث خطأ ما");
      return;
    }
    print("Fetching doctors fo Id ====> $clinicId");
    emit(GetDoctorsLoading());
    // if (isClosed) return;
    final result = await _getDoctorsByClinicId(clinicId);
    // if (isClosed) return;
    result.fold((failure) {
      if (!isClosed)
        print("print errrrror messahgen-------> ${failure.message}");
      emit(GetDoctorsError(failure.message));
    }, (doctors) {
      if (!isClosed) print("Succcccccccccccc-.,,,>>>> ${doctors.length}");
      emit(GetDoctorsSuccess(doctors));
    });
  }

  // void clearDoctors() {
  //   emit(GetDoctorsSuccess([]));
  // }
}
