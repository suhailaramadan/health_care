// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graduation_project/core/di/register_modul.dart' as _i98;
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i23;
import 'package:graduation_project/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart'
    as _i24;
import 'package:graduation_project/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i10;
import 'package:graduation_project/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i9;
import 'package:graduation_project/features/auth/data/repository/auth_repository_impl.dart'
    as _i35;
import 'package:graduation_project/features/auth/domain/repository/auth_repository.dart'
    as _i34;
import 'package:graduation_project/features/auth/domain/use_cases/change_password_use_case.dart'
    as _i59;
import 'package:graduation_project/features/auth/domain/use_cases/forget_password_use_case.dart'
    as _i61;
import 'package:graduation_project/features/auth/domain/use_cases/login_use_case.dart'
    as _i53;
import 'package:graduation_project/features/auth/domain/use_cases/register_use_case.dart'
    as _i54;
import 'package:graduation_project/features/auth/domain/use_cases/reset_password.dart'
    as _i60;
import 'package:graduation_project/features/auth/domain/use_cases/verify_code_use_case.dart'
    as _i55;
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart'
    as _i68;
import 'package:graduation_project/features/auth/presentation/cubit/change_password_cubit.dart'
    as _i83;
import 'package:graduation_project/features/auth/presentation/cubit/forget_password_cubit.dart'
    as _i92;
import 'package:graduation_project/features/auth/presentation/cubit/reset_password_cubit.dart'
    as _i94;
import 'package:graduation_project/features/auth/presentation/cubit/verify_code_cubit.dart'
    as _i77;
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_api_remote_data_source.dart'
    as _i8;
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_remote_data_source.dart'
    as _i7;
import 'package:graduation_project/features/doctor/data/repository/doctor_repository_impl.dart'
    as _i39;
import 'package:graduation_project/features/doctor/domain/repository/doctor_repository.dart'
    as _i38;
import 'package:graduation_project/features/doctor/domain/use_case.dart/get_doctors.dart'
    as _i47;
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart'
    as _i76;
import 'package:graduation_project/features/medical_record/data/remote/medical_record_api_remote_data_source.dart'
    as _i20;
import 'package:graduation_project/features/medical_record/data/remote/medical_record_remote_data_source.dart'
    as _i19;
import 'package:graduation_project/features/medical_record/data/repository/medical_record_repository_impl.dart'
    as _i30;
import 'package:graduation_project/features/medical_record/domain/repository/medical_record_repository.dart'
    as _i29;
import 'package:graduation_project/features/medical_record/domain/use_cases/medical_record_by_id.dart'
    as _i69;
import 'package:graduation_project/features/medical_record/domain/use_cases/medical_record_doctor_use_doctor.dart'
    as _i70;
import 'package:graduation_project/features/medical_record/domain/use_cases/medical_record_patient_use_case.dart'
    as _i71;
import 'package:graduation_project/features/medical_record/presentation/cubit/medical_record_cubit.dart'
    as _i33;
import 'package:graduation_project/features/notification/data/data_source/remote/local/local_data_source.dart'
    as _i31;
import 'package:graduation_project/features/notification/data/data_source/remote/local/local_data_source_shared_pref.dart'
    as _i32;
import 'package:graduation_project/features/notification/data/data_source/remote/notification_api_remote_data_source.dart'
    as _i14;
import 'package:graduation_project/features/notification/data/data_source/remote/notification_remote_data_source.dart'
    as _i13;
import 'package:graduation_project/features/notification/data/repository/notification_repository_impl.dart'
    as _i45;
import 'package:graduation_project/features/notification/domain/repository/notification_repository.dart'
    as _i44;
import 'package:graduation_project/features/notification/domain/use_cases/get_notifications_use_case.dart'
    as _i86;
import 'package:graduation_project/features/notification/domain/use_cases/mark_notification_as_read_use_case.dart'
    as _i87;
import 'package:graduation_project/features/notification/presentiation/cubit/notification_cubit.dart'
    as _i90;
import 'package:graduation_project/features/profile/data/data_source/remote/profile_api_remote_data_source.dart'
    as _i6;
import 'package:graduation_project/features/profile/data/data_source/remote/profile_remote_data_source.dart'
    as _i5;
