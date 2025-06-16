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

@singleton
class DeleteBookingCubit extends Cubit<BookingStates> {
  final DeleteBookingUseCase deleteBookingUseCase;
  DeleteBookingCubit({required this.deleteBookingUseCase})
      : super(BookingInitial());
  Future<void> deleteBooking(int bookingId) async {
    if (isClosed) {
      return;
    }
    emit(GetBookingLoading());

    final result = await deleteBookingUseCase(bookingId);
    if (isClosed) return;
    result.fold((failure) {
      if (!isClosed) emit(GetBookingError(failure.message));
    }, (entity) {
      print("success");
      if (!isClosed) emit(DeleteBookingSuccess(entity));
    });
  }

  @override
  Future<void> close() {
    print("DeleteBookingcubit is !closed");
    return super.close();
  }
}
