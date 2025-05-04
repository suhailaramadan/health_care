// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graduation_project/core/di/register_modul.dart' as _i75;
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i17;
import 'package:graduation_project/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart'
    as _i18;
import 'package:graduation_project/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i10;
import 'package:graduation_project/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i9;
import 'package:graduation_project/features/auth/data/repository/auth_repository_impl.dart'
    as _i22;
import 'package:graduation_project/features/auth/domain/repository/auth_repository.dart'
    as _i21;
import 'package:graduation_project/features/auth/domain/use_cases/change_password_use_case.dart'
    as _i42;
import 'package:graduation_project/features/auth/domain/use_cases/forget_password_use_case.dart'
    as _i44;
import 'package:graduation_project/features/auth/domain/use_cases/login_use_case.dart'
    as _i37;
import 'package:graduation_project/features/auth/domain/use_cases/register_use_case.dart'
    as _i38;
import 'package:graduation_project/features/auth/domain/use_cases/reset_password.dart'
    as _i43;
import 'package:graduation_project/features/auth/domain/use_cases/verify_code_use_case.dart'
    as _i39;
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart'
    as _i51;
import 'package:graduation_project/features/auth/presentation/cubit/change_password_cubit.dart'
    as _i63;
import 'package:graduation_project/features/auth/presentation/cubit/forget_password_cubit.dart'
    as _i69;
import 'package:graduation_project/features/auth/presentation/cubit/reset_password_cubit.dart'
    as _i71;
import 'package:graduation_project/features/auth/presentation/cubit/verify_code_cubit.dart'
    as _i57;
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_api_remote_data_source.dart'
    as _i8;
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_remote_data_source.dart'
    as _i7;
import 'package:graduation_project/features/doctor/data/repository/doctor_repository_impl.dart'
    as _i26;
import 'package:graduation_project/features/doctor/domain/repository/doctor_repository.dart'
    as _i25;
import 'package:graduation_project/features/doctor/domain/use_case.dart/get_doctors.dart'
    as _i32;
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart'
    as _i56;
import 'package:graduation_project/features/profile/data/data_source/remote/profile_api_remote_data_source.dart'
    as _i6;
import 'package:graduation_project/features/profile/data/data_source/remote/profile_remote_data_source.dart'
    as _i5;
import 'package:graduation_project/features/profile/data/repository/profile_repository_impl.dart'
    as _i24;
import 'package:graduation_project/features/profile/domain/repository/profile_repository.dart'
    as _i23;
import 'package:graduation_project/features/profile/domain/use_cases/get_doctor_profile.dart'
    as _i36;
import 'package:graduation_project/features/profile/domain/use_cases/get_profile_patient_by_id.dart'
    as _i53;
import 'package:graduation_project/features/profile/domain/use_cases/profile_use_case.dart'
    as _i52;
import 'package:graduation_project/features/profile/domain/use_cases/update_profile_user_case.dart'
    as _i35;
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart'
    as _i41;
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_api_remote_data_source.dart'
    as _i20;
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_remote_data_source.dart'
    as _i19;
import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_api_remote_data_source.dart'
    as _i12;
import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_remote_data_source.dart'
    as _i11;
import 'package:graduation_project/features/user/booking/data/repository/appointment_doctorById_repository_imp.dart'
    as _i48;
import 'package:graduation_project/features/user/booking/data/repository/booking_doctor.dart'
    as _i14;
import 'package:graduation_project/features/user/booking/data/repository/booking_patient_repository_impl.dart'
    as _i34;
import 'package:graduation_project/features/user/booking/data/repository/booking_repository_impl.dart'
    as _i30;
import 'package:graduation_project/features/user/booking/data/repository/doctor_appointment_repository_impl.dart'
    as _i46;
import 'package:graduation_project/features/user/booking/domain/repository/appointment_doctorById_repository.dart'
    as _i47;
import 'package:graduation_project/features/user/booking/domain/repository/booking_doctor.dart'
    as _i13;
import 'package:graduation_project/features/user/booking/domain/repository/booking_patient_repository.dart'
    as _i33;
