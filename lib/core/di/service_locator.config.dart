// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graduation_project/core/di/register_modul.dart' as _i48;
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i15;
import 'package:graduation_project/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart'
    as _i16;
import 'package:graduation_project/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i10;
import 'package:graduation_project/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i9;
import 'package:graduation_project/features/auth/data/repository/auth_repository_impl.dart'
    as _i22;
import 'package:graduation_project/features/auth/domain/repository/auth_repository.dart'
    as _i21;
import 'package:graduation_project/features/auth/domain/use_cases/login_use_case.dart'
    as _i34;
import 'package:graduation_project/features/auth/domain/use_cases/register_use_case.dart'
    as _i35;
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart'
    as _i39;
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_api_remote_data_source.dart'
    as _i8;
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_remote_data_source.dart'
    as _i7;
import 'package:graduation_project/features/doctor/data/repository/doctor_repository_impl.dart'
    as _i27;
import 'package:graduation_project/features/doctor/domain/repository/doctor_repository.dart'
    as _i26;
import 'package:graduation_project/features/doctor/domain/use_case.dart/get_doctors.dart'
    as _i30;
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart'
    as _i42;
import 'package:graduation_project/features/profile/data/data_source/remote/profile_api_remote_data_source.dart'
    as _i6;
import 'package:graduation_project/features/profile/data/data_source/remote/profile_remote_data_source.dart'
    as _i5;
import 'package:graduation_project/features/profile/data/repository/profile_repository_impl.dart'
    as _i25;
import 'package:graduation_project/features/profile/domain/repository/profile_repository.dart'
    as _i24;
import 'package:graduation_project/features/profile/domain/use_cases/profile_use_case.dart'
    as _i41;
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart'
    as _i40;
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_api_remote_data_source.dart'
    as _i18;
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_remote_data_source.dart'
    as _i17;
import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_api_remote_data_source.dart'
    as _i12;
import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_remote_data_source.dart'
    as _i11;
import 'package:graduation_project/features/user/booking/data/repository/appointment_doctorById_repository_imp.dart'
    as _i38;
import 'package:graduation_project/features/user/booking/data/repository/booking_patient_repository_impl.dart'
    as _i33;
import 'package:graduation_project/features/user/booking/data/repository/booking_repository_impl.dart'
    as _i20;
import 'package:graduation_project/features/user/booking/domain/repository/appointment_doctorById_repository.dart'
    as _i37;
import 'package:graduation_project/features/user/booking/domain/repository/booking_patient_repository.dart'
    as _i32;
import 'package:graduation_project/features/user/booking/domain/repository/booking_repository.dart'
    as _i19;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_appointment_doctor_by%20_id.dart'
    as _i44;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_patient_booking.dart'
    as _i36;
import 'package:graduation_project/features/user/booking/domain/use_cases/post_booking_appointment.dart'
    as _i23;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart'
    as _i45;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart'
    as _i31;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart'
    as _i47;
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_api_remote_data_source.dart'
    as _i14;
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_remote_data_source.dart'
    as _i13;
import 'package:graduation_project/features/user/clinic/data/repository/clinic_repository_impl.dart'
    as _i29;
import 'package:graduation_project/features/user/clinic/domain/repository/clinic_repository.dart'
    as _i28;
