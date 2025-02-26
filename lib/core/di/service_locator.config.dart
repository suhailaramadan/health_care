// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graduation_project/core/di/register_modul.dart' as _i11;
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_api_remote_data_source.dart'
    as _i6;
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_remote_data_source.dart'
    as _i5;
import 'package:graduation_project/features/user/clinic/data/repository/clinic_repository_impl.dart'
    as _i8;
import 'package:graduation_project/features/user/clinic/domain/repository/clinic_repository.dart'
    as _i7;
import 'package:graduation_project/features/user/clinic/domain/use_case/get_clinics.dart'
    as _i9;
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart'
    as _i10;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i4.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i5.ClinicRemoteDataSource>(
        () => _i6.ClinicApiRemoteDataSource(gh<_i4.Dio>()));
    gh.lazySingleton<_i7.ClinicRepository>(
        () => _i8.ClinicRepositoryImpl(gh<_i5.ClinicRemoteDataSource>()));
    gh.lazySingleton<_i9.GetClinics>(
        () => _i9.GetClinics(gh<_i7.ClinicRepository>()));
    gh.lazySingleton<_i10.ClinicCubit>(
        () => _i10.ClinicCubit(gh<_i9.GetClinics>()));
    return this;
  }
}

class _$RegisterModule extends _i11.RegisterModule {}