import 'package:graduation_project/features/user/booking/domain/repository/booking_repository.dart'
    as _i29;
import 'package:graduation_project/features/user/booking/domain/repository/doctor_appointments_repository.dart'
    as _i45;
import 'package:graduation_project/features/user/booking/domain/use_cases/create_appointment_use_case.dart'
    as _i55;
import 'package:graduation_project/features/user/booking/domain/use_cases/delete_appointment.dart'
    as _i49;
import 'package:graduation_project/features/user/booking/domain/use_cases/delete_booking.dart'
    as _i61;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_appointment_doctor_by%20_id.dart'
    as _i65;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_booking_doctor.dart'
    as _i31;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_doctor_appointments.dart'
    as _i73;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_patient_booking.dart'
    as _i40;
import 'package:graduation_project/features/user/booking/domain/use_cases/post_booking_appointment.dart'
    as _i62;
import 'package:graduation_project/features/user/booking/domain/use_cases/update_appointment.dart'
    as _i50;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart'
    as _i66;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/create_appointment_cubit.dart'
    as _i72;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/delete_appointment_cubit.dart'
    as _i59;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/doctor_appointments_cubit.dart'
    as _i74;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/update_appointment_cubit.dart'
    as _i64;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart'
    as _i70;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_doctor_cubit.dart'
    as _i54;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart'
    as _i68;
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_api_remote_data_source.dart'
    as _i16;
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_remote_data_source.dart'
    as _i15;
import 'package:graduation_project/features/user/clinic/data/repository/clinic_repository_impl.dart'
    as _i28;
import 'package:graduation_project/features/user/clinic/domain/repository/clinic_repository.dart'
    as _i27;
import 'package:graduation_project/features/user/clinic/domain/use_case/get_clinics.dart'
    as _i58;
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart'
    as _i67;
