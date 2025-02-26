import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/app_bloc_observer.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/routes/routes_generators.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await configureDependencies();
  runApp(const HealthCareApp());
}

class HealthCareApp extends StatelessWidget {
  const HealthCareApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
        designSize: Size(420, 874),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.home));
  }
}
