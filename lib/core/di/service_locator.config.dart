// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graduation_project/core/di/register_modul.dart' as _i91;
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i21;
import 'package:graduation_project/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart'
    as _i22;
import 'package:graduation_project/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i10;
import 'package:graduation_project/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i9;
import 'package:graduation_project/features/auth/data/repository/auth_repository_impl.dart'
    as _i29;
import 'package:graduation_project/features/auth/domain/repository/auth_repository.dart'
    as _i28;
import 'package:graduation_project/features/auth/domain/use_cases/change_password_use_case.dart'
    as _i52;
import 'package:graduation_project/features/auth/domain/use_cases/forget_password_use_case.dart'
    as _i54;
import 'package:graduation_project/features/auth/domain/use_cases/login_use_case.dart'
    as _i47;
import 'package:graduation_project/features/auth/domain/use_cases/register_use_case.dart'
    as _i48;
import 'package:graduation_project/features/auth/domain/use_cases/reset_password.dart'
    as _i53;
import 'package:graduation_project/features/auth/domain/use_cases/verify_code_use_case.dart'
    as _i49;
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart'
    as _i61;
import 'package:graduation_project/features/auth/presentation/cubit/change_password_cubit.dart'
    as _i76;
import 'package:graduation_project/features/auth/presentation/cubit/forget_password_cubit.dart'
    as _i85;
import 'package:graduation_project/features/auth/presentation/cubit/reset_password_cubit.dart'
    as _i87;
import 'package:graduation_project/features/auth/presentation/cubit/verify_code_cubit.dart'
    as _i70;
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_api_remote_data_source.dart'
    as _i8;
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_remote_data_source.dart'
    as _i7;
import 'package:graduation_project/features/doctor/data/repository/doctor_repository_impl.dart'
    as _i33;
import 'package:graduation_project/features/doctor/domain/repository/doctor_repository.dart'
    as _i32;
import 'package:graduation_project/features/doctor/domain/use_case.dart/get_doctors.dart'
    as _i41;
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart'
    as _i69;
import 'package:graduation_project/features/medical_record/data/remote/medical_record_api_remote_data_source.dart'
    as _i18;
import 'package:graduation_project/features/medical_record/data/remote/medical_record_remote_data_source.dart'
    as _i17;
import 'package:graduation_project/features/medical_record/data/repository/medical_record_repository_impl.dart'
    as _i26;
import 'package:graduation_project/features/medical_record/domain/repository/medical_record_repository.dart'
    as _i25;
import 'package:graduation_project/features/medical_record/domain/use_cases/medical_record_by_id.dart'
    as _i62;
import 'package:graduation_project/features/medical_record/domain/use_cases/medical_record_doctor_use_doctor.dart'
    as _i63;
import 'package:graduation_project/features/medical_record/domain/use_cases/medical_record_patient_use_case.dart'
    as _i64;
import 'package:graduation_project/features/medical_record/presentation/cubit/medical_record_cubit.dart'
    as _i27;
import 'package:graduation_project/features/notification/data/data_source/remote/notification_api_remote_data_source.dart'
    as _i14;
import 'package:graduation_project/features/notification/data/data_source/remote/notification_remote_data_source.dart'
    as _i13;
import 'package:graduation_project/features/notification/data/repository/notification_repository_impl.dart'
    as _i39;
import 'package:graduation_project/features/notification/domain/repository/notification_repository.dart'
    as _i38;
import 'package:graduation_project/features/notification/domain/use_cases/get_notifications_use_case.dart'
    as _i79;
import 'package:graduation_project/features/notification/domain/use_cases/mark_notification_as_read_use_case.dart'
    as _i80;
import 'package:graduation_project/features/notification/presentiation/cubit/notification_cubit.dart'
    as _i83;
import 'package:graduation_project/features/profile/data/data_source/remote/profile_api_remote_data_source.dart'
    as _i6;
import 'package:graduation_project/features/profile/data/data_source/remote/profile_remote_data_source.dart'
    as _i5;