import 'package:graduation_project/features/user/clinic/presentation/cubit/search_cubit.dart'
    as _i60;
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
    gh.lazySingleton<_i13.BookingDoctorRepository>(() =>
        _i14.BookingDoctorRepositoryImpl(gh<_i11.BookingRemoteDataSource>()));
    gh.lazySingleton<_i15.ClinicRemoteDataSource>(
        () => _i16.ClinicApiRemoteDataSource(gh<_i3.Dio>()));
    gh.singletonAsync<_i17.AuthLocalDataSource>(() async =>
        _i18.AuthSharedPrefLocalDataSource(
            await getAsync<_i4.SharedPreferences>()));
    gh.singleton<_i19.AppointmentRemoteDataSource>(
        () => _i20.AppointmentApiRemoteDataSource(gh<_i3.Dio>()));
    gh.singletonAsync<_i21.AuthRepository>(() async => _i22.AuthRepositoryImpl(
          gh<_i9.AuthRemoteDataSource>(),
          await getAsync<_i17.AuthLocalDataSource>(),
        ));
    gh.singletonAsync<_i23.ProfileRepository>(
        () async => _i24.ProfileRepositoryImpl(
              await getAsync<_i17.AuthLocalDataSource>(),
              gh<_i5.ProfileRemoteDataSource>(),
            ));
    gh.lazySingleton<_i25.DoctorRepository>(
        () => _i26.DoctorRepositoryImpl(gh<_i7.DoctorRemoteDataSource>()));
    gh.lazySingleton<_i27.ClinicRepository>(
        () => _i28.ClinicRepositoryImpl(gh<_i15.ClinicRemoteDataSource>()));
    gh.lazySingletonAsync<_i29.BookingRepository>(
        () async => _i30.BookingRepositoryImpl(
              gh<_i11.BookingRemoteDataSource>(),
              await getAsync<_i17.AuthLocalDataSource>(),
            ));
    gh.lazySingleton<_i31.GetBookingDoctor>(
        () => _i31.GetBookingDoctor(gh<_i13.BookingDoctorRepository>()));
    gh.lazySingleton<_i32.GetDoctors>(
        () => _i32.GetDoctors(gh<_i25.DoctorRepository>()));
    gh.lazySingleton<_i32.GetDoctorsByClinicId>(
        () => _i32.GetDoctorsByClinicId(gh<_i25.DoctorRepository>()));
    gh.lazySingleton<_i33.BookingPatientRepository>(() =>
        _i34.BookingPatientRepositoryImpl(gh<_i11.BookingRemoteDataSource>()));
    gh.singletonAsync<_i35.UpdatePatientUseCase>(() async =>
        _i35.UpdatePatientUseCase(await getAsync<_i23.ProfileRepository>()));
    gh.singletonAsync<_i36.GetDoctorProfileUseCase>(() async =>
        _i36.GetDoctorProfileUseCase(await getAsync<_i23.ProfileRepository>()));
    gh.singletonAsync<_i37.LoginUseCase>(
        () async => _i37.LoginUseCase(await getAsync<_i21.AuthRepository>()));
    gh.singletonAsync<_i38.RegisterUseCase>(() async =>
        _i38.RegisterUseCase(await getAsync<_i21.AuthRepository>()));
    gh.singletonAsync<_i39.VerifyCodeUseCase>(() async =>
        _i39.VerifyCodeUseCase(await getAsync<_i21.AuthRepository>()));
    gh.lazySingleton<_i40.GetBookingPatient>(
        () => _i40.GetBookingPatient(gh<_i33.BookingPatientRepository>()));
    gh.lazySingletonAsync<_i41.ProfileCubit>(() async => _i41.ProfileCubit(
          await getAsync<_i23.ProfileRepository>(),
          await getAsync<_i17.AuthLocalDataSource>(),
        ));
    gh.singletonAsync<_i42.ChangePasswordUseCase>(() async =>
        _i42.ChangePasswordUseCase(await getAsync<_i21.AuthRepository>()));
    gh.singletonAsync<_i43.ResetPasswordUseCae>(() async =>
        _i43.ResetPasswordUseCae(await getAsync<_i21.AuthRepository>()));
    gh.singletonAsync<_i44.ForgetPasswordUseCase>(() async =>
        _i44.ForgetPasswordUseCase(await getAsync<_i21.AuthRepository>()));
    gh.lazySingletonAsync<_i45.DoctorAppointmentRepository>(
        () async => _i46.DoctorAppointmentsRepositoryImpl(
              await getAsync<_i17.AuthLocalDataSource>(),
              gh<_i19.AppointmentRemoteDataSource>(),
            ));
    gh.lazySingleton<_i47.AppointmentDoctorByIdRepository>(() =>
        _i48.AppointmentDoctorByIdRepositoryImpl(
            gh<_i19.AppointmentRemoteDataSource>()));
    gh.lazySingletonAsync<_i49.DeleteAppointmentUseCase>(() async =>
        _i49.DeleteAppointmentUseCase(
            await getAsync<_i45.DoctorAppointmentRepository>()));
    gh.lazySingletonAsync<_i50.UpdateAppointmentUseCase>(() async =>
        _i50.UpdateAppointmentUseCase(
            await getAsync<_i45.DoctorAppointmentRepository>()));
    gh.singletonAsync<_i51.AuthCubit>(() async => _i51.AuthCubit(
          await getAsync<_i38.RegisterUseCase>(),
          await getAsync<_i37.LoginUseCase>(),
          await getAsync<_i17.AuthLocalDataSource>(),
        ));
    gh.singletonAsync<_i52.ProfileUseCase>(() async =>
        _i52.ProfileUseCase(await getAsync<_i23.ProfileRepository>()));
    gh.singletonAsync<_i53.GetPatientProfileByIdUseCase>(() async =>
        _i53.GetPatientProfileByIdUseCase(
            await getAsync<_i23.ProfileRepository>()));
    gh.singleton<_i54.BookingDoctorCubit>(
        () => _i54.BookingDoctorCubit(gh<_i31.GetBookingDoctor>()));
    gh.lazySingletonAsync<_i55.CreateAppointmentUseCase>(() async =>
        _i55.CreateAppointmentUseCase(
            await getAsync<_i45.DoctorAppointmentRepository>()));
    gh.factory<_i56.DoctorsCubit>(() => _i56.DoctorsCubit(
          gh<_i32.GetDoctors>(),
          gh<_i32.GetDoctorsByClinicId>(),
        ));
    gh.singletonAsync<_i57.VerifyCodeCubit>(() async =>
        _i57.VerifyCodeCubit(await getAsync<_i39.VerifyCodeUseCase>()));
    gh.lazySingleton<_i58.GetClinics>(
        () => _i58.GetClinics(gh<_i27.ClinicRepository>()));
    gh.lazySingleton<_i58.GetClinicsById>(
        () => _i58.GetClinicsById(gh<_i27.ClinicRepository>()));
    gh.lazySingleton<_i58.Search>(
        () => _i58.Search(gh<_i27.ClinicRepository>()));
    gh.singletonAsync<_i59.DeleteAppointmentCubit>(() async =>
        _i59.DeleteAppointmentCubit(
            await getAsync<_i49.DeleteAppointmentUseCase>()));
    gh.lazySingleton<_i60.SearchCubit>(
        () => _i60.SearchCubit(gh<_i58.Search>()));
    gh.lazySingletonAsync<_i61.DeleteBookingUseCase>(() async =>
        _i61.DeleteBookingUseCase(await getAsync<_i29.BookingRepository>()));
    gh.lazySingletonAsync<_i62.PostBookAppointment>(() async =>
        _i62.PostBookAppointment(await getAsync<_i29.BookingRepository>()));
    gh.singletonAsync<_i63.ChangePasswordCubit>(() async =>
        _i63.ChangePasswordCubit(await getAsync<_i42.ChangePasswordUseCase>()));
    gh.singletonAsync<_i64.UpdateAppointmentCubit>(() async =>
        _i64.UpdateAppointmentCubit(
            await getAsync<_i50.UpdateAppointmentUseCase>()));
    gh.lazySingleton<_i65.GetAppointmentDoctorById>(() =>
        _i65.GetAppointmentDoctorById(
            gh<_i47.AppointmentDoctorByIdRepository>()));
    gh.lazySingleton<_i66.AppointmentCubit>(
        () => _i66.AppointmentCubit(gh<_i65.GetAppointmentDoctorById>()));
    gh.lazySingleton<_i67.ClinicCubit>(() => _i67.ClinicCubit(
          gh<_i58.GetClinics>(),
          gh<_i58.GetClinicsById>(),
        ));
    gh.factory<_i68.BookingPatientCubit>(
        () => _i68.BookingPatientCubit(gh<_i40.GetBookingPatient>()));
    gh.singletonAsync<_i69.ForgetPasswordCubit>(() async =>
        _i69.ForgetPasswordCubit(await getAsync<_i44.ForgetPasswordUseCase>()));
    gh.factoryAsync<_i70.BookingCubit>(() async => _i70.BookingCubit(
        bookAppointmentUseCase: await getAsync<_i62.PostBookAppointment>()));
    gh.singletonAsync<_i71.ResetPasswordCubit>(() async =>
        _i71.ResetPasswordCubit(await getAsync<_i43.ResetPasswordUseCae>()));
    gh.lazySingletonAsync<_i72.CreateAppointmentCubit>(() async =>
        _i72.CreateAppointmentCubit(
            await getAsync<_i55.CreateAppointmentUseCase>()));
    gh.lazySingletonAsync<_i70.DeleteBookingCubit>(() async =>
        _i70.DeleteBookingCubit(
            deleteBookingUseCase: await getAsync<_i61.DeleteBookingUseCase>()));
    gh.lazySingletonAsync<_i73.GetDoctorsAppointments>(() async =>
        _i73.GetDoctorsAppointments(
            await getAsync<_i45.DoctorAppointmentRepository>()));
    gh.lazySingletonAsync<_i74.DoctorAppointmentsCubit>(() async =>
        _i74.DoctorAppointmentsCubit(
            await getAsync<_i73.GetDoctorsAppointments>()));
    return this;
  }
}

class _$RegisterModule extends _i75.RegisterModule {}
