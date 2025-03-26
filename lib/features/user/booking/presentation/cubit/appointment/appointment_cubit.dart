import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/doctor/domain/use_case.dart/get_doctors.dart';
import 'package:graduation_project/features/user/booking/domain/entities/appointment_entity.dart';
import 'package:graduation_project/features/user/booking/domain/use_cases/get_appointment_doctor_by%20_id.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppointmentCubit extends Cubit<AppointmentStates> {
  final GetAppointmentDoctorById _appointmentDoctorById;
  AppointmentCubit(this._appointmentDoctorById) : super(AppointmentInitial());
  Future<void> getAppointmentDoctorById(String doctorId) async {
    emit(GetAppointmentLoading());
    final result = await _appointmentDoctorById(doctorId);
    result.fold((failure) => emit(GetAppointmentError(failure.message)),
        (appointment) {
      emit(GetAppointmentSuccess(appointment));
      print("✅ Final Processed Appointments: $appointments");
    });
  }
}

// @lazySingleton
// class AppointmentCubit extends Cubit<AppointmentStates> {
//   final GetAppointmentDoctorById _appointmentDoctorById;

//   AppointmentCubit(this._appointmentDoctorById) : super(AppointmentInitial());

//   Future<void> getAppointmentDoctorById(String doctorId) async {
//     print("🟠 Cubit: Fetching appointments for doctorId: $doctorId"); // ✅
//     try {
//       if (isClosed) return; // ✅ تحقق أن الكيوبت لم يُغلق قبل أي شيء
//       print("------------------------------------------->");
//       emit(GetAppointmentLoading());
//       print("---------------------------------------88---->");
//       final result = await _appointmentDoctorById(doctorId);

//       result.fold(
//         (failure) {
//           print("API Error: ${failure.message}");
//           _emitIfOpen(GetAppointmentError(
//               failure.message)); // ✅ تحسين التحقق من isClosed
//         },
//         (appointments) {
//           print("🟢 Cubit Success: Appointments Loaded: $appointments");
//           print("🟢 Number of Appointments: ${appointments.length}");
//           //
//           _emitIfOpen(GetAppointmentSuccess(appointments));
//         },
//       );
//     } catch (e, stacktrace) {
//       print(
//           "AppointmentCubit Error: $e \n$stacktrace"); // ✅ طباعة الخطأ لمعرفة السبب الحقيقي
//       _emitIfOpen(GetAppointmentError("Unexpected error occurred."));
//     }
//   }

//   void _emitIfOpen(AppointmentStates state) {
//     if (!isClosed) emit(state); // ✅ دالة مساعدة لمنع تكرار شرط isClosed
//   }
// }
