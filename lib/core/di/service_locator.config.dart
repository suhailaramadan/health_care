// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graduation_project/core/di/register_modul.dart' as _i125;
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i29;
import 'package:graduation_project/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart'
    as _i30;
import 'package:graduation_project/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i14;
import 'package:graduation_project/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i13;
import 'package:graduation_project/features/auth/data/repository/auth_repository_impl.dart'
    as _i45;
import 'package:graduation_project/features/auth/domain/repository/auth_repository.dart'
    as _i44;
import 'package:graduation_project/features/auth/domain/use_cases/change_password_use_case.dart'
    as _i78;
import 'package:graduation_project/features/auth/domain/use_cases/forget_password_use_case.dart'
    as _i82;
import 'package:graduation_project/features/auth/domain/use_cases/login_use_case.dart'
    as _i72;
import 'package:graduation_project/features/auth/domain/use_cases/register_use_case.dart'
    as _i73;
import 'package:graduation_project/features/auth/domain/use_cases/reset_password.dart'
    as _i79;
import 'package:graduation_project/features/auth/domain/use_cases/verify_code_use_case.dart'
    as _i74;
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart'
    as _i90;
import 'package:graduation_project/features/auth/presentation/cubit/change_password_cubit.dart'
    as _i106;
import 'package:graduation_project/features/auth/presentation/cubit/forget_password_cubit.dart'
    as _i118;
import 'package:graduation_project/features/auth/presentation/cubit/reset_password_cubit.dart'
    as _i121;
import 'package:graduation_project/features/auth/presentation/cubit/verify_code_cubit.dart'
    as _i101;
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_api_remote_data_source.dart'
    as _i8;
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_remote_data_source.dart'
    as _i7;
import 'package:graduation_project/features/doctor/data/repository/doctor_repository_impl.dart'
    as _i51;
import 'package:graduation_project/features/doctor/domain/repository/doctor_repository.dart'
    as _i50;
import 'package:graduation_project/features/doctor/domain/use_case.dart/get_doctors.dart'
    as _i61;
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart'
    as _i100;
import 'package:graduation_project/features/doctors/data/remote/doctor_dashboard_api_remote_data_source.dart'
    as _i12;
import 'package:graduation_project/features/doctors/data/remote/doctor_dashboard_remote_data_source.dart'
    as _i11;
import 'package:graduation_project/features/doctors/data/repository/doctor_dashboard_repository_impl.dart'
    as _i43;
import 'package:graduation_project/features/doctors/domain/repository/doctor_dashboard_repository.dart'
    as _i42;
import 'package:graduation_project/features/doctors/domain/use_case/doctor_dashboard_useCase.dart'
    as _i46;
import 'package:graduation_project/features/doctors/presentation/cubit/doctor_dashboard_cubit.dart'
    as _i47;
import 'package:graduation_project/features/feedback/data/data_source/remote/feedback_remote_api_data_source.dart'
    as _i28;
import 'package:graduation_project/features/feedback/data/data_source/remote/feedback_remote_data_source.dart'
    as _i27;
import 'package:graduation_project/features/feedback/data/repository/feedback_repository_impl.dart'
    as _i64;
import 'package:graduation_project/features/feedback/domain/repository/feedback_repository.dart'
    as _i63;
import 'package:graduation_project/features/feedback/domain/use_case/feedback_use_case.dart'
    as _i65;
import 'package:graduation_project/features/feedback/presentation/cubit/feedback_cubit.dart'
    as _i114;
import 'package:graduation_project/features/medical_record/data/remote/medical_record_api_remote_data_source.dart'
    as _i24;
import 'package:graduation_project/features/medical_record/data/remote/medical_record_remote_data_source.dart'
    as _i23;
import 'package:graduation_project/features/medical_record/data/repository/medical_record_repository_impl.dart'
    as _i36;
import 'package:graduation_project/features/medical_record/domain/repository/medical_record_repository.dart'
    as _i35;
import 'package:graduation_project/features/medical_record/domain/use_cases/add_medical_record.dart'
    as _i91;
