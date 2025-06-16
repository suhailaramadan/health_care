// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graduation_project/core/di/register_modul.dart' as _i119;
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i27;
import 'package:graduation_project/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart'
    as _i28;
import 'package:graduation_project/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i12;
import 'package:graduation_project/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i11;
import 'package:graduation_project/features/auth/data/repository/auth_repository_impl.dart'
    as _i41;
import 'package:graduation_project/features/auth/domain/repository/auth_repository.dart'
    as _i40;
import 'package:graduation_project/features/auth/domain/use_cases/change_password_use_case.dart'
    as _i72;
import 'package:graduation_project/features/auth/domain/use_cases/forget_password_use_case.dart'
    as _i76;
import 'package:graduation_project/features/auth/domain/use_cases/login_use_case.dart'
    as _i66;
import 'package:graduation_project/features/auth/domain/use_cases/register_use_case.dart'
    as _i67;
import 'package:graduation_project/features/auth/domain/use_cases/reset_password.dart'
    as _i73;
import 'package:graduation_project/features/auth/domain/use_cases/verify_code_use_case.dart'
    as _i68;
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart'
    as _i84;
import 'package:graduation_project/features/auth/presentation/cubit/change_password_cubit.dart'
    as _i100;
import 'package:graduation_project/features/auth/presentation/cubit/forget_password_cubit.dart'
    as _i112;
import 'package:graduation_project/features/auth/presentation/cubit/reset_password_cubit.dart'
    as _i115;
import 'package:graduation_project/features/auth/presentation/cubit/verify_code_cubit.dart'
    as _i95;
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_api_remote_data_source.dart'
    as _i8;
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_remote_data_source.dart'
    as _i7;
import 'package:graduation_project/features/doctor/data/repository/doctor_repository_impl.dart'
    as _i45;
import 'package:graduation_project/features/doctor/domain/repository/doctor_repository.dart'
    as _i44;
import 'package:graduation_project/features/doctor/domain/use_case.dart/get_doctors.dart'
    as _i55;
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart'
    as _i94;
import 'package:graduation_project/features/feedback/data/data_source/remote/feedback_remote_api_data_source.dart'
    as _i26;
import 'package:graduation_project/features/feedback/data/data_source/remote/feedback_remote_data_source.dart'
    as _i25;
import 'package:graduation_project/features/feedback/data/repository/feedback_repository_impl.dart'
    as _i58;
import 'package:graduation_project/features/feedback/domain/repository/feedback_repository.dart'
    as _i57;
import 'package:graduation_project/features/feedback/domain/use_case/feedback_use_case.dart'
    as _i59;
import 'package:graduation_project/features/feedback/presentation/cubit/feedback_cubit.dart'
    as _i108;
import 'package:graduation_project/features/medical_record/data/remote/medical_record_api_remote_data_source.dart'
    as _i22;
import 'package:graduation_project/features/medical_record/data/remote/medical_record_remote_data_source.dart'
    as _i21;
import 'package:graduation_project/features/medical_record/data/repository/medical_record_repository_impl.dart'
    as _i34;
import 'package:graduation_project/features/medical_record/domain/repository/medical_record_repository.dart'
    as _i33;
import 'package:graduation_project/features/medical_record/domain/use_cases/add_medical_record.dart'
    as _i85;
import 'package:graduation_project/features/medical_record/domain/use_cases/medical_record_by_id.dart'
    as _i86;
import 'package:graduation_project/features/medical_record/domain/use_cases/medical_record_doctor_use_doctor.dart'
    as _i87;
import 'package:graduation_project/features/medical_record/domain/use_cases/medical_record_patient_use_case.dart'
    as _i88;
import 'package:graduation_project/features/medical_record/presentation/cubit/medical_record_cubit.dart'
    as _i37;
import 'package:graduation_project/features/notification/data/data_source/remote/local/local_data_source.dart'
    as _i35;
import 'package:graduation_project/features/notification/data/data_source/remote/local/local_data_source_shared_pref.dart'
    as _i36;
import 'package:graduation_project/features/notification/data/data_source/remote/notification_api_remote_data_source.dart'
    as _i16;
import 'package:graduation_project/features/notification/data/data_source/remote/notification_remote_data_source.dart'
    as _i15;
import 'package:graduation_project/features/notification/data/repository/notification_repository_impl.dart'
    as _i53;
import 'package:graduation_project/features/notification/domain/repository/notification_repository.dart'
    as _i52;