import 'package:graduation_project/features/profile/data/repository/profile_repository_impl.dart'
    as _i31;
import 'package:graduation_project/features/profile/domain/repository/profile_repository.dart'
    as _i30;
import 'package:graduation_project/features/profile/domain/use_cases/get_doctor_profile.dart'
    as _i45;
import 'package:graduation_project/features/profile/domain/use_cases/get_profile_patient_by_id.dart'
    as _i65;
import 'package:graduation_project/features/profile/domain/use_cases/profile_use_case.dart'
    as _i66;
import 'package:graduation_project/features/profile/domain/use_cases/update_Doctor_profile.dart'
    as _i42;
import 'package:graduation_project/features/profile/domain/use_cases/update_profile_user_case.dart'
    as _i46;
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart'
    as _i51;
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_api_remote_data_source.dart'
    as _i24;
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_remote_data_source.dart'
    as _i23;
import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_api_remote_data_source.dart'
    as _i12;
import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_remote_data_source.dart'
    as _i11;
import 'package:graduation_project/features/user/booking/data/repository/appointment_doctorById_repository_imp.dart'
    as _i58;
import 'package:graduation_project/features/user/booking/data/repository/booking_doctor.dart'
    as _i16;
import 'package:graduation_project/features/user/booking/data/repository/booking_patient_repository_impl.dart'
    as _i44;
import 'package:graduation_project/features/user/booking/data/repository/booking_repository_impl.dart'
    as _i37;
import 'package:graduation_project/features/user/booking/data/repository/doctor_appointment_repository_impl.dart'
    as _i56;
import 'package:graduation_project/features/user/booking/domain/repository/appointment_doctorById_repository.dart'
    as _i57;
import 'package:graduation_project/features/user/booking/domain/repository/booking_doctor.dart'
    as _i15;
import 'package:graduation_project/features/user/booking/domain/repository/booking_patient_repository.dart'
    as _i43;
import 'package:graduation_project/features/user/booking/domain/repository/booking_repository.dart'
    as _i36;
import 'package:graduation_project/features/user/booking/domain/repository/doctor_appointments_repository.dart'
    as _i55;
import 'package:graduation_project/features/user/booking/domain/use_cases/create_appointment_use_case.dart'
    as _i68;
import 'package:graduation_project/features/user/booking/domain/use_cases/delete_appointment.dart'
    as _i59;
import 'package:graduation_project/features/user/booking/domain/use_cases/delete_booking.dart'
    as _i74;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_appointment_doctor_by%20_id.dart'
    as _i78;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_booking_doctor.dart'
    as _i40;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_doctor_appointments.dart'
    as _i89;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_patient_booking.dart'
    as _i50;
import 'package:graduation_project/features/user/booking/domain/use_cases/post_booking_appointment.dart'
    as _i75;
import 'package:graduation_project/features/user/booking/domain/use_cases/update_appointment.dart'
    as _i60;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart'
    as _i81;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/create_appointment_cubit.dart'
    as _i88;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/delete_appointment_cubit.dart'
    as _i72;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/doctor_appointments_cubit.dart'
    as _i90;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/update_appointment_cubit.dart'
    as _i77;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart'
    as _i86;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_doctor_cubit.dart'
    as _i67;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart'
    as _i84;
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_api_remote_data_source.dart'
    as _i20;
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_remote_data_source.dart'
    as _i19;
import 'package:graduation_project/features/user/clinic/data/repository/clinic_repository_impl.dart'
    as _i35;
import 'package:graduation_project/features/user/clinic/domain/repository/clinic_repository.dart'
    as _i34;
import 'package:graduation_project/features/user/clinic/domain/use_case/get_clinics.dart'
    as _i71;
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart'
    as _i82;
