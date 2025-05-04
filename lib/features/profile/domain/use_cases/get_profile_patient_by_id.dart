import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_entity.dart';
import 'package:graduation_project/features/profile/domain/repository/profile_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetPatientProfileByIdUseCase {
  final ProfileRepository _profileRepository;
  GetPatientProfileByIdUseCase(this._profileRepository);
  Future<Either<Failure, ProfileEntity>> call(String patientId) =>
      _profileRepository.getPatientProfileById(patientId);
}