import 'package:graduation_project/features/notification/domain/use_cases/get_notifications_use_case.dart'
    as _i103;
import 'package:graduation_project/features/notification/domain/use_cases/mark_notification_as_read_use_case.dart'
    as _i104;
import 'package:graduation_project/features/notification/presentiation/cubit/notification_cubit.dart'
    as _i110;
import 'package:graduation_project/features/profile/data/data_source/remote/profile_api_remote_data_source.dart'
    as _i6;
import 'package:graduation_project/features/profile/data/data_source/remote/profile_remote_data_source.dart'
    as _i5;
import 'package:graduation_project/features/profile/data/repository/profile_repository_impl.dart'
    as _i43;
import 'package:graduation_project/features/profile/domain/repository/profile_repository.dart'
    as _i42;
import 'package:graduation_project/features/profile/domain/use_cases/get_doctor_profile.dart'
    as _i62;
import 'package:graduation_project/features/profile/domain/use_cases/get_profile_patient_by_id.dart'
    as _i90;
import 'package:graduation_project/features/profile/domain/use_cases/profile_use_case.dart'
    as _i91;
import 'package:graduation_project/features/profile/domain/use_cases/update_Doctor_profile.dart'
    as _i56;
import 'package:graduation_project/features/profile/domain/use_cases/update_profile_user_case.dart'
    as _i63;
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart'
    as _i71;
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_api_remote_data_source.dart'
    as _i30;
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_remote_data_source.dart'
    as _i29;
import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_api_remote_data_source.dart'
    as _i14;
import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_remote_data_source.dart'
    as _i13;
import 'package:graduation_project/features/user/booking/data/repository/appointment_doctorById_repository_imp.dart'
    as _i80;
import 'package:graduation_project/features/user/booking/data/repository/booking_doctor.dart'
    as _i20;
import 'package:graduation_project/features/user/booking/data/repository/booking_patient_repository_impl.dart'
    as _i61;
import 'package:graduation_project/features/user/booking/data/repository/booking_repository_impl.dart'
    as _i49;
import 'package:graduation_project/features/user/booking/data/repository/doctor_appointment_repository_impl.dart'
    as _i78;
import 'package:graduation_project/features/user/booking/domain/repository/appointment_doctorById_repository.dart'
    as _i79;
import 'package:graduation_project/features/user/booking/domain/repository/booking_doctor.dart'
    as _i19;
import 'package:graduation_project/features/user/booking/domain/repository/booking_patient_repository.dart'
    as _i60;
import 'package:graduation_project/features/user/booking/domain/repository/booking_repository.dart'
    as _i48;
import 'package:graduation_project/features/user/booking/domain/repository/doctor_appointments_repository.dart'
    as _i77;
import 'package:graduation_project/features/user/booking/domain/use_cases/create_appointment_use_case.dart'
    as _i93;
import 'package:graduation_project/features/user/booking/domain/use_cases/delete_appointment.dart'
    as _i82;
import 'package:graduation_project/features/user/booking/domain/use_cases/delete_booking.dart'
    as _i98;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_all_bookings.dart'
    as _i75;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_appointment_doctor_by%20_id.dart'
    as _i102;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_booking_by_id.dart'
    as _i74;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_booking_doctor.dart'
    as _i54;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_doctor_appointments.dart'
    as _i117;
import 'package:graduation_project/features/user/booking/domain/use_cases/get_patient_booking.dart'
    as _i69;
import 'package:graduation_project/features/user/booking/domain/use_cases/post_booking_appointment.dart'
    as _i99;
import 'package:graduation_project/features/user/booking/domain/use_cases/update_appointment.dart'
    as _i83;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart'
    as _i105;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/create_appointment_cubit.dart'
    as _i116;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/delete_appointment_cubit.dart'
    as _i106;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/doctor_appointments_cubit.dart'
    as _i118;
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/update_appointment_cubit.dart'
    as _i101;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/all_bookings_cubit.dart'
    as _i81;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_by_id_cubit.dart'
    as _i113;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart'
    as _i114;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_doctor_cubit.dart'
    as _i92;
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart'
    as _i111;
import 'package:graduation_project/features/user/chatBot/data/data_source/remote/chat_api_remote_data_source.dart'
    as _i10;
import 'package:graduation_project/features/user/chatBot/data/data_source/remote/chate_remote_data_source.dart'
    as _i9;