import 'package:graduation_project/features/profile/data/repository/profile_repository_impl.dart'
    as _i37;
import 'package:graduation_project/features/profile/domain/repository/profile_repository.dart'
    as _i36;
import 'package:graduation_project/features/profile/domain/use_cases/get_doctor_profile.dart'
    as _i51;
import 'package:graduation_project/features/profile/domain/use_cases/get_profile_patient_by_id.dart'
    as _i72;
import 'package:graduation_project/features/profile/domain/use_cases/profile_use_case.dart'
    as _i73;
import 'package:graduation_project/features/profile/domain/use_cases/update_Doctor_profile.dart'
    as _i48;
import 'package:graduation_project/features/profile/domain/use_cases/update_profile_user_case.dart'
    as _i52;
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart'
    as _i58;
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_api_remote_data_source.dart'
    as _i26;
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_remote_data_source.dart'
    as _i25;
import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_api_remote_data_source.dart'
    as _i12;
import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_remote_data_source.dart'
    as _i11;
import 'package:graduation_project/features/user/booking/data/repository/appointment_doctorById_repository_imp.dart'
    as _i65;
import 'package:graduation_project/features/user/booking/data/repository/booking_doctor.dart'
    as _i18;
import 'package:graduation_project/features/user/booking/data/repository/booking_patient_repository_impl.dart'
    as _i50;
import 'package:graduation_project/features/user/booking/data/repository/booking_repository_impl.dart'
    as _i43;
import 'package:graduation_project/features/user/booking/data/repository/doctor_appointment_repository_impl.dart'
    as _i63;
import 'package:graduation_project/features/user/booking/domain/repository/appointment_doctorById_repository.dart'
    as _i64;
import 'package:graduation_project/features/user/booking/domain/repository/booking_doctor.dart'
    as _i17;
import 'package:graduation_project/features/user/booking/domain/repository/booking_patient_repository.dart'
    as _i49;
import 'package:graduation_project/features/user/booking/domain/repository/booking_repository.dart'
    as _i42;
import 'package:graduation_project/features/user/booking/domain/repository/doctor_appointments_repository.dart'
    as _i62;
import 'package:graduation_project/features/user/booking/domain/use_cases/create_appointment_use_case.dart'
    as _i75;
import 'package:graduation_project/features/user/booking/domain/use_cases/delete_appointment.dart'
    as _i66;
import 'package:graduation_project/features/user/booking/domain/use_cases/delete_booking.dart'
    as _i81;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_appointment_doctor_by%20_id.dart'
    as _i85;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_booking_doctor.dart'
    as _i46;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_doctor_appointments.dart'
    as _i96;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_patient_booking.dart'
    as _i56;
import 'package:graduation_project/features/user/booking/domain/use_cases/post_booking_appointment.dart'
    as _i82;
import 'package:graduation_project/features/user/booking/domain/use_cases/update_appointment.dart'
    as _i67;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart'
    as _i88;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/create_appointment_cubit.dart'
    as _i95;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/delete_appointment_cubit.dart'
    as _i79;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/doctor_appointments_cubit.dart'
    as _i97;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/update_appointment_cubit.dart'
    as _i84;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart'
    as _i93;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_doctor_cubit.dart'
    as _i74;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart'
    as _i91;
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_api_remote_data_source.dart'
    as _i22;
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_remote_data_source.dart'
    as _i21;
import 'package:graduation_project/features/user/clinic/data/repository/clinic_repository_impl.dart'
    as _i41;
import 'package:graduation_project/features/user/clinic/domain/repository/clinic_repository.dart'
    as _i40;
import 'package:graduation_project/features/user/clinic/domain/use_case/get_clinics.dart'
    as _i78;
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart'
    as _i89;
import 'package:graduation_project/features/user/clinic/presentation/cubit/search_cubit.dart'
    as _i80;
import 'package:graduation_project/features/user/news/data/remote/news_api_remote_data_source.dart'
    as _i16;
import 'package:graduation_project/features/user/news/data/remote/news_remote_data_source.dart'
    as _i15;
import 'package:graduation_project/features/user/news/data/repository/news_repository_impl.dart'
    as _i28;
import 'package:graduation_project/features/user/news/domain/repository/reposirory.dart'
    as _i27;
