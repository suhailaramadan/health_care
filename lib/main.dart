import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/app_bloc_observer.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/routes/routes_generators.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/change_password_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/forget_password_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/reset_password_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/verify_code_cubit.dart';
import 'package:graduation_project/features/medical_record/presentation/cubit/medical_record_cubit.dart';
import 'package:graduation_project/features/medical_record/presentation/widgets/medical_record_card.dart';
import 'package:graduation_project/features/notification/presentiation/cubit/notification_cubit.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/create_appointment_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/doctor_appointments_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/update_appointment_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_doctor_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/search_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar');
  Bloc.observer = AppBlocObserver();
  await configureDependencies();
  // await serviceLocator.init();
  await serviceLocator.allReady();
  final authCubit = await serviceLocator.getAsync<AuthCubit>();
  final profileCubit = await serviceLocator.getAsync<ProfileCubit>();
  final bookingCubit = await serviceLocator.getAsync<BookingCubit>();
  final createAppointment =
      await serviceLocator.getAsync<CreateAppointmentCubit>();
  final doctorAppointmentsCubit =
      await serviceLocator.getAsync<DoctorAppointmentsCubit>();
  final deleteBookingCubit =
      await serviceLocator.getAsync<DeleteBookingCubit>();
  runApp(DevicePreview(
      // ignore: avoid_redundant_argument_values
      // enabled: !kReleaseMode,
      enabled: false,
      builder: (context) => HealthCareApp(
            authCubit: authCubit,
            profileCubit: profileCubit,
            bookingCubit: bookingCubit,
            deleteBookingCubit: deleteBookingCubit,
            doctorAppointmentsCubit: doctorAppointmentsCubit,
            createAppointmentCubit: createAppointment,
          )));
}

class HealthCareApp extends StatelessWidget {
  final AuthCubit authCubit;
  final ProfileCubit profileCubit;
  final BookingCubit bookingCubit;
  final DeleteBookingCubit deleteBookingCubit;
  final DoctorAppointmentsCubit doctorAppointmentsCubit;
  final CreateAppointmentCubit createAppointmentCubit;
  const HealthCareApp(
      {super.key,
      required this.authCubit,
      required this.profileCubit,
      required this.bookingCubit,
      required this.deleteBookingCubit,
      required this.doctorAppointmentsCubit,
      required this.createAppointmentCubit});
  @override
  Widget build(BuildContext context) {
    // return
    // FutureBuilder<ProfileCubit>(
    //     future: serviceLocator.getAsync<ProfileCubit>(),
    //     builder: (context, snapshot) {
    //       if (!snapshot.hasData) {
    //         return const MaterialApp(
    //           home: Scaffold(
    //             body: Center(
    //               child: LoadingIndicator(),
    //             ),
    //           ),
    //         );
    //       }
    // final profileCubit = snapshot.data!;
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => authCubit),
          BlocProvider(create: (context) => deleteBookingCubit),
          // ..getDoctors()..getDoctorsByClinicId(clinicId)),
          BlocProvider(create: (context) => serviceLocator.get<ClinicCubit>()),
          BlocProvider(
              create: (context) => doctorAppointmentsCubit..getAppointments()),
          BlocProvider(create: (context) => serviceLocator.get<DoctorsCubit>()),
          BlocProvider(
            create: (context) => serviceLocator.get<SearchCubit>(),
          ),
          BlocProvider(create: (context) => bookingCubit),
          BlocProvider(
            create: (context) => createAppointmentCubit,
          ),
          BlocProvider(
              create: (context) =>
                  serviceLocator.get<UpdateAppointmentCubit>()),

          BlocProvider(
              create: (context) => serviceLocator.get<ForgetPasswordCubit>()),
          BlocProvider(
              create: (context) => serviceLocator.get<ChangePasswordCubit>()),
          BlocProvider(
              create: (context) => serviceLocator.get<VerifyCodeCubit>()),
          BlocProvider(
              create: (context) => serviceLocator.get<ResetPasswordCubit>()),
          BlocProvider(
              create: (context) => serviceLocator.get<BookingPatientCubit>()),
          BlocProvider(
              create: (context) => serviceLocator.get<MedicalRecordCubit>()),
          BlocProvider(
              create: (context) => serviceLocator.get<BookingDoctorCubit>()),
          BlocProvider(
              create: (context) => serviceLocator.get<AppointmentCubit>()),
          BlocProvider(
              create: (context) => serviceLocator.get<NotificationCubit>()),

          BlocProvider(create: (context) => profileCubit),
        ],
        child: const ScreenUtilInit(
            designSize: Size(420, 874),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp(
                localizationsDelegates: [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [
                  Locale('ar'),
                  Locale('en'),
                ],
                // theme: ThemeData(useMaterial3: false),
                // ignore: deprecated_member_use
                useInheritedMediaQuery: true,
                locale: Locale('ar'),
                // locale: DevicePreview.locale(context),
                builder: DevicePreview.appBuilder,
                debugShowCheckedModeBanner: false,
                onGenerateRoute: RouteGenerator.getRoute,
                initialRoute: Routes.splash)));
  }
}
