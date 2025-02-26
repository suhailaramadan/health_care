import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/clinic/domain/entities/clinic_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ClinicRepository {
  Future<Either<Failure, List<ClinicEntity>>> getClinic();
}
