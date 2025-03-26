import 'package:graduation_project/features/user/booking/data/models/booking_response.dart';

abstract class BookingRemoteDataSource {
  Future<BookingResponse> getPatientBooking(String token);
}
