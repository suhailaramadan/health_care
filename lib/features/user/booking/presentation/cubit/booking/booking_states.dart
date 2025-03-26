import 'package:graduation_project/features/user/booking/domain/entities/booking_entity.dart';

abstract class BookingStates {}

class BookingInitial extends BookingStates {}

class GetBookingLoading extends BookingStates {}

class GetBookingSuccess extends BookingStates {
  List<BookingEntity> bookingEntity;
  GetBookingSuccess(this.bookingEntity);
}

class GetBookingError extends BookingStates {
  final String message;
  GetBookingError(this.message);
}
