import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/auth/data/models/password/change_password_request.dart';
import 'package:graduation_project/features/auth/data/models/password/forget_password_request.dart';
import 'package:graduation_project/features/auth/data/models/login/login_request.dart';
import 'package:graduation_project/features/auth/data/models/password/reset_password_request.dart';
import 'package:graduation_project/features/auth/data/models/password/verify_code_request.dart';
import 'package:graduation_project/features/auth/data/models/register/register_request.dart';
import 'package:graduation_project/features/auth/domain/entity/password_entity.dart';
import 'package:graduation_project/features/auth/domain/entity/user_entity.dart';
import 'package:graduation_project/features/auth/domain/entity/verify_code_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> register(RegisterRequest request);
  Future<Either<Failure, UserEntity>> login(LoginRequest request);
  Future<Either<Failure, void>> forgetPassword(ForgetPasswordRequest request);
  Future<Either<Failure, String>> verifyCode(VerifyCodeRequest request);
  Future<Either<Failure, String>> resetPassword(ResetPasswordRequest request);
  Future<Either<Failure, String>> changePassword(ChangePasswordRequest request);
}
