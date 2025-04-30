// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graduation_project/core/di/register_modul.dart' as _i65;
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
    as _i40;
import 'package:graduation_project/features/auth/domain/use_cases/login_use_case.dart'
    as _i33;
import 'package:graduation_project/features/auth/domain/use_cases/register_use_case.dart'
    as _i34;
import 'package:graduation_project/features/auth/domain/use_cases/reset_password.dart'
    as _i39;
import 'package:graduation_project/features/auth/domain/use_cases/verify_code_use_case.dart'
    as _i35;
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart'
    as _i45;
import 'package:graduation_project/features/auth/presentation/cubit/change_password_cubit.dart'
    as _i54;
import 'package:graduation_project/features/auth/presentation/cubit/forget_password_cubit.dart'
    as _i59;
import 'package:graduation_project/features/auth/presentation/cubit/reset_password_cubit.dart'
    as _i61;
import 'package:graduation_project/features/auth/presentation/cubit/verify_code_cubit.dart'
    as _i49;
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
    as _i48;
import 'package:graduation_project/features/profile/data/data_source/remote/profile_api_remote_data_source.dart'
    as _i6;
import 'package:graduation_project/features/profile/data/data_source/remote/profile_remote_data_source.dart'
    as _i5;
import 'package:graduation_project/features/profile/data/repository/profile_repository_impl.dart'
    as _i22;
import 'package:graduation_project/features/profile/domain/repository/profile_repository.dart'
    as _i21;
import 'package:graduation_project/features/profile/domain/use_cases/profile_use_case.dart'
    as _i46;
import 'package:graduation_project/features/profile/domain/use_cases/update_profile_user_case.dart'
    as _i32;
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart'
    as _i37;
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_api_remote_data_source.dart'
    as _i18;
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_remote_data_source.dart'
    as _i17;
import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_api_remote_data_source.dart'
    as _i12;
import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_remote_data_source.dart'
    as _i11;
import 'package:graduation_project/features/user/booking/data/repository/appointment_doctorById_repository_imp.dart'
    as _i44;
import 'package:graduation_project/features/user/booking/data/repository/booking_patient_repository_impl.dart'
    as _i31;
import 'package:graduation_project/features/user/booking/data/repository/booking_repository_impl.dart'
    as _i28;
import 'package:graduation_project/features/user/booking/data/repository/doctor_appointment_repository_impl.dart'
    as _i42;
import 'package:graduation_project/features/user/booking/domain/repository/appointment_doctorById_repository.dart'
    as _i43;
import 'package:graduation_project/features/user/booking/domain/repository/booking_patient_repository.dart'
    as _i30;
import 'package:graduation_project/features/user/booking/domain/repository/booking_repository.dart'
    as _i27;
import 'package:graduation_project/features/user/booking/domain/repository/doctor_appointments_repository.dart'
    as _i41;
import 'package:graduation_project/features/user/booking/domain/use_cases/create_appointment_use_case.dart'
    as _i47;
import 'package:graduation_project/features/user/booking/domain/use_cases/delete_booking.dart'
    as _i52;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_appointment_doctor_by%20_id.dart'
    as _i55;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_doctor_appointments.dart'
    as _i63;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_patient_booking.dart'
    as _i36;
import 'package:graduation_project/features/user/booking/domain/use_cases/post_booking_appointment.dart'
    as _i53;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart'
    as _i56;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/create_appointment_cubit.dart'
    as _i62;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/doctor_appointments_cubit.dart'
    as _i64;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart'
    as _i60;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart'
    as _i58;
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_api_remote_data_source.dart'
    as _i14;
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_remote_data_source.dart'
    as _i13;
import 'package:graduation_project/features/user/clinic/data/repository/clinic_repository_impl.dart'
    as _i26;
import 'package:graduation_project/features/user/clinic/domain/repository/clinic_repository.dart'
    as _i25;
import 'package:graduation_project/features/user/clinic/domain/use_case/get_clinics.dart'
    as _i50;
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart'
    as _i57;
