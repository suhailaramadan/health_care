import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/user/booking/domain/use_cases/get_patient_booking.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class BookingPatientCubit extends Cubit<BookingStates> {
  final GetBookingPatient bookingPatient;
  BookingPatientCubit(this.bookingPatient) : super(BookingInitial());
  Future<void> getBookingPatient(String token) async {
    emit(GetBookingLoading());

    final result = await bookingPatient(token);

    result.fold(
      (failure) {
        emit(GetBookingError(failure.message));
      },
      (booking) {
        emit(GetBookingPatientSuccess(booking));
      },
    );
  }
}
