import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/user/booking/domain/use_cases/get_booking_by_id.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_states.dart';
import 'package:injectable/injectable.dart';

@singleton
class BookingByIdCubit extends Cubit<BookingStates> {
  final GetBookingByIdUseCase bookingByIdUseCase;
  BookingByIdCubit(this.bookingByIdUseCase) : super(BookingInitial());
  Future<void> getBookingById(int id) async {
    emit(GetBookingLoading());
    final result = await bookingByIdUseCase(id);
    result.fold((failure) {
      print("Errrror failure ${failure.message}");
      emit(GetBookingError(failure.message));
    }, (booking) {
      print("booking sucesss${booking.toString()}");
      emit(GetBookingByIdSuccess(booking));
    });
  }
}
