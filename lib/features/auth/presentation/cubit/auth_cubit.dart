// import 'dart:math';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/core/di/service_locator.dart';
// import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart';
// import 'package:graduation_project/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart';
// import 'package:graduation_project/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart';
// import 'package:graduation_project/features/auth/data/models/login/login_request.dart';
// import 'package:graduation_project/features/auth/data/models/register/register_request.dart';
// import 'package:graduation_project/features/auth/data/repository/auth_repository_impl.dart';
// import 'package:graduation_project/features/auth/domain/use_cases/login_use_case.dart';
// import 'package:graduation_project/features/auth/domain/use_cases/register_use_case.dart';
// import 'package:graduation_project/features/auth/presentation/cubit/auth_states.dart';
// import 'package:graduation_project/features/profile/domain/repository/profile_repository.dart';
// import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart';
// import 'package:injectable/injectable.dart';

// @singleton
// class AuthCubit extends Cubit<AuthStates> {
//   AuthCubit(this._registerUseCase, this._loginUseCase, this.localSharedPref)
//       : super(AuthInitial());
//   final RegisterUseCase _registerUseCase;
//   final LoginUseCase _loginUseCase;
//   final AuthLocalDataSource localSharedPref;
//   Future<void> register(RegisterRequest request) async {
//     // if (isClosed) return;
//     emit(RegisterLoading());
//     try {
//       final result = await _registerUseCase(request);
//       // if (isClosed) return;
//       return result.fold((failure) {
//         // if (!isClosed) return;
//         if (failure.message.contains("هذا الحساب موجود بالفعل")) {
//           return emit(RegisterError("هذا الحساب مسجل بالفعل جرب تسجيل الدخول"));
//         }
//         emit(RegisterError(failure.message));
//       }, (_) {
//         localSharedPref.getPatientProfile();
//         // localSharedPref.saveUserData(
//         //     request.firstName, request.lastName, request.imageUrl);
//         if (!isClosed) return emit(RegisterSuccess());
//       });
//     } catch (e) {
//       if (!isClosed) {
//         return emit(RegisterError("حدث خطأ غير متوقع، حاول مرة أخرى"));
//       }
//     }
//   }

//   Future<void> login(LoginRequest request) async {
//     if (isClosed) return;
//     emit(LoginLoading());
//     try {
//       final result = await _loginUseCase(request);

//       return result.fold((failure) {
//         emit(LoginError(failure.message));
//       }, (loginResponse) async {
//         await localSharedPref.saveToken(
//             loginResponse.token ?? '', loginResponse.role ?? 'User');
//         // final profileResult =
//         //     await serviceLocator.get<ProfileRepository>().getPatientProfile();
//         // profileResult.fold((failure) {
//         //   emit(LoginError(failure.message));
//         // }, (profile) async {
//         //   await localSharedPref.savePatientProfile(profile);

//         // return emit(LoginSuccess(
//         //     role: loginResponse.role ?? 'User',
//         //     token: loginResponse.token ?? '',
//         //     firstName: profile.firstName ?? '',
//         //     lastName: profile.lastName ?? '',
//         //     userImage: profile.imageUrl ?? ''));
//       }
//           // });
//           // if (!isClosed) {
//           //   return emit(LoginSuccess(
//           //     token: loginResponse.token ?? '',
//           //     role: loginResponse.role ?? 'User',
//           //     // firstName: firstName ?? "أهلاً",
//           //     // lastName: lastName ?? '',
//           //     // userImage: userImage ?? '',

//           //   }
//           );
//       // });
//     } catch (e) {
//       if (!isClosed) {
//         return emit(LoginError("حدث خطأ غير متوقع , حاول مرة أخرى"));
//       }
//     }
//   }
// }
