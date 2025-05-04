import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/domain/entities/delete_booking_entity.dart';
import 'package:graduation_project/features/user/booking/domain/repository/doctor_appointments_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteAppointmentUseCase {
  final DoctorAppointmentRepository repository;
  DeleteAppointmentUseCase(this.repository);
  Future<Either<Failure, DeleteBookingEntity>> call(int id) {
    return repository.deleteAppointment(id);
  }
}
