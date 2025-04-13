import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/app_bloc_observer.dart';
import 'package:graduation_project/core/di/service_locator.config.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/routes/routes_generators.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar');
  Bloc.observer = AppBlocObserver();
  await configureDependencies();
  // await serviceLocator.init();
  await serviceLocator.allReady();
  runApp(DevicePreview(
      // ignore: avoid_redundant_argument_values
      // enabled: !kReleaseMode,
      enabled: false,
      builder: (context) => const HealthCareApp()));
}

class HealthCareApp extends StatelessWidget {
  const HealthCareApp({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProfileCubit>(
        future: serviceLocator.getAsync<ProfileCubit>(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: LoadingIndicator(),
                ),
              ),
            );
          }
          final profileCubit = snapshot.data!;
          return MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) => serviceLocator.get<AuthCubit>()),
                // BlocProvider(create: (context) => serviceLocator.get<DoctorsCubit>()),
                // ..getDoctors()..getDoctorsByClinicId(clinicId)),
                BlocProvider(
                    create: (context) => serviceLocator.get<ClinicCubit>()),
                BlocProvider(
                    create: (context) => serviceLocator.get<BookingCubit>()),
                BlocProvider(
                    create: (context) =>
                        serviceLocator.get<BookingPatientCubit>()),
                BlocProvider(
                    create: (context) =>
                        serviceLocator.get<AppointmentCubit>()),
                BlocProvider(
                    create: (context) => profileCubit..getPatientProfile())
              ],
              child: ScreenUtilInit(
                  designSize: const Size(420, 874),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  child: MaterialApp(
                      // ignore: deprecated_member_use
                      useInheritedMediaQuery: true,
                      locale: DevicePreview.locale(context),
                      builder: DevicePreview.appBuilder,
                      debugShowCheckedModeBanner: false,
                      onGenerateRoute: RouteGenerator.getRoute,
                      initialRoute: Routes.clinic)));
        });
  }
}
// }
