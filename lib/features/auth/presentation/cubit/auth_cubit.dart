import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart';
import 'package:graduation_project/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart';
import 'package:graduation_project/features/auth/data/models/login/login_request.dart';
import 'package:graduation_project/features/auth/data/models/register/register_request.dart';
import 'package:graduation_project/features/auth/data/repository/auth_repository.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  late final AuthRepository authRepository;
  AuthCubit() : super(AuthInitial()) {
    authRepository = AuthRepository(
        AuthAPIRemoteDataSource(), AuthSharedPrefLocalDataSource());
  }
  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());
    final result = await authRepository.register(request);
    result.fold((failure) => emit(RegisterError(failure.message)),
        (_) => emit(RegisterSuccess()));
  }

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    final result = await authRepository.login(request);
    result.fold((failure) => emit(LoginError(failure.message)),
        (_) => emit(LoginSuccess()));
  }
}