import 'package:graduation_project/features/user/news/presentation/cubit/news_cubit.dart'
    as _i57;
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
    gh.singleton<_i15.NewsRemoteDataSource>(
        () => _i16.NewsApiRemoteDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i17.BookingDoctorRepository>(() =>
        _i18.BookingDoctorRepositoryImpl(gh<_i11.BookingRemoteDataSource>()));
    gh.singleton<_i19.MedicalRecordRemoteDataSource>(
        () => _i20.MedicalRecordApiRemoteDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i21.ClinicRemoteDataSource>(
        () => _i22.ClinicApiRemoteDataSource(gh<_i3.Dio>()));
    gh.singletonAsync<_i23.AuthLocalDataSource>(() async =>
        _i24.AuthSharedPrefLocalDataSource(
            await getAsync<_i4.SharedPreferences>()));
    gh.singleton<_i25.AppointmentRemoteDataSource>(
        () => _i26.AppointmentApiRemoteDataSource(gh<_i3.Dio>()));
    gh.singleton<_i27.NewsRepository>(
        () => _i28.NewsRepositoryImpl(gh<_i15.NewsRemoteDataSource>()));
    gh.singleton<_i29.MedicalRecordRepository>(() =>
        _i30.MedicalRecordRepositoryImpl(
            gh<_i19.MedicalRecordRemoteDataSource>()));
    gh.singleton<_i31.LocalDataSource>(() => _i32.LocalDataSourceSharedPref());
    gh.singletonAsync<_i33.MedicalRecordCubit>(
        () async => _i33.MedicalRecordCubit(
              gh<_i29.MedicalRecordRepository>(),
              await getAsync<_i23.AuthLocalDataSource>(),
            ));
    gh.singletonAsync<_i34.AuthRepository>(() async => _i35.AuthRepositoryImpl(
          gh<_i9.AuthRemoteDataSource>(),
          await getAsync<_i23.AuthLocalDataSource>(),
        ));
    gh.singletonAsync<_i36.ProfileRepository>(
        () async => _i37.ProfileRepositoryImpl(
              await getAsync<_i23.AuthLocalDataSource>(),
              gh<_i5.ProfileRemoteDataSource>(),
            ));
    gh.lazySingleton<_i38.DoctorRepository>(
        () => _i39.DoctorRepositoryImpl(gh<_i7.DoctorRemoteDataSource>()));
    gh.lazySingleton<_i40.ClinicRepository>(
        () => _i41.ClinicRepositoryImpl(gh<_i21.ClinicRemoteDataSource>()));
    gh.lazySingletonAsync<_i42.BookingRepository>(
        () async => _i43.BookingRepositoryImpl(
              gh<_i11.BookingRemoteDataSource>(),
              await getAsync<_i23.AuthLocalDataSource>(),
            ));
    gh.singleton<_i44.NotificationRepository>(() =>
        _i45.NotificationRepositoryImpl(
            gh<_i13.NotificationRemoteDataSource>()));
    gh.lazySingleton<_i46.GetBookingDoctor>(
        () => _i46.GetBookingDoctor(gh<_i17.BookingDoctorRepository>()));
    gh.lazySingleton<_i47.GetDoctors>(
        () => _i47.GetDoctors(gh<_i38.DoctorRepository>()));
    gh.lazySingleton<_i47.GetDoctorsByClinicId>(
        () => _i47.GetDoctorsByClinicId(gh<_i38.DoctorRepository>()));
    gh.singletonAsync<_i48.UpdateDoctorProfileUseCase>(() async =>
        _i48.UpdateDoctorProfileUseCase(
            await getAsync<_i36.ProfileRepository>()));
    gh.lazySingleton<_i49.BookingPatientRepository>(() =>
        _i50.BookingPatientRepositoryImpl(gh<_i11.BookingRemoteDataSource>()));
    gh.singletonAsync<_i51.GetDoctorProfileUseCase>(() async =>
        _i51.GetDoctorProfileUseCase(await getAsync<_i36.ProfileRepository>()));
    gh.singletonAsync<_i52.UpdatePatientUseCase>(() async =>
        _i52.UpdatePatientUseCase(await getAsync<_i36.ProfileRepository>()));
    gh.singletonAsync<_i53.LoginUseCase>(
        () async => _i53.LoginUseCase(await getAsync<_i34.AuthRepository>()));
    gh.singletonAsync<_i54.RegisterUseCase>(() async =>
        _i54.RegisterUseCase(await getAsync<_i34.AuthRepository>()));
    gh.singletonAsync<_i55.VerifyCodeUseCase>(() async =>
        _i55.VerifyCodeUseCase(await getAsync<_i34.AuthRepository>()));
    gh.lazySingleton<_i56.GetBookingPatient>(
        () => _i56.GetBookingPatient(gh<_i49.BookingPatientRepository>()));
    gh.singleton<_i57.NewsCubit>(
        () => _i57.NewsCubit(gh<_i27.NewsRepository>()));
    gh.lazySingletonAsync<_i58.ProfileCubit>(() async => _i58.ProfileCubit(
          await getAsync<_i36.ProfileRepository>(),
          await getAsync<_i23.AuthLocalDataSource>(),
        ));
    gh.singletonAsync<_i59.ChangePasswordUseCase>(() async =>
        _i59.ChangePasswordUseCase(await getAsync<_i34.AuthRepository>()));
    gh.singletonAsync<_i60.ResetPasswordUseCae>(() async =>
        _i60.ResetPasswordUseCae(await getAsync<_i34.AuthRepository>()));
    gh.singletonAsync<_i61.ForgetPasswordUseCase>(() async =>
        _i61.ForgetPasswordUseCase(await getAsync<_i34.AuthRepository>()));
    gh.lazySingletonAsync<_i62.DoctorAppointmentRepository>(
        () async => _i63.DoctorAppointmentsRepositoryImpl(
              await getAsync<_i23.AuthLocalDataSource>(),
              gh<_i25.AppointmentRemoteDataSource>(),
            ));
    gh.lazySingleton<_i64.AppointmentDoctorByIdRepository>(() =>
        _i65.AppointmentDoctorByIdRepositoryImpl(
            gh<_i25.AppointmentRemoteDataSource>()));
    gh.lazySingletonAsync<_i66.DeleteAppointmentUseCase>(() async =>
        _i66.DeleteAppointmentUseCase(
            await getAsync<_i62.DoctorAppointmentRepository>()));
    gh.lazySingletonAsync<_i67.UpdateAppointmentUseCase>(() async =>
        _i67.UpdateAppointmentUseCase(
            await getAsync<_i62.DoctorAppointmentRepository>()));
    gh.singletonAsync<_i68.AuthCubit>(() async => _i68.AuthCubit(
          await getAsync<_i54.RegisterUseCase>(),
          await getAsync<_i53.LoginUseCase>(),
          await getAsync<_i23.AuthLocalDataSource>(),
        ));
    gh.singleton<_i69.MedicalRecordUseCase>(
        () => _i69.MedicalRecordUseCase(gh<_i29.MedicalRecordRepository>()));
    gh.singleton<_i70.MedicalRecordDoctorUseCase>(() =>
        _i70.MedicalRecordDoctorUseCase(gh<_i29.MedicalRecordRepository>()));
    gh.singleton<_i71.MedicalRecordPatientUseCase>(() =>
        _i71.MedicalRecordPatientUseCase(gh<_i29.MedicalRecordRepository>()));
    gh.singletonAsync<_i72.GetPatientProfileByIdUseCase>(() async =>
        _i72.GetPatientProfileByIdUseCase(
            await getAsync<_i36.ProfileRepository>()));
    gh.singletonAsync<_i73.ProfileUseCase>(() async =>
        _i73.ProfileUseCase(await getAsync<_i36.ProfileRepository>()));
    gh.singleton<_i74.BookingDoctorCubit>(
        () => _i74.BookingDoctorCubit(gh<_i46.GetBookingDoctor>()));
    gh.lazySingletonAsync<_i75.CreateAppointmentUseCase>(() async =>
        _i75.CreateAppointmentUseCase(
            await getAsync<_i62.DoctorAppointmentRepository>()));
    gh.factory<_i76.DoctorsCubit>(() => _i76.DoctorsCubit(
          gh<_i47.GetDoctors>(),
          gh<_i47.GetDoctorsByClinicId>(),
        ));
    gh.singletonAsync<_i77.VerifyCodeCubit>(() async =>
        _i77.VerifyCodeCubit(await getAsync<_i55.VerifyCodeUseCase>()));
    gh.lazySingleton<_i78.GetClinics>(
        () => _i78.GetClinics(gh<_i40.ClinicRepository>()));
    gh.lazySingleton<_i78.GetClinicsById>(
        () => _i78.GetClinicsById(gh<_i40.ClinicRepository>()));
    gh.lazySingleton<_i78.Search>(
        () => _i78.Search(gh<_i40.ClinicRepository>()));
    gh.singletonAsync<_i79.DeleteAppointmentCubit>(() async =>
        _i79.DeleteAppointmentCubit(
            await getAsync<_i66.DeleteAppointmentUseCase>()));
    gh.lazySingleton<_i80.SearchCubit>(
        () => _i80.SearchCubit(gh<_i78.Search>()));
    gh.lazySingletonAsync<_i81.DeleteBookingUseCase>(() async =>
        _i81.DeleteBookingUseCase(await getAsync<_i42.BookingRepository>()));
    gh.lazySingletonAsync<_i82.PostBookAppointment>(() async =>
        _i82.PostBookAppointment(await getAsync<_i42.BookingRepository>()));
    gh.singletonAsync<_i83.ChangePasswordCubit>(() async =>
        _i83.ChangePasswordCubit(await getAsync<_i59.ChangePasswordUseCase>()));
    gh.singletonAsync<_i84.UpdateAppointmentCubit>(() async =>
        _i84.UpdateAppointmentCubit(
            await getAsync<_i67.UpdateAppointmentUseCase>()));
    gh.lazySingleton<_i85.GetAppointmentDoctorById>(() =>
        _i85.GetAppointmentDoctorById(
            gh<_i64.AppointmentDoctorByIdRepository>()));
    gh.singleton<_i86.GetNotificationsUseCase>(
        () => _i86.GetNotificationsUseCase(gh<_i44.NotificationRepository>()));
    gh.singleton<_i87.MarkNotificationAsReadUseCase>(() =>
        _i87.MarkNotificationAsReadUseCase(gh<_i44.NotificationRepository>()));
    gh.lazySingleton<_i88.AppointmentCubit>(
        () => _i88.AppointmentCubit(gh<_i85.GetAppointmentDoctorById>()));
    gh.lazySingleton<_i89.ClinicCubit>(() => _i89.ClinicCubit(
          gh<_i78.GetClinics>(),
          gh<_i78.GetClinicsById>(),
        ));
    gh.singleton<_i90.NotificationCubit>(() => _i90.NotificationCubit(
          gh<_i86.GetNotificationsUseCase>(),
          gh<_i87.MarkNotificationAsReadUseCase>(),
        ));
    gh.factory<_i91.BookingPatientCubit>(
        () => _i91.BookingPatientCubit(gh<_i56.GetBookingPatient>()));
    gh.singletonAsync<_i92.ForgetPasswordCubit>(() async =>
        _i92.ForgetPasswordCubit(await getAsync<_i61.ForgetPasswordUseCase>()));
    gh.factoryAsync<_i93.BookingCubit>(() async => _i93.BookingCubit(
        bookAppointmentUseCase: await getAsync<_i82.PostBookAppointment>()));
    gh.singletonAsync<_i94.ResetPasswordCubit>(() async =>
        _i94.ResetPasswordCubit(await getAsync<_i60.ResetPasswordUseCae>()));
    gh.lazySingletonAsync<_i95.CreateAppointmentCubit>(() async =>
        _i95.CreateAppointmentCubit(
            await getAsync<_i75.CreateAppointmentUseCase>()));
    gh.lazySingletonAsync<_i93.DeleteBookingCubit>(() async =>
        _i93.DeleteBookingCubit(
            deleteBookingUseCase: await getAsync<_i81.DeleteBookingUseCase>()));
    gh.lazySingletonAsync<_i96.GetDoctorsAppointments>(() async =>
        _i96.GetDoctorsAppointments(
            await getAsync<_i62.DoctorAppointmentRepository>()));
    gh.lazySingletonAsync<_i97.DoctorAppointmentsCubit>(() async =>
        _i97.DoctorAppointmentsCubit(
            await getAsync<_i96.GetDoctorsAppointments>()));
    return this;
  }
}

class _$RegisterModule extends _i98.RegisterModule {}
