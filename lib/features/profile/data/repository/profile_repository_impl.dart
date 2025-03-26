import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:graduation_project/features/profile/data/data_source/remote/profile_remote_data_source.dart';
import 'package:graduation_project/features/profile/data/mapper/profile_mapper.dart';
import 'package:graduation_project/features/profile/data/model/profile_response/profile_data_model.dart';
import 'package:graduation_project/features/profile/data/model/profile_response/profile_response.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_entity.dart';
import 'package:graduation_project/features/profile/domain/repository/profile_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;
  final AuthLocalDataSource localDataSource;
  ProfileRepositoryImpl(this.localDataSource, this.profileRemoteDataSource);

  @override
  Future<Either<Failure, ProfileEntity>> getPatientProfile() async {
    try {
      final token = await localDataSource.getToken();

      // if (token == null || token.isEmpty) {
      //   return const Left(
      //       Failure("لم يتم العثور علي رمز التوثيق , يرجى تسجيل الدخول"));
      // }
      final response = await profileRemoteDataSource.getPatientProfile(token!);
      if (response.data == null) {
        return const Left(Failure("لم يتم العثور على بيانات المستخدم"));
      }
      if (response.success == false) {
        return const Left(Failure("حدث خطأ أثناء تحميل بيانات المستخدم"));
      }
      await localDataSource.savePatientProfile(response.data!.toEntity);
      return Right(response.data!.toEntity);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
