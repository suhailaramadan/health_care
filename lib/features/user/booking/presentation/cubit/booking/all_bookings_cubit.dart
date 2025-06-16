import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/user/booking/domain/use_cases/get_all_bookings.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_states.dart';
import 'package:injectable/injectable.dart';

@singleton
class AllBookingsCubit extends Cubit<AppointmentStates> {
  final GetAllBookingsUseCase getAllBookingsUseCase;
  AllBookingsCubit(this.getAllBookingsUseCase) : super(AppointmentInitial());
  Future<void> getAllBookings() async {
    emit(GetAppointmentLoading());
    final bookings = await getAllBookingsUseCase();
    bookings.fold((failure) => emit(GetAppointmentError(failure.message)),
        (bookings) => emit(GetAllBookingsSuccess(bookings)));
  }
}
