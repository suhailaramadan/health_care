import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/profile/data/model/profile_doctor_response/update_doctor_profile_request.dart';
import 'package:graduation_project/features/profile/domain/repository/profile_repository.dart';

class UpdateDoctorProfileUseCase {
  final ProfileRepository profileRepository;
  UpdateDoctorProfileUseCase(this.profileRepository);
  Future<Either<Failure, String>> call(UpdateDoctorProfileRequest request) =>
      profileRepository.updateDoctorProfile(request);
}
