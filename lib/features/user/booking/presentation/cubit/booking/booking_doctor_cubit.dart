import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/user/booking/domain/use_cases/get_booking_doctor.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_states.dart';
import 'package:injectable/injectable.dart';

@singleton
class BookingDoctorCubit extends Cubit<BookingStates> {
  final GetBookingDoctor bookingDoctor;
  BookingDoctorCubit(this.bookingDoctor) : super(BookingInitial());

  Future<void> getBookingDoctor(String token) async {
    emit(GetBookingLoading());
    final result = await bookingDoctor(token);
    result.fold((failure) => emit(GetBookingError(failure.message)),
        (booking) => emit(GetBookingDoctorSuccess(booking.data ?? [])));
  }
}
