import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart';
import 'package:graduation_project/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart';
import 'package:graduation_project/features/auth/data/models/login/login_request.dart';
import 'package:graduation_project/features/auth/data/models/register/register_request.dart';
import 'package:graduation_project/features/auth/data/repository/auth_repository_impl.dart';
import 'package:graduation_project/features/auth/domain/use_cases/login_use_case.dart';
import 'package:graduation_project/features/auth/domain/use_cases/register_use_case.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_states.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this._registerUseCase, this._loginUseCase) : super(AuthInitial());
  final RegisterUseCase _registerUseCase;
  final LoginUseCase _loginUseCase;

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());
    final result = await _registerUseCase(request);
    return result.fold((failure) => emit(RegisterError(failure.message)), (_) {
      if (!isClosed) return emit(RegisterSuccess());
    });
  }

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    final result = await _loginUseCase(request);
    return result.fold((failure) => emit(LoginError(failure.message)), (_) {
      if (!isClosed) return emit(LoginSuccess());
    });
  }
}
