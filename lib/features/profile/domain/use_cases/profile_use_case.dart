import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/auth/domain/entity/user_entity.dart';
import 'package:graduation_project/features/profile/data/model/profile_response/profile_data_model.dart';
import 'package:graduation_project/features/profile/data/model/profile_response/profile_response.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_entity.dart';
import 'package:graduation_project/features/profile/domain/repository/profile_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProfileUseCase {
  final ProfileRepository _profileRepository;
  ProfileUseCase(this._profileRepository);
  Future<Either<Failure, ProfileEntity>> call() =>
      _profileRepository.getPatientProfile();
}
