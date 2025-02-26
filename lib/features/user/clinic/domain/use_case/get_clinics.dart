import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/clinic/domain/entities/clinic_entity.dart';
import 'package:graduation_project/features/user/clinic/domain/repository/clinic_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetClinics {
  final ClinicRepository _clinicRepository;
  const GetClinics(this._clinicRepository);
  Future<Either<Failure, List<ClinicEntity>>> call() =>
      _clinicRepository.getClinic();
}
