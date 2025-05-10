import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/medical_record/data/model/medical_record_add_response/add_medical_record_model.dart';
import 'package:graduation_project/features/medical_record/data/model/medical_record_add_response/medical_record_add_response.dart';
import 'package:graduation_project/features/medical_record/data/model/update_medical_record_response/update_medical_record_model.dart';
import 'package:graduation_project/features/medical_record/data/model/update_medical_record_response/update_medical_record_response.dart';
import 'package:graduation_project/features/medical_record/data/remote/medical_record_api_remote_data_source.dart';
import 'package:graduation_project/features/medical_record/data/remote/medical_record_remote_data_source.dart';
import 'package:graduation_project/features/medical_record/domain/entity/medical_record_add_entity.dart';
import 'package:graduation_project/features/medical_record/domain/entity/medical_record_patient_entity.dart';
import 'package:graduation_project/features/medical_record/domain/entity/medical_record_update_entity.dart';
import 'package:graduation_project/features/medical_record/domain/mapper/medical_record_patient_mapper.dart';
import 'package:graduation_project/features/medical_record/domain/repository/medical_record_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: MedicalRecordRepository)
class MedicalRecordRepositoryImpl extends MedicalRecordRepository {
  final MedicalRecordRemoteDataSource recordRemoteDataSource;
  MedicalRecordRepositoryImpl(this.recordRemoteDataSource);
  @override
  Future<Either<Failure, List<MedicalRecordPatientEntity>>>
      getPatientMedicalRecord(String patientId) async {
    try {
      final response =
          await recordRemoteDataSource.getMedicalRecordPatient(patientId);
      return Right(response.data!.map((patient) => patient.toEntity).toList());
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<MedicalRecordPatientEntity>>>
      getDoctorMedicalRecord() async {
    try {
      final response = await recordRemoteDataSource.getMedicalRecordDoctor();
      return Right(response.data!.map((patient) => patient.toEntity).toList());
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<MedicalRecordPatientEntity>>>
      getMedicalRecordById(int id) async {
    try {
      final response = await recordRemoteDataSource.getMedicalRecordById(id);
      return Right(response.data!.map((patient) => patient.toEntity).toList());
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteMedicalRecord(int id) async {
    try {
      final result = await recordRemoteDataSource.deleteMedicalRecord(id);
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MedicalRecordAddResponse>> addMedicalRecord(
      AddMedicalRecordModel addMedicalRecordModel) async {
    try {
      final result =
          await recordRemoteDataSource.addMedicalRecord(addMedicalRecordModel);
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UpdateMedicalRecordResponse>> updateMedicalRecord(
      UpdateMedicalRecordModel data, int bookingId) async {
    try {
      final result =
          await recordRemoteDataSource.updateMedicalRecord(data, bookingId);
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
