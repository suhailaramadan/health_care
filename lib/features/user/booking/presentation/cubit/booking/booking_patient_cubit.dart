import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/medical_record/domain/entity/medical_record_patient_entity.dart';
import 'package:graduation_project/features/notification/presentiation/cubit/notification_cubit.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_patient_response/booking_patient_model.dart';
import 'package:graduation_project/features/user/booking/domain/use_cases/get_patient_booking.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_states.dart';
import 'package:injectable/injectable.dart';

@singleton
class BookingPatientCubit extends Cubit<BookingStates> {
  final GetBookingPatient bookingPatient;
  BookingPatientCubit(this.bookingPatient) : super(BookingInitial());
  List<BookingPatientModel> allBookings = [];
  Future<void> getBookingPatient() async {
    emit(GetBookingLoading());

    final result = await bookingPatient();

    result.fold(
      (failure) {
        print("BookingPatient error: ${failure.message}");
        emit(GetBookingError(failure.message));
      },
      (bookingPatient) async {
        emit(GetBookingPatientSuccess(bookingPatient));
        allBookings = bookingPatient.data ?? [];

        print("Booking list: ${bookingPatient.data}");
      },
    );
  }

  bool _isUpcoming(BookingPatientModel booking) {
    final now = DateTime.now();
    final bookingDate = DateTime.tryParse(booking.date ?? '');
    return bookingDate != null && bookingDate.isAfter(now);
  }

  List<BookingPatientModel> getUpcomingBookings() {
    return allBookings.where((e) => _isUpcoming(e)).toList();
  }

  List<BookingPatientModel> getCompletedBookings(
      List<MedicalRecordPatientEntity> records) {
    return allBookings.where((booking) {
      final bookingDate = booking.date;
      final match = records.any((record) => record.dateOfVisit == bookingDate);
      return !_isUpcoming(booking) && match;
    }).toList();
  }

  List<BookingPatientModel> getNotCompletedBookings(
      List<MedicalRecordPatientEntity> records) {
    return allBookings.where((booking) {
      final bookingDate = booking.date;
      final hasRecord =
          records.any((record) => record.dateOfVisit == bookingDate);
      return !_isUpcoming(booking) && !hasRecord;
    }).toList();
  }
}
