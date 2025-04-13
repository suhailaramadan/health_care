import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_request.dart';
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
