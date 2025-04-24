import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:graduation_project/features/profile/data/model/profile_response/Update_request.dart';
import 'package:graduation_project/features/profile/domain/repository/profile_repository.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_states.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProfileCubit extends Cubit<ProfileStates> {
  final ProfileRepository _profileRepository;
  final AuthLocalDataSource _localDataSource;
  ProfileCubit(this._profileRepository, this._localDataSource)
      : super(ProfileInitial());
  Future<void> getPatientProfile() async {
    emit(GetProfilesLoading());
    final result = await _profileRepository.getPatientProfile();
    result.fold((failure) {
      emit(GetProfilesError(failure.message));
    }, (profile) async {
      await _localDataSource.savePatientProfile(profile);
      emit(GetProfilesSuccess(profile));
    });
  }

  // Future<void> getPatientProfile() async {
  //   emit(GetProfilesLoading());
  //   try {
  //     final cachedProfile = await _profileRepository.getCachedPatientProfile();
  //     if (cachedProfile != null) {
  //       emit(GetProfilesSuccess(cachedProfile));
  //     }
  //     final result = await _profileRepository.getPatientProfile();
  //     result.fold((failure) => emit(GetProfilesError(failure.message)),
  //         (patientProfile) {
  //       emit(GetProfilesSuccess(patientProfile));
  //     });
  //   } catch (exception) {
  //     emit(GetProfilesError('تعذر تحميل البيانات'));
  //   }
  // }
  Future<void> updatePatientProfile(UpdateRequest request) async {
    emit(GetUpdateProfilesLoading());
    final result = await _profileRepository.updatePatientProfile(request);
    print("Result $result");
    result.fold((failure) => emit(GetUpdateProfilesError(failure.message)),
        (message) async {
      final newProfileResult = await _profileRepository.getPatientProfile();
      newProfileResult.fold(
          (failure) => emit(GetUpdateProfilesError(failure.message)),
          (profile) => emit(GetProfilesSuccess(profile)));
      // await getPatientProfile();
      // emit(GetUpdateProfilesSuccess(message));
    });
  }
}
