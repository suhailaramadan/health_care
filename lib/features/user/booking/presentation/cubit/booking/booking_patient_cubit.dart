import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/notification/presentiation/cubit/notification_cubit.dart';
import 'package:graduation_project/features/user/booking/domain/use_cases/get_patient_booking.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_states.dart';
import 'package:injectable/injectable.dart';

@singleton
class BookingPatientCubit extends Cubit<BookingStates> {
  final GetBookingPatient bookingPatient;
  BookingPatientCubit(this.bookingPatient) : super(BookingInitial());
  Future<void> getBookingPatient() async {
    emit(GetBookingLoading());

    final result = await bookingPatient();

    result.fold(
      (failure) {
        emit(GetBookingError(failure.message));
      },
      (bookingPatient) async {
        emit(GetBookingPatientSuccess(bookingPatient));
      },
    );
  }
}
