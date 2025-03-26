import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/user/booking/domain/use_cases/get_patient_booking.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class BookingCubit extends Cubit<BookingStates> {
  final GetPatientBooking _getPatientBooking;
  BookingCubit(this._getPatientBooking) : super(BookingInitial()) {
    getPatientBooking();
  }
  Future<void> getPatientBooking() async {
    emit(GetBookingLoading());
    final result = await _getPatientBooking();
    result.fold((failure) => emit(GetBookingError(failure.message)),
        (booking) => emit(GetBookingSuccess(booking)));
  }
}