import 'package:graduation_project/features/medical_record/domain/use_cases/medical_record_by_id.dart'
    as _i92;
import 'package:graduation_project/features/medical_record/domain/use_cases/medical_record_doctor_use_doctor.dart'
    as _i93;
import 'package:graduation_project/features/medical_record/domain/use_cases/medical_record_patient_use_case.dart'
    as _i94;
import 'package:graduation_project/features/medical_record/presentation/cubit/medical_record_cubit.dart'
    as _i39;
import 'package:graduation_project/features/notification/data/data_source/remote/local/local_data_source.dart'
    as _i37;
import 'package:graduation_project/features/notification/data/data_source/remote/local/local_data_source_shared_pref.dart'
    as _i38;
import 'package:graduation_project/features/notification/data/data_source/remote/notification_api_remote_data_source.dart'
    as _i18;
import 'package:graduation_project/features/notification/data/data_source/remote/notification_remote_data_source.dart'
    as _i17;
import 'package:graduation_project/features/notification/data/repository/notification_repository_impl.dart'
    as _i59;
import 'package:graduation_project/features/notification/domain/repository/notification_repository.dart'
    as _i58;
import 'package:graduation_project/features/notification/domain/use_cases/get_notifications_use_case.dart'
    as _i109;
import 'package:graduation_project/features/notification/domain/use_cases/mark_notification_as_read_use_case.dart'
    as _i110;
import 'package:graduation_project/features/notification/presentiation/cubit/notification_cubit.dart'
    as _i116;
import 'package:graduation_project/features/profile/data/data_source/remote/profile_api_remote_data_source.dart'
    as _i6;
import 'package:graduation_project/features/profile/data/data_source/remote/profile_remote_data_source.dart'
    as _i5;
import 'package:graduation_project/features/profile/data/repository/profile_repository_impl.dart'
    as _i49;
import 'package:graduation_project/features/profile/domain/repository/profile_repository.dart'
    as _i48;
import 'package:graduation_project/features/profile/domain/use_cases/get_doctor_profile.dart'
    as _i68;
import 'package:graduation_project/features/profile/domain/use_cases/get_profile_patient_by_id.dart'
    as _i96;
import 'package:graduation_project/features/profile/domain/use_cases/profile_use_case.dart'
    as _i97;
import 'package:graduation_project/features/profile/domain/use_cases/update_Doctor_profile.dart'
    as _i62;
import 'package:graduation_project/features/profile/domain/use_cases/update_profile_user_case.dart'
    as _i69;
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart'
    as _i77;
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_api_remote_data_source.dart'
    as _i32;
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_remote_data_source.dart'
    as _i31;
import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_api_remote_data_source.dart'
    as _i16;
import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_remote_data_source.dart'
    as _i15;
import 'package:graduation_project/features/user/booking/data/repository/appointment_doctorById_repository_imp.dart'
    as _i86;
import 'package:graduation_project/features/user/booking/data/repository/booking_doctor.dart'
    as _i22;
import 'package:graduation_project/features/user/booking/data/repository/booking_patient_repository_impl.dart'
    as _i67;
import 'package:graduation_project/features/user/booking/data/repository/booking_repository_impl.dart'
    as _i55;
import 'package:graduation_project/features/user/booking/data/repository/doctor_appointment_repository_impl.dart'
    as _i84;
import 'package:graduation_project/features/user/booking/domain/repository/appointment_doctorById_repository.dart'
    as _i85;
import 'package:graduation_project/features/user/booking/domain/repository/booking_doctor.dart'
    as _i21;
import 'package:graduation_project/features/user/booking/domain/repository/booking_patient_repository.dart'
    as _i66;
import 'package:graduation_project/features/user/booking/domain/repository/booking_repository.dart'
    as _i54;
import 'package:graduation_project/features/user/booking/domain/repository/doctor_appointments_repository.dart'
    as _i83;
import 'package:graduation_project/features/user/booking/domain/use_cases/create_appointment_use_case.dart'
    as _i99;