import 'package:graduation_project/features/user/chatBot/data/repository/analysis_repository_impl.dart'
    as _i51;
import 'package:graduation_project/features/user/chatBot/data/repository/chat_repository_impl.dart'
    as _i39;
import 'package:graduation_project/features/user/chatBot/domain/repository/analysis_repository.dart'
    as _i50;
import 'package:graduation_project/features/user/chatBot/domain/repository/chat_repository.dart'
    as _i38;
import 'package:graduation_project/features/user/chatBot/domain/use_case/analysis_use_case.dart'
    as _i89;
import 'package:graduation_project/features/user/chatBot/domain/use_case/chat_use_case.dart'
    as _i64;
import 'package:graduation_project/features/user/chatBot/presentation/cubit/analysis_cubit.dart'
    as _i109;
import 'package:graduation_project/features/user/chatBot/presentation/cubit/chat_cubit.dart'
    as _i65;
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_api_remote_data_source.dart'
    as _i24;
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_remote_data_source.dart'
    as _i23;
import 'package:graduation_project/features/user/clinic/data/repository/clinic_repository_impl.dart'
    as _i47;
import 'package:graduation_project/features/user/clinic/domain/repository/clinic_repository.dart'
    as _i46;
import 'package:graduation_project/features/user/clinic/domain/use_case/get_clinics.dart'
    as _i96;
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart'
    as _i107;
import 'package:graduation_project/features/user/clinic/presentation/cubit/search_cubit.dart'
    as _i97;
import 'package:graduation_project/features/user/news/data/remote/news_api_remote_data_source.dart'
    as _i18;
import 'package:graduation_project/features/user/news/data/remote/news_remote_data_source.dart'
    as _i17;
import 'package:graduation_project/features/user/news/data/repository/news_repository_impl.dart'
    as _i32;
import 'package:graduation_project/features/user/news/domain/repository/reposirory.dart'
    as _i31;
