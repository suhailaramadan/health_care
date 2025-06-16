import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/features/notification/presentiation/cubit/notification_cubit.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_appointment/data.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_patient_response/booking_patient_model.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_patient_response/booking_patient_response.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/doctors_appointment_model.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointments_response/doctors_appointments_response.dart';
import 'package:graduation_project/features/user/booking/domain/entities/appointment_entity.dart';
import 'package:graduation_project/features/user/booking/domain/entities/booking_patient_entity.dart';
import 'package:graduation_project/features/user/booking/domain/entities/delete_booking_entity.dart';
import 'package:graduation_project/features/user/booking/domain/use_cases/delete_appointment.dart';
import 'package:graduation_project/features/user/booking/domain/use_cases/get_all_bookings.dart';
import 'package:graduation_project/features/user/booking/domain/use_cases/get_booking_by_id.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_by_id_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_states.dart';
import 'package:injectable/injectable.dart';

@singleton
class DeleteAppointmentCubit extends Cubit<AppointmentStates> {
  final DeleteAppointmentUseCase deleteAppointmentUseCase;

  final GetAllBookingsUseCase bookingsUseCase;
  DeleteAppointmentCubit(this.deleteAppointmentUseCase, this.bookingsUseCase)
      : super(AppointmentInitial());
  // Future<void> deleteAppointment(int appointmentId,
  //     {required int day,
  //     required String startTime,
  //     required String endTime,
  //     required int duration}) async {
  //   print("Appointmentzidddddddddddd $appointmentId");
  //   emit(GetAppointmentLoading());
  //   final result = await deleteAppointmentUseCase(appointmentId,
  //       day: day, startTime: startTime, endTime: endTime, duration: duration);
  //   result.fold((failure) => emit(GetAppointmentError(failure.message)),
  //       (_) async {
  //     final bookingResult = await bookingsUseCase();
  //     bookingResult
  //         .fold((failure) => emit(GetAppointmentError(failure.message)),
  //             (bookingList) async {
  //       final updateBookings = bookingList
  //           .where((booking) => booking.id != appointmentId)
  //           .toList();
  //       emit(GetAllBookingsSuccess(updateBookings));
  //       // for (final booking in bookingList) {
  //       //   print("Boolingssssss ${booking.id}");
  //       //   if (booking.id == appointmentId) {
  //       //     await deleteAppointmentUseCase(booking.id!,
  //       //         day: day,
  //       //         startTime: startTime,
  //       //         endTime: endTime,
  //       //         duration: duration);
  //       //   }
  //       // }
  //       emit(DeleteAppointmentSuccess());
  //     });
  //   });
  // }

  Future<void> deleteAppointment(
    int appointmentId,
  ) async {
    emit(GetAppointmentLoading());
    final result = await deleteAppointmentUseCase(appointmentId);
    // day: day, startTime: startTime, endTime: endTime, duration: duration);
    result.fold((failure) => emit(GetAppointmentError(failure.message)),
        (_) async {
      emit(DeleteAppointmentSuccess());
      // await bookingsUseCase.bookingPatientRepository.getBookingpatient();
    });
  }
}
