import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:graduation_project/features/auth/data/models/register/register_request.dart';
import 'package:graduation_project/features/profile/data/data_source/remote/profile_remote_data_source.dart';
import 'package:graduation_project/features/profile/data/mapper/profile_doctor_mapper.dart';
import 'package:graduation_project/features/profile/data/mapper/profile_mapper.dart';
import 'package:graduation_project/features/profile/data/model/profile_doctor_response/profile_doctor_model.dart';
import 'package:graduation_project/features/profile/data/model/profile_doctor_response/update_doctor_profile_request.dart';
import 'package:graduation_project/features/profile/data/model/profile_response/Update_request.dart';
import 'package:graduation_project/features/profile/data/model/profile_response/profile_data_model.dart';
import 'package:graduation_project/features/profile/data/model/profile_response/profile_response.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_doctor_entity.dart';
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

      if (token == null || token.isEmpty) {
        return const Left(Failure("يرجى تسجيل الدخول"));
      }
      final response = await profileRemoteDataSource.getPatientProfile(token);
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

  @override
  Future<ProfileEntity?> getCachedPatientProfile() async {
    try {
      final profile = await localDataSource.getPatientProfile();
      return profile;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Either<Failure, String>> updatePatientProfile(
      UpdateProfileRequest request) async {
    try {
      final token = await localDataSource.getToken();
      final message =
          await profileRemoteDataSource.updatePatientProfile(token!, request);
      return Right(message);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
    // try {
    // //   final token = await localDataSource.getToken();
    // //   if (token == null || token.isEmpty) {
    // //     return const Left(Failure('يرجى تسجيل الدخول'));
    // //   }
    //   // final message =
    //   //     await profileRemoteDataSource.updatePatientProfile(token, request);
    //   // return Right(message);
    //   // if (response.data == null) {
    //   //   return const Left(Failure('لم يتم تحديث البيانات'));
    //   // }
    //   // return Right(response.data!)
    // } on RemoteException catch (e) {
    //   return Left(Failure(e.message));
    // } catch (_) {
    //   return const Left(Failure("حدث خطأ غير متوقع"));
    // }
  }

  @override
  Future<Either<Failure, ProfileEntity>> getPatientProfileById(
      String patientId) async {
    try {
      final response =
          await profileRemoteDataSource.getPatientProfileById(patientId);
      if (response.data == null) {
        Left(Failure(response.message ?? 'لم يتم العثور علي بيانات المريض'));
      }
      return Right(response.data!.toEntity);
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    } catch (_) {
      return const Left(Failure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, ProfileDoctorEntity>> getDoctorProfile() async {
    try {
      final token = await localDataSource.getToken();
      if (token == null || token.isEmpty) {
        return const Left(Failure("يرجى تسجيل الدخول"));
      }
      final response = await profileRemoteDataSource.getDoctorProfile(token);
      if (response.data == null) {
        return const Left(Failure("لم يتم العثور على بيانات الدكتور"));
      }
      if (response.success == false) {
        return const Left(Failure("حدث خطأ أثناء تحميل بيانات الدكتور"));
      }
      await localDataSource.savedDoctorProfile(response.data!.toEntity);
      return Right(response.data!.toEntity);
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> updateDoctorProfile(
      UpdateDoctorProfileRequest request) async {
    try {
      final token = await localDataSource.getToken();
      final message =
          await profileRemoteDataSource.updateDoctorProfile(token!, request);
      return Right(message);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

//   @override
//   Future<Either<Failure, ProfileEntity>> updatePatientProfile(
//       RegisterRequest request) async {
//     try {
//       final token = await localDataSource.getToken();
//       if (token == null || token.isEmpty) {
//         return const Left(
//             Failure('لم يتم العثور على رمز التوثيق , يرجى تسجيل الدخول'));
//       }
//       final response =
//           await profileRemoteDataSource.updatePatientProfile(token, request);
//       if (response.data == null) {
//         return const Left(Failure('لم يتم تحديث البيانات'));
//       }
//       return Right(response.data!)
//     } catch (e) {}
//   }
}
