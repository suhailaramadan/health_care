// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graduation_project/core/di/register_modul.dart' as _i19;
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i9;
import 'package:graduation_project/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart'
    as _i10;
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_api_remote_data_source.dart'
    as _i6;
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_remote_data_source.dart'
    as _i5;
import 'package:graduation_project/features/doctor/data/repository/doctor_repository_impl.dart'
    as _i12;
import 'package:graduation_project/features/doctor/domain/repository/doctor_repository.dart'
    as _i11;
import 'package:graduation_project/features/doctor/domain/use_case.dart/get_doctors.dart'
    as _i15;
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart'
    as _i16;
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_api_remote_data_source.dart'
    as _i8;
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_remote_data_source.dart'
    as _i7;
import 'package:graduation_project/features/user/clinic/data/repository/clinic_repository_impl.dart'
    as _i14;
import 'package:graduation_project/features/user/clinic/domain/repository/clinic_repository.dart'
    as _i13;
import 'package:graduation_project/features/user/clinic/domain/use_case/get_clinics.dart'
    as _i17;
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart'
    as _i18;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.Dio>(() => registerModule.dio);
    gh.lazySingletonAsync<_i4.SharedPreferences>(
        () => registerModule.sharedPref);
    gh.lazySingleton<_i5.DoctorRemoteDataSource>(
        () => _i6.DoctorApiRemoteDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i7.ClinicRemoteDataSource>(
        () => _i8.ClinicApiRemoteDataSource(gh<_i3.Dio>()));
    gh.singletonAsync<_i9.AuthLocalDataSource>(() async =>
        _i10.AuthSharedPrefLocalDataSource(
            await getAsync<_i4.SharedPreferences>()));
    gh.lazySingleton<_i11.DoctorRepository>(
        () => _i12.DoctorRepositoryImpl(gh<_i5.DoctorRemoteDataSource>()));
    gh.lazySingleton<_i13.ClinicRepository>(
        () => _i14.ClinicRepositoryImpl(gh<_i7.ClinicRemoteDataSource>()));
    gh.lazySingleton<_i15.GetDoctors>(
        () => _i15.GetDoctors(gh<_i11.DoctorRepository>()));
    gh.lazySingleton<_i15.GetDoctorsByClinicId>(
        () => _i15.GetDoctorsByClinicId(gh<_i11.DoctorRepository>()));
    gh.factory<_i16.DoctorsCubit>(() => _i16.DoctorsCubit(
          gh<_i15.GetDoctors>(),
          gh<_i15.GetDoctorsByClinicId>(),
        ));
    gh.lazySingleton<_i17.GetClinics>(
        () => _i17.GetClinics(gh<_i13.ClinicRepository>()));
    gh.lazySingleton<_i17.GetClinicsById>(
        () => _i17.GetClinicsById(gh<_i13.ClinicRepository>()));
    gh.lazySingleton<_i18.ClinicCubit>(() => _i18.ClinicCubit(
          gh<_i17.GetClinics>(),
          gh<_i17.GetClinicsById>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i19.RegisterModule {}