import 'package:graduation_project/features/user/booking/domain/use_cases/delete_appointment.dart'
    as _i88;
import 'package:graduation_project/features/user/booking/domain/use_cases/delete_booking.dart'
    as _i104;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_all_bookings.dart'
    as _i81;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_appointment_doctor_by%20_id.dart'
    as _i108;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_booking_by_id.dart'
    as _i80;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_booking_doctor.dart'
    as _i60;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_doctor_appointments.dart'
    as _i123;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_patient_booking.dart'
    as _i75;
import 'package:graduation_project/features/user/booking/domain/use_cases/post_booking_appointment.dart'
    as _i105;
import 'package:graduation_project/features/user/booking/domain/use_cases/update_appointment.dart'
    as _i89;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart'
    as _i111;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/create_appointment_cubit.dart'
    as _i122;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/delete_appointment_cubit.dart'
    as _i112;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/doctor_appointments_cubit.dart'
    as _i124;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/update_appointment_cubit.dart'
    as _i107;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/all_bookings_cubit.dart'
    as _i87;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_by_id_cubit.dart'
    as _i119;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart'
    as _i120;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_doctor_cubit.dart'
    as _i98;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart'
    as _i117;
import 'package:graduation_project/features/user/chatBot/data/data_source/remote/chat_api_remote_data_source.dart'
    as _i10;
import 'package:graduation_project/features/user/chatBot/data/data_source/remote/chate_remote_data_source.dart'
    as _i9;
import 'package:graduation_project/features/user/chatBot/data/repository/analysis_repository_impl.dart'
    as _i57;
import 'package:graduation_project/features/user/chatBot/data/repository/chat_repository_impl.dart'
    as _i41;
import 'package:graduation_project/features/user/chatBot/domain/repository/analysis_repository.dart'
    as _i56;
import 'package:graduation_project/features/user/chatBot/domain/repository/chat_repository.dart'
    as _i40;
import 'package:graduation_project/features/user/chatBot/domain/use_case/analysis_use_case.dart'
    as _i95;
import 'package:graduation_project/features/user/chatBot/domain/use_case/chat_use_case.dart'
    as _i70;
import 'package:graduation_project/features/user/chatBot/presentation/cubit/analysis_cubit.dart'
    as _i115;
import 'package:graduation_project/features/user/chatBot/presentation/cubit/chat_cubit.dart'
    as _i71;
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_api_remote_data_source.dart'
    as _i26;
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_remote_data_source.dart'
    as _i25;
import 'package:graduation_project/features/user/clinic/data/repository/clinic_repository_impl.dart'
    as _i53;
import 'package:graduation_project/features/user/clinic/domain/repository/clinic_repository.dart'
    as _i52;
import 'package:graduation_project/features/user/clinic/domain/use_case/get_clinics.dart'
    as _i102;
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart'
    as _i113;
import 'package:graduation_project/features/user/clinic/presentation/cubit/search_cubit.dart'
    as _i103;
import 'package:graduation_project/features/user/news/data/remote/news_api_remote_data_source.dart'
    as _i20;
import 'package:graduation_project/features/user/news/data/remote/news_remote_data_source.dart'
    as _i19;
import 'package:graduation_project/features/user/news/data/repository/news_repository_impl.dart'
    as _i34;
import 'package:graduation_project/features/user/news/domain/repository/reposirory.dart'
    as _i33;
