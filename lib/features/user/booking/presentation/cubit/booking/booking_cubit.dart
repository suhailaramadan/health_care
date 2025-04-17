import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_request.dart';
import 'package:graduation_project/features/user/booking/domain/entities/delete_booking_entity.dart';
import 'package:graduation_project/features/user/booking/domain/use_cases/delete_booking.dart';
import 'package:graduation_project/features/user/booking/domain/use_cases/post_booking_appointment.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class BookingCubit extends Cubit<BookingStates> {
  final PostBookAppointment bookAppointmentUseCase;

  BookingCubit({required this.bookAppointmentUseCase})
      : super(BookingInitial());

  Future<void> bookAppointment(BookingRequest request) async {
    emit(GetBookingLoading());

    final result = await bookAppointmentUseCase(request);

    result.fold(
      (failure) {
        emit(GetBookingError(failure.message));
      },
      (booking) {
        emit(GetBookingSuccess(booking));
      },
    );
  }
}

@lazySingleton
class DeleteBookingCubit extends Cubit<BookingStates> {
  final DeleteBookingUseCase deleteBookingUseCase;
  DeleteBookingCubit({required this.deleteBookingUseCase})
      : super(BookingInitial());
  Future<void> deleteBooking(int bookingId) async {
    emit(GetBookingLoading());
    final result = await deleteBookingUseCase(bookingId);
    result.fold((failure) => emit(GetBookingError(failure.message)),
        (entity) => emit(DeleteBookingSuccess(entity)));
  }
}