import 'package:graduation_project/features/user/news/presentation/cubit/news_cubit.dart'
    as _i70;
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
    gh.singleton<_i11.AuthRemoteDataSource>(
        () => _i12.AuthAPIRemoteDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i13.BookingRemoteDataSource>(
        () => _i14.BookingApiRemoteDataSource(gh<_i3.Dio>()));
    gh.singleton<_i15.NotificationRemoteDataSource>(
        () => _i16.NotificationApiRemoteDataSource(gh<_i3.Dio>()));
    gh.singleton<_i17.NewsRemoteDataSource>(
        () => _i18.NewsApiRemoteDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i19.BookingDoctorRepository>(() =>
        _i20.BookingDoctorRepositoryImpl(gh<_i13.BookingRemoteDataSource>()));
    gh.singleton<_i21.MedicalRecordRemoteDataSource>(
        () => _i22.MedicalRecordApiRemoteDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i23.ClinicRemoteDataSource>(
        () => _i24.ClinicApiRemoteDataSource(gh<_i3.Dio>()));
    gh.singleton<_i25.FeedbackRemoteDataSource>(
        () => _i26.FeedbackApiRemoteDataSource(gh<_i3.Dio>()));
    gh.singletonAsync<_i27.AuthLocalDataSource>(() async =>
        _i28.AuthSharedPrefLocalDataSource(
            await getAsync<_i4.SharedPreferences>()));
    gh.singleton<_i29.AppointmentRemoteDataSource>(
        () => _i30.AppointmentApiRemoteDataSource(gh<_i3.Dio>()));
    gh.singleton<_i31.NewsRepository>(
        () => _i32.NewsRepositoryImpl(gh<_i17.NewsRemoteDataSource>()));
    gh.singleton<_i33.MedicalRecordRepository>(() =>
        _i34.MedicalRecordRepositoryImpl(
            gh<_i21.MedicalRecordRemoteDataSource>()));
    gh.singleton<_i35.LocalDataSource>(() => _i36.LocalDataSourceSharedPref());
    gh.singletonAsync<_i37.MedicalRecordCubit>(
        () async => _i37.MedicalRecordCubit(
              gh<_i33.MedicalRecordRepository>(),
              await getAsync<_i27.AuthLocalDataSource>(),
            ));
    gh.singleton<_i38.ChatRepository>(
        () => _i39.ChatRepositoryImpl(gh<_i9.ChatRemoteDataSource>()));
    gh.singletonAsync<_i40.AuthRepository>(() async => _i41.AuthRepositoryImpl(
          gh<_i11.AuthRemoteDataSource>(),
          await getAsync<_i27.AuthLocalDataSource>(),
        ));
    gh.singletonAsync<_i42.ProfileRepository>(
        () async => _i43.ProfileRepositoryImpl(
              await getAsync<_i27.AuthLocalDataSource>(),
              gh<_i5.ProfileRemoteDataSource>(),
            ));
    gh.lazySingleton<_i44.DoctorRepository>(
        () => _i45.DoctorRepositoryImpl(gh<_i7.DoctorRemoteDataSource>()));
    gh.lazySingleton<_i46.ClinicRepository>(
        () => _i47.ClinicRepositoryImpl(gh<_i23.ClinicRemoteDataSource>()));
    gh.lazySingletonAsync<_i48.BookingRepository>(
        () async => _i49.BookingRepositoryImpl(
              gh<_i13.BookingRemoteDataSource>(),
              await getAsync<_i27.AuthLocalDataSource>(),
            ));
    gh.singleton<_i50.AnalysisRepository>(
        () => _i51.AnalysisRepositoryImpl(gh<_i9.ChatRemoteDataSource>()));
    gh.singleton<_i52.NotificationRepository>(() =>
        _i53.NotificationRepositoryImpl(
            gh<_i15.NotificationRemoteDataSource>()));
    gh.lazySingleton<_i54.GetBookingDoctor>(
        () => _i54.GetBookingDoctor(gh<_i19.BookingDoctorRepository>()));
    gh.lazySingleton<_i55.GetDoctors>(
        () => _i55.GetDoctors(gh<_i44.DoctorRepository>()));
    gh.lazySingleton<_i55.GetDoctorsByClinicId>(
        () => _i55.GetDoctorsByClinicId(gh<_i44.DoctorRepository>()));
    gh.singletonAsync<_i56.UpdateDoctorProfileUseCase>(() async =>
        _i56.UpdateDoctorProfileUseCase(
            await getAsync<_i42.ProfileRepository>()));
    gh.singleton<_i57.FeedbackRepository>(
        () => _i58.FeedbackRepositoryImpl(gh<_i25.FeedbackRemoteDataSource>()));
    gh.singleton<_i59.SendFeedbackUseCase>(
        () => _i59.SendFeedbackUseCase(gh<_i57.FeedbackRepository>()));
    gh.lazySingleton<_i60.BookingPatientRepository>(() =>
        _i61.BookingPatientRepositoryImpl(gh<_i13.BookingRemoteDataSource>()));
    gh.singletonAsync<_i62.GetDoctorProfileUseCase>(() async =>
        _i62.GetDoctorProfileUseCase(await getAsync<_i42.ProfileRepository>()));
    gh.singletonAsync<_i63.UpdatePatientUseCase>(() async =>
        _i63.UpdatePatientUseCase(await getAsync<_i42.ProfileRepository>()));
    gh.singleton<_i64.ChatUseCase>(
        () => _i64.ChatUseCase(gh<_i38.ChatRepository>()));
    gh.singleton<_i65.ChatCubit>(() => _i65.ChatCubit(gh<_i64.ChatUseCase>()));
    gh.singletonAsync<_i66.LoginUseCase>(
        () async => _i66.LoginUseCase(await getAsync<_i40.AuthRepository>()));
    gh.singletonAsync<_i67.RegisterUseCase>(() async =>
        _i67.RegisterUseCase(await getAsync<_i40.AuthRepository>()));
    gh.singletonAsync<_i68.VerifyCodeUseCase>(() async =>
        _i68.VerifyCodeUseCase(await getAsync<_i40.AuthRepository>()));
    gh.lazySingleton<_i69.GetBookingPatient>(
        () => _i69.GetBookingPatient(gh<_i60.BookingPatientRepository>()));
    gh.singleton<_i70.NewsCubit>(
        () => _i70.NewsCubit(gh<_i31.NewsRepository>()));
    gh.lazySingletonAsync<_i71.ProfileCubit>(() async => _i71.ProfileCubit(
          await getAsync<_i42.ProfileRepository>(),
          await getAsync<_i27.AuthLocalDataSource>(),
        ));
    gh.singletonAsync<_i72.ChangePasswordUseCase>(() async =>
        _i72.ChangePasswordUseCase(await getAsync<_i40.AuthRepository>()));
    gh.singletonAsync<_i73.ResetPasswordUseCae>(() async =>
        _i73.ResetPasswordUseCae(await getAsync<_i40.AuthRepository>()));
    gh.singleton<_i74.GetBookingByIdUseCase>(
        () => _i74.GetBookingByIdUseCase(gh<_i60.BookingPatientRepository>()));
    gh.singleton<_i75.GetAllBookingsUseCase>(
        () => _i75.GetAllBookingsUseCase(gh<_i60.BookingPatientRepository>()));
    gh.singletonAsync<_i76.ForgetPasswordUseCase>(() async =>
        _i76.ForgetPasswordUseCase(await getAsync<_i40.AuthRepository>()));
    gh.lazySingletonAsync<_i77.DoctorAppointmentRepository>(
        () async => _i78.DoctorAppointmentsRepositoryImpl(
              await getAsync<_i27.AuthLocalDataSource>(),
              gh<_i29.AppointmentRemoteDataSource>(),
            ));
    gh.lazySingleton<_i79.AppointmentDoctorByIdRepository>(() =>
        _i80.AppointmentDoctorByIdRepositoryImpl(
            gh<_i29.AppointmentRemoteDataSource>()));
    gh.singleton<_i81.AllBookingsCubit>(
        () => _i81.AllBookingsCubit(gh<_i75.GetAllBookingsUseCase>()));
    gh.lazySingletonAsync<_i82.DeleteAppointmentUseCase>(() async =>
        _i82.DeleteAppointmentUseCase(
            await getAsync<_i77.DoctorAppointmentRepository>()));
    gh.lazySingletonAsync<_i83.UpdateAppointmentUseCase>(() async =>
        _i83.UpdateAppointmentUseCase(
            await getAsync<_i77.DoctorAppointmentRepository>()));
    gh.singletonAsync<_i84.AuthCubit>(() async => _i84.AuthCubit(
          await getAsync<_i67.RegisterUseCase>(),
          await getAsync<_i66.LoginUseCase>(),
          await getAsync<_i27.AuthLocalDataSource>(),
        ));
    gh.singleton<_i85.AddMedicalRecordUseCase>(
        () => _i85.AddMedicalRecordUseCase(gh<_i33.MedicalRecordRepository>()));
    gh.singleton<_i86.MedicalRecordUseCase>(
        () => _i86.MedicalRecordUseCase(gh<_i33.MedicalRecordRepository>()));
    gh.singleton<_i87.MedicalRecordDoctorUseCase>(() =>
        _i87.MedicalRecordDoctorUseCase(gh<_i33.MedicalRecordRepository>()));
    gh.singleton<_i88.MedicalRecordPatientUseCase>(() =>
        _i88.MedicalRecordPatientUseCase(gh<_i33.MedicalRecordRepository>()));
    gh.singleton<_i89.AnalysisUseCase>(
        () => _i89.AnalysisUseCase(gh<_i50.AnalysisRepository>()));
    gh.singletonAsync<_i90.GetPatientProfileByIdUseCase>(() async =>
        _i90.GetPatientProfileByIdUseCase(
            await getAsync<_i42.ProfileRepository>()));
    gh.singletonAsync<_i91.ProfileUseCase>(() async =>
        _i91.ProfileUseCase(await getAsync<_i42.ProfileRepository>()));
    gh.singleton<_i92.BookingDoctorCubit>(
        () => _i92.BookingDoctorCubit(gh<_i54.GetBookingDoctor>()));
    gh.lazySingletonAsync<_i93.CreateAppointmentUseCase>(() async =>
        _i93.CreateAppointmentUseCase(
            await getAsync<_i77.DoctorAppointmentRepository>()));
    gh.factory<_i94.DoctorsCubit>(() => _i94.DoctorsCubit(
          gh<_i55.GetDoctors>(),
          gh<_i55.GetDoctorsByClinicId>(),
        ));
    gh.singletonAsync<_i95.VerifyCodeCubit>(() async =>
        _i95.VerifyCodeCubit(await getAsync<_i68.VerifyCodeUseCase>()));
    gh.lazySingleton<_i96.GetClinics>(
        () => _i96.GetClinics(gh<_i46.ClinicRepository>()));
    gh.lazySingleton<_i96.GetClinicsById>(
        () => _i96.GetClinicsById(gh<_i46.ClinicRepository>()));
    gh.lazySingleton<_i96.Search>(
        () => _i96.Search(gh<_i46.ClinicRepository>()));
    gh.lazySingleton<_i97.SearchCubit>(
        () => _i97.SearchCubit(gh<_i96.Search>()));
    gh.lazySingletonAsync<_i98.DeleteBookingUseCase>(() async =>
        _i98.DeleteBookingUseCase(await getAsync<_i48.BookingRepository>()));
    gh.lazySingletonAsync<_i99.PostBookAppointment>(() async =>
        _i99.PostBookAppointment(await getAsync<_i48.BookingRepository>()));
    gh.singletonAsync<_i100.ChangePasswordCubit>(() async =>
        _i100.ChangePasswordCubit(
            await getAsync<_i72.ChangePasswordUseCase>()));
    gh.singletonAsync<_i101.UpdateAppointmentCubit>(() async =>
        _i101.UpdateAppointmentCubit(
            await getAsync<_i83.UpdateAppointmentUseCase>()));
    gh.lazySingleton<_i102.GetAppointmentDoctorById>(() =>
        _i102.GetAppointmentDoctorById(
            gh<_i79.AppointmentDoctorByIdRepository>()));
    gh.singleton<_i103.GetNotificationsUseCase>(
        () => _i103.GetNotificationsUseCase(gh<_i52.NotificationRepository>()));
    gh.singleton<_i104.MarkNotificationAsReadUseCase>(() =>
        _i104.MarkNotificationAsReadUseCase(gh<_i52.NotificationRepository>()));
    gh.lazySingleton<_i105.AppointmentCubit>(
        () => _i105.AppointmentCubit(gh<_i102.GetAppointmentDoctorById>()));
    gh.singletonAsync<_i106.DeleteAppointmentCubit>(
        () async => _i106.DeleteAppointmentCubit(
              await getAsync<_i82.DeleteAppointmentUseCase>(),
              gh<_i75.GetAllBookingsUseCase>(),
            ));
    gh.lazySingleton<_i107.ClinicCubit>(() => _i107.ClinicCubit(
          gh<_i96.GetClinics>(),
          gh<_i96.GetClinicsById>(),
        ));
    gh.singleton<_i108.FeedbackCubit>(
        () => _i108.FeedbackCubit(gh<_i59.SendFeedbackUseCase>()));
    gh.singleton<_i109.AnalysisCubit>(
        () => _i109.AnalysisCubit(gh<_i89.AnalysisUseCase>()));
    gh.singleton<_i110.NotificationCubit>(() => _i110.NotificationCubit(
          gh<_i103.GetNotificationsUseCase>(),
          gh<_i104.MarkNotificationAsReadUseCase>(),
        ));
    gh.singleton<_i111.BookingPatientCubit>(
        () => _i111.BookingPatientCubit(gh<_i69.GetBookingPatient>()));
    gh.singletonAsync<_i112.ForgetPasswordCubit>(() async =>
        _i112.ForgetPasswordCubit(
            await getAsync<_i76.ForgetPasswordUseCase>()));
    gh.singleton<_i113.BookingByIdCubit>(
        () => _i113.BookingByIdCubit(gh<_i74.GetBookingByIdUseCase>()));
    gh.factoryAsync<_i114.BookingCubit>(() async => _i114.BookingCubit(
        bookAppointmentUseCase: await getAsync<_i99.PostBookAppointment>()));
    gh.singletonAsync<_i115.ResetPasswordCubit>(() async =>
        _i115.ResetPasswordCubit(await getAsync<_i73.ResetPasswordUseCae>()));
    gh.lazySingletonAsync<_i116.CreateAppointmentCubit>(() async =>
        _i116.CreateAppointmentCubit(
            await getAsync<_i93.CreateAppointmentUseCase>()));
    gh.singletonAsync<_i114.DeleteBookingCubit>(() async =>
        _i114.DeleteBookingCubit(
            deleteBookingUseCase: await getAsync<_i98.DeleteBookingUseCase>()));
    gh.lazySingletonAsync<_i117.GetDoctorsAppointments>(() async =>
        _i117.GetDoctorsAppointments(
            await getAsync<_i77.DoctorAppointmentRepository>()));
    gh.lazySingletonAsync<_i118.DoctorAppointmentsCubit>(() async =>
        _i118.DoctorAppointmentsCubit(
            await getAsync<_i117.GetDoctorsAppointments>()));
    return this;
  }
}

class _$RegisterModule extends _i119.RegisterModule {}
