import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_api_remote_data_source.dart';
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_remote_data_source.dart';
import 'package:graduation_project/features/doctor/data/mapper/doctor_mapper.dart';
import 'package:graduation_project/features/doctor/data/model/doctor_response/doctor_model.dart';
import 'package:graduation_project/features/doctor/domain/entities/doctor_entity.dart';
import 'package:graduation_project/features/doctor/domain/repository/doctor_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DoctorRepository)
class DoctorRepositoryImpl implements DoctorRepository {
  final DoctorRemoteDataSource _doctorRemoteDataSource;
  DoctorRepositoryImpl(this._doctorRemoteDataSource);
  @override
  Future<Either<Failure, List<DoctorEntity>>> getDoctors() async {
    try {
      final response = await _doctorRemoteDataSource.getDoctors();
      return Right(response.data == null
          ? []
          : response.data!.map((doctorModel) => doctorModel.toEntity).toList());
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, List<DoctorEntity>>> getDoctorsByClinicId(
      int clinicId) async {
    try {
      final response =
          await _doctorRemoteDataSource.getDoctorsByClinicId(clinicId);
      return Right(response.data == null
          ? []
          : response.data!.map((doctorModel) => doctorModel.toEntity).toList());
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
