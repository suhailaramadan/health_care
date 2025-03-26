import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/auth/data/models/register/register_request.dart';
import 'package:graduation_project/features/auth/domain/entity/user_entity.dart';
import 'package:graduation_project/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class RegisterUseCase {
  final AuthRepository _authRepository;
  RegisterUseCase(this._authRepository);

  Future<Either<Failure, UserEntity>> call(RegisterRequest request) =>
      _authRepository.register(request);
}