import 'package:graduation_project/features/user/clinic/presentation/cubit/search_cubit.dart'
    as _i51;
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
    gh.singletonAsync<_i32.UpdatePatientUseCase>(() async =>
        _i32.UpdatePatientUseCase(await getAsync<_i21.ProfileRepository>()));
    gh.singletonAsync<_i33.LoginUseCase>(
        () async => _i33.LoginUseCase(await getAsync<_i19.AuthRepository>()));
    gh.singletonAsync<_i34.RegisterUseCase>(() async =>
        _i34.RegisterUseCase(await getAsync<_i19.AuthRepository>()));
    gh.singletonAsync<_i35.VerifyCodeUseCase>(() async =>
        _i35.VerifyCodeUseCase(await getAsync<_i19.AuthRepository>()));
    gh.lazySingleton<_i36.GetBookingPatient>(
        () => _i36.GetBookingPatient(gh<_i30.BookingPatientRepository>()));
    gh.lazySingletonAsync<_i37.ProfileCubit>(() async => _i37.ProfileCubit(
          await getAsync<_i21.ProfileRepository>(),
          await getAsync<_i15.AuthLocalDataSource>(),
        ));
    gh.singletonAsync<_i38.ChangePasswordUseCase>(() async =>
        _i38.ChangePasswordUseCase(await getAsync<_i19.AuthRepository>()));
    gh.singletonAsync<_i39.ResetPasswordUseCae>(() async =>
        _i39.ResetPasswordUseCae(await getAsync<_i19.AuthRepository>()));
    gh.singletonAsync<_i40.ForgetPasswordUseCase>(() async =>
        _i40.ForgetPasswordUseCase(await getAsync<_i19.AuthRepository>()));
    gh.lazySingletonAsync<_i41.DoctorAppointmentRepository>(
        () async => _i42.DoctorAppointmentsRepositoryImpl(
              await getAsync<_i15.AuthLocalDataSource>(),
              gh<_i17.AppointmentRemoteDataSource>(),
            ));
    gh.lazySingleton<_i43.AppointmentDoctorByIdRepository>(() =>
        _i44.AppointmentDoctorByIdRepositoryImpl(
            gh<_i17.AppointmentRemoteDataSource>()));
    gh.singletonAsync<_i45.AuthCubit>(() async => _i45.AuthCubit(
          await getAsync<_i34.RegisterUseCase>(),
          await getAsync<_i33.LoginUseCase>(),
          await getAsync<_i15.AuthLocalDataSource>(),
        ));
    gh.singletonAsync<_i46.ProfileUseCase>(() async =>
        _i46.ProfileUseCase(await getAsync<_i21.ProfileRepository>()));
    gh.lazySingletonAsync<_i47.CreateAppointmentUseCase>(() async =>
        _i47.CreateAppointmentUseCase(
            await getAsync<_i41.DoctorAppointmentRepository>()));
    gh.factory<_i48.DoctorsCubit>(() => _i48.DoctorsCubit(
          gh<_i29.GetDoctors>(),
          gh<_i29.GetDoctorsByClinicId>(),
        ));
    gh.singletonAsync<_i49.VerifyCodeCubit>(() async =>
        _i49.VerifyCodeCubit(await getAsync<_i35.VerifyCodeUseCase>()));
    gh.lazySingleton<_i50.GetClinics>(
        () => _i50.GetClinics(gh<_i25.ClinicRepository>()));
    gh.lazySingleton<_i50.GetClinicsById>(
        () => _i50.GetClinicsById(gh<_i25.ClinicRepository>()));
    gh.lazySingleton<_i50.Search>(
        () => _i50.Search(gh<_i25.ClinicRepository>()));
    gh.lazySingleton<_i51.SearchCubit>(
        () => _i51.SearchCubit(gh<_i50.Search>()));
    gh.lazySingletonAsync<_i52.DeleteBookingUseCase>(() async =>
        _i52.DeleteBookingUseCase(await getAsync<_i27.BookingRepository>()));
    gh.lazySingletonAsync<_i53.PostBookAppointment>(() async =>
        _i53.PostBookAppointment(await getAsync<_i27.BookingRepository>()));
    gh.singletonAsync<_i54.ChangePasswordCubit>(() async =>
        _i54.ChangePasswordCubit(await getAsync<_i38.ChangePasswordUseCase>()));
    gh.lazySingleton<_i55.GetAppointmentDoctorById>(() =>
        _i55.GetAppointmentDoctorById(
            gh<_i43.AppointmentDoctorByIdRepository>()));
    gh.lazySingleton<_i56.AppointmentCubit>(
        () => _i56.AppointmentCubit(gh<_i55.GetAppointmentDoctorById>()));
    gh.lazySingleton<_i57.ClinicCubit>(() => _i57.ClinicCubit(
          gh<_i50.GetClinics>(),
          gh<_i50.GetClinicsById>(),
        ));
    gh.factory<_i58.BookingPatientCubit>(
        () => _i58.BookingPatientCubit(gh<_i36.GetBookingPatient>()));
    gh.singletonAsync<_i59.ForgetPasswordCubit>(() async =>
        _i59.ForgetPasswordCubit(await getAsync<_i40.ForgetPasswordUseCase>()));
    gh.factoryAsync<_i60.BookingCubit>(() async => _i60.BookingCubit(
        bookAppointmentUseCase: await getAsync<_i53.PostBookAppointment>()));
    gh.singletonAsync<_i61.ResetPasswordCubit>(() async =>
        _i61.ResetPasswordCubit(await getAsync<_i39.ResetPasswordUseCae>()));
    gh.lazySingletonAsync<_i62.CreateAppointmentCubit>(() async =>
        _i62.CreateAppointmentCubit(
            await getAsync<_i47.CreateAppointmentUseCase>()));
    gh.lazySingletonAsync<_i60.DeleteBookingCubit>(() async =>
        _i60.DeleteBookingCubit(
            deleteBookingUseCase: await getAsync<_i52.DeleteBookingUseCase>()));
    gh.lazySingletonAsync<_i63.GetDoctorsAppointments>(() async =>
        _i63.GetDoctorsAppointments(
            await getAsync<_i41.DoctorAppointmentRepository>()));
    gh.lazySingletonAsync<_i64.DoctorAppointmentsCubit>(() async =>
        _i64.DoctorAppointmentsCubit(
            await getAsync<_i63.GetDoctorsAppointments>()));
    return this;
  }
}

class _$RegisterModule extends _i65.RegisterModule {}
