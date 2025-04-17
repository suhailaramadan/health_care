// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graduation_project/core/di/register_modul.dart' as _i50;
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i15;
import 'package:graduation_project/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart'
    as _i16;
import 'package:graduation_project/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i10;
import 'package:graduation_project/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i9;
import 'package:graduation_project/features/auth/data/repository/auth_repository_impl.dart'
    as _i20;
import 'package:graduation_project/features/auth/domain/repository/auth_repository.dart'
    as _i19;
import 'package:graduation_project/features/auth/domain/use_cases/login_use_case.dart'
    as _i32;
import 'package:graduation_project/features/auth/domain/use_cases/register_use_case.dart'
    as _i33;
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart'
    as _i38;
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_api_remote_data_source.dart'
    as _i8;
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_remote_data_source.dart'
    as _i7;
import 'package:graduation_project/features/doctor/data/repository/doctor_repository_impl.dart'
    as _i24;
import 'package:graduation_project/features/doctor/domain/repository/doctor_repository.dart'
    as _i23;
import 'package:graduation_project/features/doctor/domain/use_case.dart/get_doctors.dart'
    as _i29;
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart'
    as _i40;
import 'package:graduation_project/features/profile/data/data_source/remote/profile_api_remote_data_source.dart'
    as _i6;
import 'package:graduation_project/features/profile/data/data_source/remote/profile_remote_data_source.dart'
    as _i5;
import 'package:graduation_project/features/profile/data/repository/profile_repository_impl.dart'
    as _i22;
import 'package:graduation_project/features/profile/domain/repository/profile_repository.dart'
    as _i21;
import 'package:graduation_project/features/profile/domain/use_cases/profile_use_case.dart'
    as _i39;
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart'
    as _i35;
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_api_remote_data_source.dart'
    as _i18;
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_remote_data_source.dart'
    as _i17;
import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_api_remote_data_source.dart'
    as _i12;
import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_remote_data_source.dart'
    as _i11;
import 'package:graduation_project/features/user/booking/data/repository/appointment_doctorById_repository_imp.dart'
    as _i37;
import 'package:graduation_project/features/user/booking/data/repository/booking_patient_repository_impl.dart'
    as _i31;
import 'package:graduation_project/features/user/booking/data/repository/booking_repository_impl.dart'
    as _i28;
import 'package:graduation_project/features/user/booking/domain/repository/appointment_doctorById_repository.dart'
    as _i36;
import 'package:graduation_project/features/user/booking/domain/repository/booking_patient_repository.dart'
    as _i30;
import 'package:graduation_project/features/user/booking/domain/repository/booking_repository.dart'
    as _i27;
import 'package:graduation_project/features/user/booking/domain/use_cases/delete_booking.dart'
    as _i44;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_appointment_doctor_by%20_id.dart'
    as _i45;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_patient_booking.dart'
    as _i34;
import 'package:graduation_project/features/user/booking/domain/use_cases/post_booking_appointment.dart'
    as _i43;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart'
    as _i46;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart'
    as _i49;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart'
    as _i48;
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_api_remote_data_source.dart'
    as _i14;
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_remote_data_source.dart'
    as _i13;
import 'package:graduation_project/features/user/clinic/data/repository/clinic_repository_impl.dart'
    as _i26;
import 'package:graduation_project/features/user/clinic/domain/repository/clinic_repository.dart'
    as _i25;
import 'package:graduation_project/features/user/clinic/domain/use_case/get_clinics.dart'
    as _i41;
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart'
    as _i47;
