import 'package:graduation_project/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileStates {}

class ProfileInitial extends ProfileStates {}

class GetProfilesSuccess extends ProfileStates {
  ProfileEntity profileEntity;
  GetProfilesSuccess(this.profileEntity);
}

class GetProfilesLoading extends ProfileStates {}

class GetProfilesError extends ProfileStates {
  final String message;
  GetProfilesError(this.message);
}

class GetUpdateProfilesLoading extends ProfileStates {}

class GetUpdateProfilesSuccess extends ProfileStates {
  final String message;
  GetUpdateProfilesSuccess(this.message);
}

class GetUpdateProfilesError extends ProfileStates {
  final String message;
  GetUpdateProfilesError(this.message);
}
