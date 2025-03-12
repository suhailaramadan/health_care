import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/auth/data/models/login/login_request.dart';
import 'package:graduation_project/features/auth/data/models/register/register_request.dart';
import 'package:graduation_project/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> register(RegisterRequest request);
  Future<Either<Failure, UserEntity>> login(LoginRequest request);
}