import 'package:graduation_project/features/user/clinic/domain/use_case/get_clinics.dart'
    as _i43;
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart'
    as _i46;
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
    gh.singleton<_i5.ProfileRemoteDataSource>(
        () => _i6.ProfileApiRemoteDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i7.DoctorRemoteDataSource>(
        () => _i8.DoctorApiRemoteDataSource(gh<_i3.Dio>()));
    gh.singleton<_i9.AuthRemoteDataSource>(
        () => _i10.AuthAPIRemoteDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i11.BookingRemoteDataSource>(
        () => _i12.BookingApiRemoteDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i13.ClinicRemoteDataSource>(
        () => _i14.ClinicApiRemoteDataSource(gh<_i3.Dio>()));
    gh.singletonAsync<_i15.AuthLocalDataSource>(() async =>
        _i16.AuthSharedPrefLocalDataSource(
            await getAsync<_i4.SharedPreferences>()));
    gh.singleton<_i17.AppointmentRemoteDataSource>(
        () => _i18.AppointmentApiRemoteDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i19.BookingRepository>(
        () => _i20.BookingRepositoryImpl(gh<_i11.BookingRemoteDataSource>()));
    gh.singletonAsync<_i21.AuthRepository>(() async => _i22.AuthRepositoryImpl(
          gh<_i9.AuthRemoteDataSource>(),
          await getAsync<_i15.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i23.PostBookAppointment>(
        () => _i23.PostBookAppointment(gh<_i19.BookingRepository>()));
    gh.singletonAsync<_i24.ProfileRepository>(
        () async => _i25.ProfileRepositoryImpl(
              await getAsync<_i15.AuthLocalDataSource>(),
              gh<_i5.ProfileRemoteDataSource>(),
            ));
    gh.lazySingleton<_i26.DoctorRepository>(
        () => _i27.DoctorRepositoryImpl(gh<_i7.DoctorRemoteDataSource>()));
    gh.lazySingleton<_i28.ClinicRepository>(
        () => _i29.ClinicRepositoryImpl(gh<_i13.ClinicRemoteDataSource>()));
    gh.lazySingleton<_i30.GetDoctors>(
        () => _i30.GetDoctors(gh<_i26.DoctorRepository>()));
    gh.lazySingleton<_i30.GetDoctorsByClinicId>(
        () => _i30.GetDoctorsByClinicId(gh<_i26.DoctorRepository>()));
    gh.factory<_i31.BookingCubit>(() => _i31.BookingCubit(
        bookAppointmentUseCase: gh<_i23.PostBookAppointment>()));
    gh.lazySingleton<_i32.BookingPatientRepository>(() =>
        _i33.BookingPatientRepositoryImpl(gh<_i11.BookingRemoteDataSource>()));
    gh.singletonAsync<_i34.LoginUseCase>(
        () async => _i34.LoginUseCase(await getAsync<_i21.AuthRepository>()));
    gh.singletonAsync<_i35.RegisterUseCase>(() async =>
        _i35.RegisterUseCase(await getAsync<_i21.AuthRepository>()));
    gh.lazySingleton<_i36.GetBookingPatient>(
        () => _i36.GetBookingPatient(gh<_i32.BookingPatientRepository>()));
    gh.lazySingleton<_i37.AppointmentDoctorByIdRepository>(() =>
        _i38.AppointmentDoctorByIdRepositoryImpl(
            gh<_i17.AppointmentRemoteDataSource>()));
    gh.singletonAsync<_i39.AuthCubit>(() async => _i39.AuthCubit(
          await getAsync<_i35.RegisterUseCase>(),
          await getAsync<_i34.LoginUseCase>(),
          await getAsync<_i15.AuthLocalDataSource>(),
        ));
    gh.lazySingletonAsync<_i40.ProfileCubit>(() async =>
        _i40.ProfileCubit(await getAsync<_i24.ProfileRepository>()));
    gh.singletonAsync<_i41.ProfileUseCase>(() async =>
        _i41.ProfileUseCase(await getAsync<_i24.ProfileRepository>()));
    gh.factory<_i42.DoctorsCubit>(() => _i42.DoctorsCubit(
          gh<_i30.GetDoctors>(),
          gh<_i30.GetDoctorsByClinicId>(),
        ));
    gh.lazySingleton<_i43.GetClinics>(
        () => _i43.GetClinics(gh<_i28.ClinicRepository>()));
    gh.lazySingleton<_i43.GetClinicsById>(
        () => _i43.GetClinicsById(gh<_i28.ClinicRepository>()));
    gh.lazySingleton<_i44.GetAppointmentDoctorById>(() =>
        _i44.GetAppointmentDoctorById(
            gh<_i37.AppointmentDoctorByIdRepository>()));
    gh.lazySingleton<_i45.AppointmentCubit>(
        () => _i45.AppointmentCubit(gh<_i44.GetAppointmentDoctorById>()));
    gh.lazySingleton<_i46.ClinicCubit>(() => _i46.ClinicCubit(
          gh<_i43.GetClinics>(),
          gh<_i43.GetClinicsById>(),
        ));
    gh.factory<_i47.BookingPatientCubit>(
        () => _i47.BookingPatientCubit(gh<_i36.GetBookingPatient>()));
    return this;
  }
}

class _$RegisterModule extends _i48.RegisterModule {}
