// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graduation_project/core/di/register_modul.dart' as _i20;
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i9;
import 'package:graduation_project/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart'
    as _i10;
import 'package:graduation_project/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i6;
import 'package:graduation_project/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i5;
import 'package:graduation_project/features/auth/data/repository/auth_repository_impl.dart'
    as _i12;
import 'package:graduation_project/features/auth/domain/repository/auth_repository.dart'
    as _i11;
import 'package:graduation_project/features/auth/domain/use_cases/login_use_case.dart'
    as _i16;
import 'package:graduation_project/features/auth/domain/use_cases/register_use_case.dart'
    as _i15;
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart'
    as _i18;
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
    as _i19;
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
      () => registerModule.getSharedPref(),
      preResolve: true,
    );
    gh.singleton<_i4.Dio>(() => registerModule.dio);
    gh.singleton<_i5.AuthRemoteDataSource>(
        () => _i6.AuthAPIRemoteDataSource(gh<_i4.Dio>()));
    gh.lazySingleton<_i7.ClinicRemoteDataSource>(
        () => _i8.ClinicApiRemoteDataSource(gh<_i4.Dio>()));
    gh.singleton<_i9.AuthLocalDataSource>(
        () => _i10.AuthSharedPrefLocalDataSource(gh<_i3.SharedPreferences>()));
    gh.singleton<_i11.AuthRepository>(() => _i12.AuthRepositoryImpl(
          gh<_i5.AuthRemoteDataSource>(),
          gh<_i9.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i13.ClinicRepository>(
        () => _i14.ClinicRepositoryImpl(gh<_i7.ClinicRemoteDataSource>()));
    gh.singleton<_i15.RegisterUseCase>(
        () => _i15.RegisterUseCase(gh<_i11.AuthRepository>()));
    gh.singleton<_i16.LoginUseCase>(
        () => _i16.LoginUseCase(gh<_i11.AuthRepository>()));
    gh.lazySingleton<_i17.GetClinics>(
        () => _i17.GetClinics(gh<_i13.ClinicRepository>()));
    gh.singleton<_i18.AuthCubit>(() => _i18.AuthCubit(
          gh<_i15.RegisterUseCase>(),
          gh<_i16.LoginUseCase>(),
        ));
    gh.lazySingleton<_i19.ClinicCubit>(
        () => _i19.ClinicCubit(gh<_i17.GetClinics>()));
    return this;
  }
}

class _$RegisterModule extends _i20.RegisterModule {}