import 'package:graduation_project/features/user/news/presentation/cubit/news_cubit.dart'
    as _i76;
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
    gh.singleton<_i9.ChatRemoteDataSource>(
        () => _i10.ChatApiRemoteDataSource(gh<_i3.Dio>()));
    gh.singleton<_i11.DoctorDashboardRemoteDataSource>(
        () => _i12.DoctorDashboardApiRemoteDataSource(gh<_i3.Dio>()));
    gh.singleton<_i13.AuthRemoteDataSource>(
        () => _i14.AuthAPIRemoteDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i15.BookingRemoteDataSource>(
        () => _i16.BookingApiRemoteDataSource(gh<_i3.Dio>()));
    gh.singleton<_i17.NotificationRemoteDataSource>(
        () => _i18.NotificationApiRemoteDataSource(gh<_i3.Dio>()));
    gh.singleton<_i19.NewsRemoteDataSource>(
        () => _i20.NewsApiRemoteDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i21.BookingDoctorRepository>(() =>
        _i22.BookingDoctorRepositoryImpl(gh<_i15.BookingRemoteDataSource>()));
    gh.singleton<_i23.MedicalRecordRemoteDataSource>(
        () => _i24.MedicalRecordApiRemoteDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i25.ClinicRemoteDataSource>(
        () => _i26.ClinicApiRemoteDataSource(gh<_i3.Dio>()));
    gh.singleton<_i27.FeedbackRemoteDataSource>(
        () => _i28.FeedbackApiRemoteDataSource(gh<_i3.Dio>()));
    gh.singletonAsync<_i29.AuthLocalDataSource>(() async =>
        _i30.AuthSharedPrefLocalDataSource(
            await getAsync<_i4.SharedPreferences>()));
    gh.singleton<_i31.AppointmentRemoteDataSource>(
        () => _i32.AppointmentApiRemoteDataSource(gh<_i3.Dio>()));
    gh.singleton<_i33.NewsRepository>(
        () => _i34.NewsRepositoryImpl(gh<_i19.NewsRemoteDataSource>()));
    gh.singleton<_i35.MedicalRecordRepository>(() =>
        _i36.MedicalRecordRepositoryImpl(
            gh<_i23.MedicalRecordRemoteDataSource>()));
    gh.singleton<_i37.LocalDataSource>(() => _i38.LocalDataSourceSharedPref());
    gh.singletonAsync<_i39.MedicalRecordCubit>(
        () async => _i39.MedicalRecordCubit(
              gh<_i35.MedicalRecordRepository>(),
              await getAsync<_i29.AuthLocalDataSource>(),
            ));
    gh.singleton<_i40.ChatRepository>(
        () => _i41.ChatRepositoryImpl(gh<_i9.ChatRemoteDataSource>()));
    gh.singleton<_i42.DoctorDashboardRepository>(() =>
        _i43.DoctorDashBoardRepositoryImpl(
            gh<_i11.DoctorDashboardRemoteDataSource>()));
    gh.singletonAsync<_i44.AuthRepository>(() async => _i45.AuthRepositoryImpl(
          gh<_i13.AuthRemoteDataSource>(),
          await getAsync<_i29.AuthLocalDataSource>(),
        ));
    gh.singleton<_i46.DoctorDashboardUseCase>(() =>
        _i46.DoctorDashboardUseCase(gh<_i42.DoctorDashboardRepository>()));
    gh.singleton<_i47.DoctorDashboardCubit>(
        () => _i47.DoctorDashboardCubit(gh<_i46.DoctorDashboardUseCase>()));
    gh.singletonAsync<_i48.ProfileRepository>(
        () async => _i49.ProfileRepositoryImpl(
              await getAsync<_i29.AuthLocalDataSource>(),
              gh<_i5.ProfileRemoteDataSource>(),
            ));
    gh.lazySingleton<_i50.DoctorRepository>(
        () => _i51.DoctorRepositoryImpl(gh<_i7.DoctorRemoteDataSource>()));
    gh.lazySingleton<_i52.ClinicRepository>(
        () => _i53.ClinicRepositoryImpl(gh<_i25.ClinicRemoteDataSource>()));
    gh.lazySingletonAsync<_i54.BookingRepository>(
        () async => _i55.BookingRepositoryImpl(
              gh<_i15.BookingRemoteDataSource>(),
              await getAsync<_i29.AuthLocalDataSource>(),
            ));
    gh.singleton<_i56.AnalysisRepository>(
        () => _i57.AnalysisRepositoryImpl(gh<_i9.ChatRemoteDataSource>()));
    gh.singleton<_i58.NotificationRepository>(() =>
        _i59.NotificationRepositoryImpl(
            gh<_i17.NotificationRemoteDataSource>()));
    gh.lazySingleton<_i60.GetBookingDoctor>(
        () => _i60.GetBookingDoctor(gh<_i21.BookingDoctorRepository>()));
    gh.lazySingleton<_i61.GetDoctors>(
        () => _i61.GetDoctors(gh<_i50.DoctorRepository>()));
    gh.lazySingleton<_i61.GetDoctorsByClinicId>(
        () => _i61.GetDoctorsByClinicId(gh<_i50.DoctorRepository>()));
    gh.singletonAsync<_i62.UpdateDoctorProfileUseCase>(() async =>
        _i62.UpdateDoctorProfileUseCase(
            await getAsync<_i48.ProfileRepository>()));
    gh.singleton<_i63.FeedbackRepository>(
        () => _i64.FeedbackRepositoryImpl(gh<_i27.FeedbackRemoteDataSource>()));
    gh.singleton<_i65.SendFeedbackUseCase>(
        () => _i65.SendFeedbackUseCase(gh<_i63.FeedbackRepository>()));
    gh.lazySingleton<_i66.BookingPatientRepository>(() =>
        _i67.BookingPatientRepositoryImpl(gh<_i15.BookingRemoteDataSource>()));
    gh.singletonAsync<_i68.GetDoctorProfileUseCase>(() async =>
        _i68.GetDoctorProfileUseCase(await getAsync<_i48.ProfileRepository>()));
    gh.singletonAsync<_i69.UpdatePatientUseCase>(() async =>
        _i69.UpdatePatientUseCase(await getAsync<_i48.ProfileRepository>()));
    gh.singleton<_i70.ChatUseCase>(
        () => _i70.ChatUseCase(gh<_i40.ChatRepository>()));
    gh.singleton<_i71.ChatCubit>(() => _i71.ChatCubit(gh<_i70.ChatUseCase>()));
    gh.singletonAsync<_i72.LoginUseCase>(
        () async => _i72.LoginUseCase(await getAsync<_i44.AuthRepository>()));
    gh.singletonAsync<_i73.RegisterUseCase>(() async =>
        _i73.RegisterUseCase(await getAsync<_i44.AuthRepository>()));
    gh.singletonAsync<_i74.VerifyCodeUseCase>(() async =>
        _i74.VerifyCodeUseCase(await getAsync<_i44.AuthRepository>()));
    gh.lazySingleton<_i75.GetBookingPatient>(
        () => _i75.GetBookingPatient(gh<_i66.BookingPatientRepository>()));
    gh.singleton<_i76.NewsCubit>(
        () => _i76.NewsCubit(gh<_i33.NewsRepository>()));
    gh.lazySingletonAsync<_i77.ProfileCubit>(() async => _i77.ProfileCubit(
          await getAsync<_i48.ProfileRepository>(),
          await getAsync<_i29.AuthLocalDataSource>(),
        ));
    gh.singletonAsync<_i78.ChangePasswordUseCase>(() async =>
        _i78.ChangePasswordUseCase(await getAsync<_i44.AuthRepository>()));
    gh.singletonAsync<_i79.ResetPasswordUseCae>(() async =>
        _i79.ResetPasswordUseCae(await getAsync<_i44.AuthRepository>()));
    gh.singleton<_i80.GetBookingByIdUseCase>(
        () => _i80.GetBookingByIdUseCase(gh<_i66.BookingPatientRepository>()));
    gh.singleton<_i81.GetAllBookingsUseCase>(
        () => _i81.GetAllBookingsUseCase(gh<_i66.BookingPatientRepository>()));
    gh.singletonAsync<_i82.ForgetPasswordUseCase>(() async =>
        _i82.ForgetPasswordUseCase(await getAsync<_i44.AuthRepository>()));
    gh.lazySingletonAsync<_i83.DoctorAppointmentRepository>(
        () async => _i84.DoctorAppointmentsRepositoryImpl(
              await getAsync<_i29.AuthLocalDataSource>(),
              gh<_i31.AppointmentRemoteDataSource>(),
            ));
    gh.lazySingleton<_i85.AppointmentDoctorByIdRepository>(() =>
        _i86.AppointmentDoctorByIdRepositoryImpl(
            gh<_i31.AppointmentRemoteDataSource>()));
    gh.singleton<_i87.AllBookingsCubit>(
        () => _i87.AllBookingsCubit(gh<_i81.GetAllBookingsUseCase>()));
    gh.lazySingletonAsync<_i88.DeleteAppointmentUseCase>(() async =>
        _i88.DeleteAppointmentUseCase(
            await getAsync<_i83.DoctorAppointmentRepository>()));
    gh.lazySingletonAsync<_i89.UpdateAppointmentUseCase>(() async =>
        _i89.UpdateAppointmentUseCase(
            await getAsync<_i83.DoctorAppointmentRepository>()));
    gh.singletonAsync<_i90.AuthCubit>(() async => _i90.AuthCubit(
          await getAsync<_i73.RegisterUseCase>(),
          await getAsync<_i72.LoginUseCase>(),
          await getAsync<_i29.AuthLocalDataSource>(),
        ));
    gh.singleton<_i91.AddMedicalRecordUseCase>(
        () => _i91.AddMedicalRecordUseCase(gh<_i35.MedicalRecordRepository>()));
    gh.singleton<_i92.MedicalRecordUseCase>(
        () => _i92.MedicalRecordUseCase(gh<_i35.MedicalRecordRepository>()));
    gh.singleton<_i93.MedicalRecordDoctorUseCase>(() =>
        _i93.MedicalRecordDoctorUseCase(gh<_i35.MedicalRecordRepository>()));
    gh.singleton<_i94.MedicalRecordPatientUseCase>(() =>
        _i94.MedicalRecordPatientUseCase(gh<_i35.MedicalRecordRepository>()));
    gh.singleton<_i95.AnalysisUseCase>(
        () => _i95.AnalysisUseCase(gh<_i56.AnalysisRepository>()));
    gh.singletonAsync<_i96.GetPatientProfileByIdUseCase>(() async =>
        _i96.GetPatientProfileByIdUseCase(
            await getAsync<_i48.ProfileRepository>()));
    gh.singletonAsync<_i97.ProfileUseCase>(() async =>
        _i97.ProfileUseCase(await getAsync<_i48.ProfileRepository>()));
    gh.singleton<_i98.BookingDoctorCubit>(
        () => _i98.BookingDoctorCubit(gh<_i60.GetBookingDoctor>()));
    gh.lazySingletonAsync<_i99.CreateAppointmentUseCase>(() async =>
        _i99.CreateAppointmentUseCase(
            await getAsync<_i83.DoctorAppointmentRepository>()));
    gh.factory<_i100.DoctorsCubit>(() => _i100.DoctorsCubit(
          gh<_i61.GetDoctors>(),
          gh<_i61.GetDoctorsByClinicId>(),
        ));
    gh.singletonAsync<_i101.VerifyCodeCubit>(() async =>
        _i101.VerifyCodeCubit(await getAsync<_i74.VerifyCodeUseCase>()));
    gh.lazySingleton<_i102.GetClinics>(
        () => _i102.GetClinics(gh<_i52.ClinicRepository>()));
    gh.lazySingleton<_i102.GetClinicsById>(
        () => _i102.GetClinicsById(gh<_i52.ClinicRepository>()));
    gh.lazySingleton<_i102.Search>(
        () => _i102.Search(gh<_i52.ClinicRepository>()));
    gh.lazySingleton<_i103.SearchCubit>(
        () => _i103.SearchCubit(gh<_i102.Search>()));
    gh.lazySingletonAsync<_i104.DeleteBookingUseCase>(() async =>
        _i104.DeleteBookingUseCase(await getAsync<_i54.BookingRepository>()));
    gh.lazySingletonAsync<_i105.PostBookAppointment>(() async =>
        _i105.PostBookAppointment(await getAsync<_i54.BookingRepository>()));
    gh.singletonAsync<_i106.ChangePasswordCubit>(() async =>
        _i106.ChangePasswordCubit(
            await getAsync<_i78.ChangePasswordUseCase>()));
    gh.singletonAsync<_i107.UpdateAppointmentCubit>(() async =>
        _i107.UpdateAppointmentCubit(
            await getAsync<_i89.UpdateAppointmentUseCase>()));
    gh.lazySingleton<_i108.GetAppointmentDoctorById>(() =>
        _i108.GetAppointmentDoctorById(
            gh<_i85.AppointmentDoctorByIdRepository>()));
    gh.singleton<_i109.GetNotificationsUseCase>(
        () => _i109.GetNotificationsUseCase(gh<_i58.NotificationRepository>()));
    gh.singleton<_i110.MarkNotificationAsReadUseCase>(() =>
        _i110.MarkNotificationAsReadUseCase(gh<_i58.NotificationRepository>()));
    gh.lazySingleton<_i111.AppointmentCubit>(
        () => _i111.AppointmentCubit(gh<_i108.GetAppointmentDoctorById>()));
    gh.singletonAsync<_i112.DeleteAppointmentCubit>(
        () async => _i112.DeleteAppointmentCubit(
              await getAsync<_i88.DeleteAppointmentUseCase>(),
              gh<_i81.GetAllBookingsUseCase>(),
            ));
    gh.lazySingleton<_i113.ClinicCubit>(() => _i113.ClinicCubit(
          gh<_i102.GetClinics>(),
          gh<_i102.GetClinicsById>(),
        ));
    gh.singleton<_i114.FeedbackCubit>(
        () => _i114.FeedbackCubit(gh<_i65.SendFeedbackUseCase>()));
    gh.singleton<_i115.AnalysisCubit>(
        () => _i115.AnalysisCubit(gh<_i95.AnalysisUseCase>()));
    gh.singleton<_i116.NotificationCubit>(() => _i116.NotificationCubit(
          gh<_i109.GetNotificationsUseCase>(),
          gh<_i110.MarkNotificationAsReadUseCase>(),
        ));
    gh.singleton<_i117.BookingPatientCubit>(
        () => _i117.BookingPatientCubit(gh<_i75.GetBookingPatient>()));
    gh.singletonAsync<_i118.ForgetPasswordCubit>(() async =>
        _i118.ForgetPasswordCubit(
            await getAsync<_i82.ForgetPasswordUseCase>()));
    gh.singleton<_i119.BookingByIdCubit>(
        () => _i119.BookingByIdCubit(gh<_i80.GetBookingByIdUseCase>()));
    gh.factoryAsync<_i120.BookingCubit>(() async => _i120.BookingCubit(
        bookAppointmentUseCase: await getAsync<_i105.PostBookAppointment>()));
    gh.singletonAsync<_i121.ResetPasswordCubit>(() async =>
        _i121.ResetPasswordCubit(await getAsync<_i79.ResetPasswordUseCae>()));
    gh.lazySingletonAsync<_i122.CreateAppointmentCubit>(() async =>
        _i122.CreateAppointmentCubit(
            await getAsync<_i99.CreateAppointmentUseCase>()));
    gh.singletonAsync<_i120.DeleteBookingCubit>(() async =>
        _i120.DeleteBookingCubit(
            deleteBookingUseCase:
                await getAsync<_i104.DeleteBookingUseCase>()));
    gh.lazySingletonAsync<_i123.GetDoctorsAppointments>(() async =>
        _i123.GetDoctorsAppointments(
            await getAsync<_i83.DoctorAppointmentRepository>()));
    gh.lazySingletonAsync<_i124.DoctorAppointmentsCubit>(() async =>
        _i124.DoctorAppointmentsCubit(
            await getAsync<_i123.GetDoctorsAppointments>()));
    return this;
  }
}

class _$RegisterModule extends _i125.RegisterModule {}
