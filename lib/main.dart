import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/app_bloc_observer.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/routes/routes_generators.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/core/widgets/shared_pref_handel.dart';
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:graduation_project/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/change_password_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/forget_password_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/reset_password_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/verify_code_cubit.dart';
import 'package:graduation_project/features/doctors/presentation/cubit/doctor_dashboard_cubit.dart';
import 'package:graduation_project/features/fcm.dart';
import 'package:graduation_project/features/feedback/presentation/cubit/feedback_cubit.dart';
import 'package:graduation_project/features/medical_record/presentation/cubit/medical_record_cubit.dart';
import 'package:graduation_project/features/medical_record/presentation/widgets/medical_record_card.dart';
import 'package:graduation_project/features/notification/presentiation/cubit/notification_cubit.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/create_appointment_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/delete_appointment_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/doctor_appointments_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/update_appointment_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_by_id_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_doctor_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart';
import 'package:graduation_project/features/user/chatBot/presentation/cubit/analysis_cubit.dart';
import 'package:graduation_project/features/user/chatBot/presentation/cubit/chat_cubit.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/search_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graduation_project/features/user/news/presentation/cubit/news_cubit.dart';
import 'package:graduation_project/firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("handling a nessasdf : ${message.messageId}");
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission();
  // final flutterLocalNotification = FlutterLocalNotificationsPlugin();
  // const AndroidInitializationSettings initializationSettingsAndroid =
  //     AndroidInitializationSettings("@mipmap/ic_launcher");
  // // final iosFlutterLocalNotificationPlugin =
  // //     IOSFlutterLocalNotificationsPlugin();
  // // const DarwinInitializationSettings initializationSettingsDarwin =
  // //     DarwinInitializationSettings(
  // //   requestSoundPermission: false,
  // //   requestBadgePermission: false,
  // //   requestAlertPermission: false,
  // // );
  // const InitializationSettings initializationSettings = InitializationSettings(
  //   android: initializationSettingsAndroid,
  //   // iOS: initializationSettingsDarwin,
  // );
  // await flutterLocalNotification.initialize(initializationSettings);
  // // await iosFlutterLocalNotificationPlugin
  // // .initialize(initializationSettingsDarwin);
  // FirebaseMessaging.instance.getInitialMessage().then((message) {
  //   if (message != null) {
  //     navigatorKey.currentState!.pushNamed(Routes.nitification);
  //   }
  // });

  // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //   if (message.data['route'] != null) {
  //     navigatorKey.currentState!.pushNamed(message.data['route']);
  //   } else if (navigatorKey.currentState?.mounted ?? false) {
  //     navigatorKey.currentState!.pushNamed(Routes.nitification);
  //   }
  // });
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await initializeDateFormatting('ar');
  Bloc.observer = AppBlocObserver();
  await configureDependencies();

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
  await SharedPrefHandel.init();
  runApp(DevicePreview(
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
  await SharedPrefHandel.init();
}

class HealthCareApp extends StatefulWidget {
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
  State<HealthCareApp> createState() => _HealthCareAppState();
}

class _HealthCareAppState extends State<HealthCareApp> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.requestPermission();

    // FirebaseMessaging.instance.getToken().then((token) {
    //   print("FCM Token: $token");
    // });
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   print(
    //       "Recive a message while in forground ${message.notification?.title}");
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => widget.authCubit),
          BlocProvider(create: (context) => widget.deleteBookingCubit),
          // ..getDoctors()..getDoctorsByClinicId(clinicId)),
          BlocProvider(create: (context) => serviceLocator.get<ClinicCubit>()),
          BlocProvider(
              create: (context) =>
                  widget.doctorAppointmentsCubit..getAppointments()),
          BlocProvider(create: (context) => serviceLocator.get<DoctorsCubit>()),
          BlocProvider(
            create: (context) => serviceLocator.get<SearchCubit>(),
          ),
          BlocProvider(
            create: (context) => serviceLocator.get<NewsCubit>(),
          ),
          BlocProvider(create: (context) => widget.bookingCubit),
          BlocProvider(
            create: (context) => widget.createAppointmentCubit,
          ),
          BlocProvider(
            create: (context) => serviceLocator.get<DoctorDashboardCubit>(),
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
              create: (context) => serviceLocator.get<FeedbackCubit>()),
          BlocProvider(
              create: (context) => serviceLocator.get<MedicalRecordCubit>()),
          BlocProvider(
              create: (context) => serviceLocator.get<BookingDoctorCubit>()),
          BlocProvider(
              create: (context) => serviceLocator.get<BookingByIdCubit>()),
          BlocProvider(
              create: (context) => serviceLocator.get<AppointmentCubit>()),
          BlocProvider(create: (context) => serviceLocator.get<ChatCubit>()),
          BlocProvider(
              create: (context) => serviceLocator.get<AnalysisCubit>()),
          // BlocProvider(
          //     create: (context) => serviceLocator.get<NotificationCubit>()),
          BlocProvider(
              create: (context) => serviceLocator.get<NotificationCubit>()),
          BlocProvider(create: (context) => widget.profileCubit),
        ],
        child: ScreenUtilInit(
            designSize: const Size(420, 874),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp(
                navigatorKey: navigatorKey,
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('ar'),
                  Locale('en'),
                ],
                // theme: ThemeData(useMaterial3: false),
                // ignore: deprecated_member_use
                useInheritedMediaQuery: true,
                locale: const Locale('ar'),
                // locale: DevicePreview.locale(context),
                builder: DevicePreview.appBuilder,
                debugShowCheckedModeBanner: false,
                onGenerateRoute: RouteGenerator.getRoute,
                initialRoute: Routes.onBoarding
                // SharedPrefHandel.getToken().isEmpty
                //     ? Routes.login
                //     : SharedPrefHandel.getUserRole() == 'User'
                //         ? Routes.patientHome
                //         : Routes.doctorHome
                )));
  }
}
