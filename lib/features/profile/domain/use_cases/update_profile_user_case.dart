import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/profile/data/model/profile_response/Update_request.dart';
import 'package:graduation_project/features/profile/domain/repository/profile_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class UpdatePatientUseCase {
  final ProfileRepository repository;
  UpdatePatientUseCase(this.repository);

  Future<Either<Failure, String>> call(UpdateProfileRequest request) =>
      repository.updatePatientProfile(request);
}
