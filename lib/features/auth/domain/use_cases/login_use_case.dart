import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/auth/data/models/login/login_request.dart';
import 'package:graduation_project/features/auth/domain/entity/user_entity.dart';
import 'package:graduation_project/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class LoginUseCase {
  final AuthRepository _authRepository;
  LoginUseCase(this._authRepository);
  Future<Either<Failure, UserEntity>> call(LoginRequest request) =>
      _authRepository.login(request);
}
