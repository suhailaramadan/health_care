import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/app_bloc_observer.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/routes/routes_generators.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await configureDependencies();
  runApp(DevicePreview(
      // ignore: avoid_redundant_argument_values
      enabled: !kReleaseMode,
      builder: (context) => const HealthCareApp()));
}

class HealthCareApp extends StatelessWidget {
  const HealthCareApp({super.key});
  @override
  Widget build(BuildContext context) {
    return
        // MultiBlocProvider(
        //   providers: [
        //     // BlocProvider(create: (context) => serviceLocator.get<AuthCubit>()),
        //     // BlocProvider(create: (context) => serviceLocator.get<DoctorsCubit>()),
        //     // ..getDoctors()..getDoctorsByClinicId(clinicId)),
        //     BlocProvider(create: (context) => serviceLocator.get<ClinicCubit>()),
        //     // BlocProvider(create: (context) => serviceLocator.get<ProfileCubit>()),

        //     //     // ..getClinics()),
        //   ],
        //   //   BlocProvider(
        //   // create: (context) => serviceLocator.get<AuthCubit>(),
        //   child:
        ScreenUtilInit(
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
                initialRoute: Routes.patientHome)
            // ),
            );
  }
}