import 'package:graduation_project/features/user/clinic/presentation/cubit/search_cubit.dart'
    as _i73;
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
    gh.singleton<_i13.NotificationRemoteDataSource>(
        () => _i14.NotificationApiRemoteDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i15.BookingDoctorRepository>(() =>
        _i16.BookingDoctorRepositoryImpl(gh<_i11.BookingRemoteDataSource>()));
    gh.singleton<_i17.MedicalRecordRemoteDataSource>(
        () => _i18.MedicalRecordApiRemoteDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i19.ClinicRemoteDataSource>(
        () => _i20.ClinicApiRemoteDataSource(gh<_i3.Dio>()));
    gh.singletonAsync<_i21.AuthLocalDataSource>(() async =>
        _i22.AuthSharedPrefLocalDataSource(
            await getAsync<_i4.SharedPreferences>()));
    gh.singleton<_i23.AppointmentRemoteDataSource>(
        () => _i24.AppointmentApiRemoteDataSource(gh<_i3.Dio>()));
    gh.singleton<_i25.MedicalRecordRepository>(() =>
        _i26.MedicalRecordRepositoryImpl(
            gh<_i17.MedicalRecordRemoteDataSource>()));
    gh.singletonAsync<_i27.MedicalRecordCubit>(
        () async => _i27.MedicalRecordCubit(
              gh<_i25.MedicalRecordRepository>(),
              await getAsync<_i21.AuthLocalDataSource>(),
            ));
    gh.singletonAsync<_i28.AuthRepository>(() async => _i29.AuthRepositoryImpl(
          gh<_i9.AuthRemoteDataSource>(),
          await getAsync<_i21.AuthLocalDataSource>(),
        ));
    gh.singletonAsync<_i30.ProfileRepository>(
        () async => _i31.ProfileRepositoryImpl(
              await getAsync<_i21.AuthLocalDataSource>(),
              gh<_i5.ProfileRemoteDataSource>(),
            ));
    gh.lazySingleton<_i32.DoctorRepository>(
        () => _i33.DoctorRepositoryImpl(gh<_i7.DoctorRemoteDataSource>()));
    gh.lazySingleton<_i34.ClinicRepository>(
        () => _i35.ClinicRepositoryImpl(gh<_i19.ClinicRemoteDataSource>()));
    gh.lazySingletonAsync<_i36.BookingRepository>(
        () async => _i37.BookingRepositoryImpl(
              gh<_i11.BookingRemoteDataSource>(),
              await getAsync<_i21.AuthLocalDataSource>(),
            ));
    gh.singleton<_i38.NotificationRepository>(() =>
        _i39.NotificationRepositoryImpl(
            gh<_i13.NotificationRemoteDataSource>()));
    gh.lazySingleton<_i40.GetBookingDoctor>(
        () => _i40.GetBookingDoctor(gh<_i15.BookingDoctorRepository>()));
    gh.lazySingleton<_i41.GetDoctors>(
        () => _i41.GetDoctors(gh<_i32.DoctorRepository>()));
    gh.lazySingleton<_i41.GetDoctorsByClinicId>(
        () => _i41.GetDoctorsByClinicId(gh<_i32.DoctorRepository>()));
    gh.singletonAsync<_i42.UpdateDoctorProfileUseCase>(() async =>
        _i42.UpdateDoctorProfileUseCase(
            await getAsync<_i30.ProfileRepository>()));
    gh.lazySingleton<_i43.BookingPatientRepository>(() =>
        _i44.BookingPatientRepositoryImpl(gh<_i11.BookingRemoteDataSource>()));
    gh.singletonAsync<_i45.GetDoctorProfileUseCase>(() async =>
        _i45.GetDoctorProfileUseCase(await getAsync<_i30.ProfileRepository>()));
    gh.singletonAsync<_i46.UpdatePatientUseCase>(() async =>
        _i46.UpdatePatientUseCase(await getAsync<_i30.ProfileRepository>()));
    gh.singletonAsync<_i47.LoginUseCase>(
        () async => _i47.LoginUseCase(await getAsync<_i28.AuthRepository>()));
    gh.singletonAsync<_i48.RegisterUseCase>(() async =>
        _i48.RegisterUseCase(await getAsync<_i28.AuthRepository>()));
    gh.singletonAsync<_i49.VerifyCodeUseCase>(() async =>
        _i49.VerifyCodeUseCase(await getAsync<_i28.AuthRepository>()));
    gh.lazySingleton<_i50.GetBookingPatient>(
        () => _i50.GetBookingPatient(gh<_i43.BookingPatientRepository>()));
    gh.lazySingletonAsync<_i51.ProfileCubit>(() async => _i51.ProfileCubit(
          await getAsync<_i30.ProfileRepository>(),
          await getAsync<_i21.AuthLocalDataSource>(),
        ));
    gh.singletonAsync<_i52.ChangePasswordUseCase>(() async =>
        _i52.ChangePasswordUseCase(await getAsync<_i28.AuthRepository>()));
    gh.singletonAsync<_i53.ResetPasswordUseCae>(() async =>
        _i53.ResetPasswordUseCae(await getAsync<_i28.AuthRepository>()));
    gh.singletonAsync<_i54.ForgetPasswordUseCase>(() async =>
        _i54.ForgetPasswordUseCase(await getAsync<_i28.AuthRepository>()));
    gh.lazySingletonAsync<_i55.DoctorAppointmentRepository>(
        () async => _i56.DoctorAppointmentsRepositoryImpl(
              await getAsync<_i21.AuthLocalDataSource>(),
              gh<_i23.AppointmentRemoteDataSource>(),
            ));
    gh.lazySingleton<_i57.AppointmentDoctorByIdRepository>(() =>
        _i58.AppointmentDoctorByIdRepositoryImpl(
            gh<_i23.AppointmentRemoteDataSource>()));
    gh.lazySingletonAsync<_i59.DeleteAppointmentUseCase>(() async =>
        _i59.DeleteAppointmentUseCase(
            await getAsync<_i55.DoctorAppointmentRepository>()));
    gh.lazySingletonAsync<_i60.UpdateAppointmentUseCase>(() async =>
        _i60.UpdateAppointmentUseCase(
            await getAsync<_i55.DoctorAppointmentRepository>()));
    gh.singletonAsync<_i61.AuthCubit>(() async => _i61.AuthCubit(
          await getAsync<_i48.RegisterUseCase>(),
          await getAsync<_i47.LoginUseCase>(),
          await getAsync<_i21.AuthLocalDataSource>(),
        ));
    gh.singleton<_i62.MedicalRecordUseCase>(
        () => _i62.MedicalRecordUseCase(gh<_i25.MedicalRecordRepository>()));
    gh.singleton<_i63.MedicalRecordDoctorUseCase>(() =>
        _i63.MedicalRecordDoctorUseCase(gh<_i25.MedicalRecordRepository>()));
    gh.singleton<_i64.MedicalRecordPatientUseCase>(() =>
        _i64.MedicalRecordPatientUseCase(gh<_i25.MedicalRecordRepository>()));
    gh.singletonAsync<_i65.GetPatientProfileByIdUseCase>(() async =>
        _i65.GetPatientProfileByIdUseCase(
            await getAsync<_i30.ProfileRepository>()));
    gh.singletonAsync<_i66.ProfileUseCase>(() async =>
        _i66.ProfileUseCase(await getAsync<_i30.ProfileRepository>()));
    gh.singleton<_i67.BookingDoctorCubit>(
        () => _i67.BookingDoctorCubit(gh<_i40.GetBookingDoctor>()));
    gh.lazySingletonAsync<_i68.CreateAppointmentUseCase>(() async =>
        _i68.CreateAppointmentUseCase(
            await getAsync<_i55.DoctorAppointmentRepository>()));
    gh.factory<_i69.DoctorsCubit>(() => _i69.DoctorsCubit(
          gh<_i41.GetDoctors>(),
          gh<_i41.GetDoctorsByClinicId>(),
        ));
    gh.singletonAsync<_i70.VerifyCodeCubit>(() async =>
        _i70.VerifyCodeCubit(await getAsync<_i49.VerifyCodeUseCase>()));
    gh.lazySingleton<_i71.GetClinics>(
        () => _i71.GetClinics(gh<_i34.ClinicRepository>()));
    gh.lazySingleton<_i71.GetClinicsById>(
        () => _i71.GetClinicsById(gh<_i34.ClinicRepository>()));
    gh.lazySingleton<_i71.Search>(
        () => _i71.Search(gh<_i34.ClinicRepository>()));
    gh.singletonAsync<_i72.DeleteAppointmentCubit>(() async =>
        _i72.DeleteAppointmentCubit(
            await getAsync<_i59.DeleteAppointmentUseCase>()));
    gh.lazySingleton<_i73.SearchCubit>(
        () => _i73.SearchCubit(gh<_i71.Search>()));
    gh.lazySingletonAsync<_i74.DeleteBookingUseCase>(() async =>
        _i74.DeleteBookingUseCase(await getAsync<_i36.BookingRepository>()));
    gh.lazySingletonAsync<_i75.PostBookAppointment>(() async =>
        _i75.PostBookAppointment(await getAsync<_i36.BookingRepository>()));
    gh.singletonAsync<_i76.ChangePasswordCubit>(() async =>
        _i76.ChangePasswordCubit(await getAsync<_i52.ChangePasswordUseCase>()));
    gh.singletonAsync<_i77.UpdateAppointmentCubit>(() async =>
        _i77.UpdateAppointmentCubit(
            await getAsync<_i60.UpdateAppointmentUseCase>()));
    gh.lazySingleton<_i78.GetAppointmentDoctorById>(() =>
        _i78.GetAppointmentDoctorById(
            gh<_i57.AppointmentDoctorByIdRepository>()));
    gh.singleton<_i79.GetNotificationsUseCase>(
        () => _i79.GetNotificationsUseCase(gh<_i38.NotificationRepository>()));
    gh.singleton<_i80.MarkNotificationAsReadUseCase>(() =>
        _i80.MarkNotificationAsReadUseCase(gh<_i38.NotificationRepository>()));
    gh.lazySingleton<_i81.AppointmentCubit>(
        () => _i81.AppointmentCubit(gh<_i78.GetAppointmentDoctorById>()));
    gh.lazySingleton<_i82.ClinicCubit>(() => _i82.ClinicCubit(
          gh<_i71.GetClinics>(),
          gh<_i71.GetClinicsById>(),
        ));
    gh.singleton<_i83.NotificationCubit>(() => _i83.NotificationCubit(
          gh<_i79.GetNotificationsUseCase>(),
          gh<_i80.MarkNotificationAsReadUseCase>(),
        ));
    gh.factory<_i84.BookingPatientCubit>(
        () => _i84.BookingPatientCubit(gh<_i50.GetBookingPatient>()));
    gh.singletonAsync<_i85.ForgetPasswordCubit>(() async =>
        _i85.ForgetPasswordCubit(await getAsync<_i54.ForgetPasswordUseCase>()));
    gh.factoryAsync<_i86.BookingCubit>(() async => _i86.BookingCubit(
        bookAppointmentUseCase: await getAsync<_i75.PostBookAppointment>()));
    gh.singletonAsync<_i87.ResetPasswordCubit>(() async =>
        _i87.ResetPasswordCubit(await getAsync<_i53.ResetPasswordUseCae>()));
    gh.lazySingletonAsync<_i88.CreateAppointmentCubit>(() async =>
        _i88.CreateAppointmentCubit(
            await getAsync<_i68.CreateAppointmentUseCase>()));
    gh.lazySingletonAsync<_i86.DeleteBookingCubit>(() async =>
        _i86.DeleteBookingCubit(
            deleteBookingUseCase: await getAsync<_i74.DeleteBookingUseCase>()));
    gh.lazySingletonAsync<_i89.GetDoctorsAppointments>(() async =>
        _i89.GetDoctorsAppointments(
            await getAsync<_i55.DoctorAppointmentRepository>()));
    gh.lazySingletonAsync<_i90.DoctorAppointmentsCubit>(() async =>
        _i90.DoctorAppointmentsCubit(
            await getAsync<_i89.GetDoctorsAppointments>()));
    return this;
  }
}

class _$RegisterModule extends _i91.RegisterModule {}
