// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graduation_project/core/di/register_modul.dart' as _i58;
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
import 'package:graduation_project/features/auth/domain/use_cases/change_password_use_case.dart'
    as _i38;
import 'package:graduation_project/features/auth/domain/use_cases/forget_password_use_case.dart'
    as _i39;
import 'package:graduation_project/features/auth/domain/use_cases/login_use_case.dart'
    as _i32;
import 'package:graduation_project/features/auth/domain/use_cases/register_use_case.dart'
    as _i33;
import 'package:graduation_project/features/auth/domain/use_cases/reset_password.dart'
    as _i37;
import 'package:graduation_project/features/auth/domain/use_cases/verify_code_use_case.dart'
    as _i34;
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart'
    as _i42;
import 'package:graduation_project/features/auth/presentation/cubit/change_password_cubit.dart'
    as _i50;
import 'package:graduation_project/features/auth/presentation/cubit/forget_password_cubit.dart'
    as _i55;
import 'package:graduation_project/features/auth/presentation/cubit/reset_password_cubit.dart'
    as _i57;
import 'package:graduation_project/features/auth/presentation/cubit/verify_code_cubit.dart'
    as _i45;
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
    as _i44;
import 'package:graduation_project/features/profile/data/data_source/remote/profile_api_remote_data_source.dart'
    as _i6;
import 'package:graduation_project/features/profile/data/data_source/remote/profile_remote_data_source.dart'
    as _i5;
import 'package:graduation_project/features/profile/data/repository/profile_repository_impl.dart'
    as _i22;
import 'package:graduation_project/features/profile/domain/repository/profile_repository.dart'
    as _i21;
import 'package:graduation_project/features/profile/domain/use_cases/profile_use_case.dart'
    as _i43;
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart'
    as _i36;
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_api_remote_data_source.dart'
    as _i18;
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_remote_data_source.dart'
    as _i17;
import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_api_remote_data_source.dart'
    as _i12;
import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_remote_data_source.dart'
    as _i11;
import 'package:graduation_project/features/user/booking/data/repository/appointment_doctorById_repository_imp.dart'
    as _i41;
import 'package:graduation_project/features/user/booking/data/repository/booking_patient_repository_impl.dart'
    as _i31;
import 'package:graduation_project/features/user/booking/data/repository/booking_repository_impl.dart'
    as _i28;
import 'package:graduation_project/features/user/booking/domain/repository/appointment_doctorById_repository.dart'
    as _i40;
import 'package:graduation_project/features/user/booking/domain/repository/booking_patient_repository.dart'
    as _i30;
import 'package:graduation_project/features/user/booking/domain/repository/booking_repository.dart'
    as _i27;
import 'package:graduation_project/features/user/booking/domain/use_cases/delete_booking.dart'
    as _i49;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_appointment_doctor_by%20_id.dart'
    as _i51;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_patient_booking.dart'
    as _i35;
import 'package:graduation_project/features/user/booking/domain/use_cases/post_booking_appointment.dart'
    as _i48;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart'
    as _i52;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart'
    as _i56;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart'
    as _i54;
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_api_remote_data_source.dart'
    as _i14;
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_remote_data_source.dart'
    as _i13;
import 'package:graduation_project/features/user/clinic/data/repository/clinic_repository_impl.dart'
    as _i26;
import 'package:graduation_project/features/user/clinic/domain/repository/clinic_repository.dart'
    as _i25;
import 'package:graduation_project/features/user/clinic/domain/use_case/get_clinics.dart'
    as _i46;
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart'
    as _i53;
