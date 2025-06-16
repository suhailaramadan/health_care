import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:graduation_project/features/medical_record/data/model/medical_record_add_response/add_medical_record_model.dart';
import 'package:graduation_project/features/medical_record/data/model/update_medical_record_response/update_medical_record_model.dart';
import 'package:graduation_project/features/medical_record/data/repository/medical_record_repository_impl.dart';
import 'package:graduation_project/features/medical_record/domain/entity/medical_record_patient_entity.dart';
import 'package:graduation_project/features/medical_record/domain/repository/medical_record_repository.dart';
import 'package:graduation_project/features/medical_record/domain/use_cases/medical_record_doctor_use_doctor.dart';
import 'package:graduation_project/features/medical_record/domain/use_cases/medical_record_patient_use_case.dart';
import 'package:graduation_project/features/medical_record/presentation/cubit/medical_record_states.dart';
import 'package:injectable/injectable.dart';

@singleton
class MedicalRecordCubit extends Cubit<MedicalResocrdSates> {
  // final MedicalRecordPatientUseCase medicalRecordPatientUseCase;
  final MedicalRecordRepository medicalRecordRepository;
  final AuthLocalDataSource _localDataSource;
  MedicalRecordCubit(this.medicalRecordRepository, this._localDataSource)
      : super(InitialState());
  Future<void> getPatientMedicalRecord({bool isDoctor = false}) async {
    emit(GetMedicalRecordLoading());
    final patientId = await _localDataSource.getPatientId();

    final response =
        await medicalRecordRepository.getPatientMedicalRecord(patientId!);
    response.fold((failure) => emit(GetMedicalRecordError(failure.message)),
        (records) async {
      if (isDoctor) {
        final doctorId = await _localDataSource.getDoctorId();
        final filteredRecord =
            records.where((record) => record.doctorId == doctorId).toList();
        emit(GetMedicalRecordPatientSuccess(filteredRecord));
      } else {
        allRecords = records;
        emit(GetMedicalRecordPatientSuccess(records));
      }
    });

    // final result =
    //     await medicalRecordRepository.getPatientMedicalRecord(patientId);
    // result.fold((failure) => emit(GetMedicalRecordError(failure.message)),
    //     (profile) {
    //   allRecords = profile;
    //   emit(GetMedicalRecordPatientSuccess(profile));
    // });
  }

  Future<void> getDoctorMedicalRecord() async {
    emit(GetMedicalRecordLoading());

    final result = await medicalRecordRepository.getDoctorMedicalRecord();
    result.fold((failure) => emit(GetMedicalRecordError(failure.message)),
        (profile) {
      allRecords = profile;
      emit(GetMedicalRecordPatientSuccess(profile));
    });
  }

  Future<void> getMedicalRecord(int id) async {
    print("get medical for Id$id");
    emit(GetMedicalRecordLoading());
    print("get medical for Id");
    final result = await medicalRecordRepository.getMedicalRecordById(id);
    result.fold((failure) {
      print("get failure message ${failure.message}");
      emit(GetMedicalRecordError(failure.message));
    }, (profile) {
      print("get success $profile");
      allRecords = profile;
      emit(GetMedicalRecordPatientSuccess(profile));
    });
  }

  Future<void> deleteMedicalRecord(int id) async {
    emit(GetMedicalRecordLoading());
    final result = await medicalRecordRepository.deleteMedicalRecord(id);
    result.fold((failure) => emit(GetMedicalRecordError(failure.message)),
        (_) => emit(GetDeleteMedicalRecordSuccess()));
  }

  Future<void> addMedicalRecord(AddMedicalRecordModel add) async {
    emit(GetMedicalRecordLoading());
    final result = await medicalRecordRepository.addMedicalRecord(add);
    result.fold((failure) => emit(GetMedicalRecordError(failure.message)),
        (add) => emit(AddMedicalRecordSuccess(add.data!)));
  }

  Future<void> updateMedicalRecord(
      UpdateMedicalRecordModel update, int bookingId) async {
    emit(GetMedicalRecordLoading());
    final result =
        await medicalRecordRepository.updateMedicalRecord(update, bookingId);
    result.fold((failure) => emit(GetMedicalRecordError(failure.message)),
        (response) {
      print("response==========$response");
      emit(UpdateMedicalRecordSuccess(response.data!));
    });
  }

  DateTime? selectedMonth;
  List<MedicalRecordPatientEntity> allRecords = [];
  void changeMonth(DateTime month) {
    selectedMonth = month;
    final filtered = _filteredRecodesByMonth();
    emit(GetMedicalRecordPatientSuccess(filtered));
  }

  List<MedicalRecordPatientEntity> _filteredRecodesByMonth() {
    if (selectedMonth == null) return allRecords;
    return allRecords.where((record) {
      final date = DateTime.tryParse(record.dateOfVisit ?? '');
      return date != null &&
          date.month == selectedMonth!.month &&
          date.year == selectedMonth!.year;
    }).toList();
  }

  String monthName(int month) {
    const months = [
      'يناير',
      "فبراير",
      "مارس",
      "أبريل",
      "مايو",
      "يونيو"
          "يوليو",
      "أغسطس",
      "سبتمبر",
      "أكتوبر",
      "نوفمبر",
      "ديسمبر"
    ];
    return months[month - 1];
  }
}
