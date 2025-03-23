// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart';
// import 'package:graduation_project/features/profile/domain/repository/profile_repository.dart';
// import 'package:graduation_project/features/profile/presentation/cubit/profile_states.dart';
// import 'package:injectable/injectable.dart';

// @singleton
// class ProfileCubit extends Cubit<ProfileStates> {
//   final ProfileRepository _profileRepository;
//   ProfileCubit(this._profileRepository) : super(ProfileInitial()) {
//     getPatientProfile();
//   }
//   Future<void> getPatientProfile() async {
//     emit(GetProfilesLoading());
//     try {
//       final result = await _profileRepository.getPatientProfile();
//       result.fold((failure) => emit(GetProfilesError(failure.message)),
//           (patientProfile) {
//         emit(GetProfilesSuccess(patientProfile));
//       });
//     } catch (exception) {
//       emit(GetProfilesError('تعذر تحميل البيانات'));
//     }
//   }
// }