import 'package:graduation_project/features/user/clinic/presentation/cubit/search_cubit.dart'
    as _i42;
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
    gh.singletonAsync<_i19.AuthRepository>(() async => _i20.AuthRepositoryImpl(
          gh<_i9.AuthRemoteDataSource>(),
          await getAsync<_i15.AuthLocalDataSource>(),
        ));
    gh.singletonAsync<_i21.ProfileRepository>(
        () async => _i22.ProfileRepositoryImpl(
              await getAsync<_i15.AuthLocalDataSource>(),
              gh<_i5.ProfileRemoteDataSource>(),
            ));
    gh.lazySingleton<_i23.DoctorRepository>(
        () => _i24.DoctorRepositoryImpl(gh<_i7.DoctorRemoteDataSource>()));
    gh.lazySingleton<_i25.ClinicRepository>(
        () => _i26.ClinicRepositoryImpl(gh<_i13.ClinicRemoteDataSource>()));
    gh.lazySingletonAsync<_i27.BookingRepository>(
        () async => _i28.BookingRepositoryImpl(
              gh<_i11.BookingRemoteDataSource>(),
              await getAsync<_i15.AuthLocalDataSource>(),
            ));
    gh.lazySingleton<_i29.GetDoctors>(
        () => _i29.GetDoctors(gh<_i23.DoctorRepository>()));
    gh.lazySingleton<_i29.GetDoctorsByClinicId>(
        () => _i29.GetDoctorsByClinicId(gh<_i23.DoctorRepository>()));
    gh.lazySingleton<_i30.BookingPatientRepository>(() =>
        _i31.BookingPatientRepositoryImpl(gh<_i11.BookingRemoteDataSource>()));
    gh.singletonAsync<_i32.LoginUseCase>(
        () async => _i32.LoginUseCase(await getAsync<_i19.AuthRepository>()));
    gh.singletonAsync<_i33.RegisterUseCase>(() async =>
        _i33.RegisterUseCase(await getAsync<_i19.AuthRepository>()));
    gh.lazySingleton<_i34.GetBookingPatient>(
        () => _i34.GetBookingPatient(gh<_i30.BookingPatientRepository>()));
    gh.lazySingletonAsync<_i35.ProfileCubit>(() async => _i35.ProfileCubit(
          await getAsync<_i21.ProfileRepository>(),
          await getAsync<_i15.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i36.AppointmentDoctorByIdRepository>(() =>
        _i37.AppointmentDoctorByIdRepositoryImpl(
            gh<_i17.AppointmentRemoteDataSource>()));
    gh.singletonAsync<_i38.AuthCubit>(() async => _i38.AuthCubit(
          await getAsync<_i33.RegisterUseCase>(),
          await getAsync<_i32.LoginUseCase>(),
          await getAsync<_i15.AuthLocalDataSource>(),
        ));
    gh.singletonAsync<_i39.ProfileUseCase>(() async =>
        _i39.ProfileUseCase(await getAsync<_i21.ProfileRepository>()));
    gh.factory<_i40.DoctorsCubit>(() => _i40.DoctorsCubit(
          gh<_i29.GetDoctors>(),
          gh<_i29.GetDoctorsByClinicId>(),
        ));
    gh.lazySingleton<_i41.GetClinics>(
        () => _i41.GetClinics(gh<_i25.ClinicRepository>()));
    gh.lazySingleton<_i41.GetClinicsById>(
        () => _i41.GetClinicsById(gh<_i25.ClinicRepository>()));
    gh.lazySingleton<_i41.Search>(
        () => _i41.Search(gh<_i25.ClinicRepository>()));
    gh.lazySingleton<_i42.SearchCubit>(
        () => _i42.SearchCubit(gh<_i41.Search>()));
    gh.lazySingletonAsync<_i43.PostBookAppointment>(() async =>
        _i43.PostBookAppointment(await getAsync<_i27.BookingRepository>()));
    gh.lazySingletonAsync<_i44.DeleteBookingUseCase>(() async =>
        _i44.DeleteBookingUseCase(await getAsync<_i27.BookingRepository>()));
    gh.lazySingleton<_i45.GetAppointmentDoctorById>(() =>
        _i45.GetAppointmentDoctorById(
            gh<_i36.AppointmentDoctorByIdRepository>()));
    gh.lazySingleton<_i46.AppointmentCubit>(
        () => _i46.AppointmentCubit(gh<_i45.GetAppointmentDoctorById>()));
    gh.lazySingleton<_i47.ClinicCubit>(() => _i47.ClinicCubit(
          gh<_i41.GetClinics>(),
          gh<_i41.GetClinicsById>(),
        ));
    gh.factory<_i48.BookingPatientCubit>(
        () => _i48.BookingPatientCubit(gh<_i34.GetBookingPatient>()));
    gh.factoryAsync<_i49.BookingCubit>(() async => _i49.BookingCubit(
        bookAppointmentUseCase: await getAsync<_i43.PostBookAppointment>()));
    gh.lazySingletonAsync<_i49.DeleteBookingCubit>(() async =>
        _i49.DeleteBookingCubit(
            deleteBookingUseCase: await getAsync<_i44.DeleteBookingUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i50.RegisterModule {}