import 'package:graduation_project/features/user/clinic/presentation/cubit/search_cubit.dart'
    as _i47;
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
    gh.singletonAsync<_i34.VerifyCodeUseCase>(() async =>
        _i34.VerifyCodeUseCase(await getAsync<_i19.AuthRepository>()));
    gh.lazySingleton<_i35.GetBookingPatient>(
        () => _i35.GetBookingPatient(gh<_i30.BookingPatientRepository>()));
    gh.lazySingletonAsync<_i36.ProfileCubit>(() async => _i36.ProfileCubit(
          await getAsync<_i21.ProfileRepository>(),
          await getAsync<_i15.AuthLocalDataSource>(),
        ));
    gh.singletonAsync<_i37.ResetPasswordUseCae>(() async =>
        _i37.ResetPasswordUseCae(await getAsync<_i19.AuthRepository>()));
    gh.singletonAsync<_i38.ChangePasswordUseCase>(() async =>
        _i38.ChangePasswordUseCase(await getAsync<_i19.AuthRepository>()));
    gh.singletonAsync<_i39.ForgetPasswordUseCase>(() async =>
        _i39.ForgetPasswordUseCase(await getAsync<_i19.AuthRepository>()));
    gh.lazySingleton<_i40.AppointmentDoctorByIdRepository>(() =>
        _i41.AppointmentDoctorByIdRepositoryImpl(
            gh<_i17.AppointmentRemoteDataSource>()));
    gh.singletonAsync<_i42.AuthCubit>(() async => _i42.AuthCubit(
          await getAsync<_i33.RegisterUseCase>(),
          await getAsync<_i32.LoginUseCase>(),
          await getAsync<_i15.AuthLocalDataSource>(),
        ));
    gh.singletonAsync<_i43.ProfileUseCase>(() async =>
        _i43.ProfileUseCase(await getAsync<_i21.ProfileRepository>()));
    gh.factory<_i44.DoctorsCubit>(() => _i44.DoctorsCubit(
          gh<_i29.GetDoctors>(),
          gh<_i29.GetDoctorsByClinicId>(),
        ));
    gh.singletonAsync<_i45.VerifyCodeCubit>(() async =>
        _i45.VerifyCodeCubit(await getAsync<_i34.VerifyCodeUseCase>()));
    gh.lazySingleton<_i46.GetClinics>(
        () => _i46.GetClinics(gh<_i25.ClinicRepository>()));
    gh.lazySingleton<_i46.GetClinicsById>(
        () => _i46.GetClinicsById(gh<_i25.ClinicRepository>()));
    gh.lazySingleton<_i46.Search>(
        () => _i46.Search(gh<_i25.ClinicRepository>()));
    gh.lazySingleton<_i47.SearchCubit>(
        () => _i47.SearchCubit(gh<_i46.Search>()));
    gh.lazySingletonAsync<_i48.PostBookAppointment>(() async =>
        _i48.PostBookAppointment(await getAsync<_i27.BookingRepository>()));
    gh.lazySingletonAsync<_i49.DeleteBookingUseCase>(() async =>
        _i49.DeleteBookingUseCase(await getAsync<_i27.BookingRepository>()));
    gh.singletonAsync<_i50.ChangePasswordCubit>(() async =>
        _i50.ChangePasswordCubit(await getAsync<_i38.ChangePasswordUseCase>()));
    gh.lazySingleton<_i51.GetAppointmentDoctorById>(() =>
        _i51.GetAppointmentDoctorById(
            gh<_i40.AppointmentDoctorByIdRepository>()));
    gh.lazySingleton<_i52.AppointmentCubit>(
        () => _i52.AppointmentCubit(gh<_i51.GetAppointmentDoctorById>()));
    gh.lazySingleton<_i53.ClinicCubit>(() => _i53.ClinicCubit(
          gh<_i46.GetClinics>(),
          gh<_i46.GetClinicsById>(),
        ));
    gh.factory<_i54.BookingPatientCubit>(
        () => _i54.BookingPatientCubit(gh<_i35.GetBookingPatient>()));
    gh.singletonAsync<_i55.ForgetPasswordCubit>(() async =>
        _i55.ForgetPasswordCubit(await getAsync<_i39.ForgetPasswordUseCase>()));
    gh.factoryAsync<_i56.BookingCubit>(() async => _i56.BookingCubit(
        bookAppointmentUseCase: await getAsync<_i48.PostBookAppointment>()));
    gh.singletonAsync<_i57.ResetPasswordCubit>(() async =>
        _i57.ResetPasswordCubit(await getAsync<_i37.ResetPasswordUseCae>()));
    gh.lazySingletonAsync<_i56.DeleteBookingCubit>(() async =>
        _i56.DeleteBookingCubit(
            deleteBookingUseCase: await getAsync<_i49.DeleteBookingUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i58.RegisterModule {}
