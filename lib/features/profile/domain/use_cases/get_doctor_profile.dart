import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_doctor_entity.dart';
import 'package:graduation_project/features/profile/domain/repository/profile_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetDoctorProfileUseCase {
  final ProfileRepository repository;
  GetDoctorProfileUseCase(this.repository);
  Future<Either<Failure, ProfileDoctorEntity>> call() =>
      repository.getDoctorProfile();
}
