import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/auth/data/models/password/verify_code_request.dart';
import 'package:graduation_project/features/auth/domain/entity/verify_code_entity.dart';
import 'package:graduation_project/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class VerifyCodeUseCase {
  final AuthRepository _authRepository;
  VerifyCodeUseCase(this._authRepository);
  Future<Either<Failure, String>> call(VerifyCodeRequest request) async {
    return await _authRepository.verifyCode(request);
  }

  Future<Either<Failure, String>> calll(VerifyCodeRequest request) async {
    return await _authRepository.verifyCode(request);
  }
}
