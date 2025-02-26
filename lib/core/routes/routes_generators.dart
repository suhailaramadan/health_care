import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/auth/presentation/screens/login_screen.dart';
import 'package:graduation_project/features/auth/presentation/screens/register_screen.dart';
import 'package:graduation_project/features/user/clinic/presentation/screen/clinic_screen.dart';
import 'package:graduation_project/features/user/home/presentation/screens/home_screen.dart';
import 'package:graduation_project/features/user/onBoarding/presentation/screen/on_boarding_screen.dart';
import 'package:graduation_project/features/user/profile/presentation/screen/profile_tab.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    final isIOS = defaultTargetPlatform == TargetPlatform.iOS;
    switch (settings.name) {
      case Routes.home:
        return _buildRoute(const HomeScreen(), isIOS);
      case Routes.onBoarding:
        return _buildRoute(const OnBoardingScreen(), isIOS);
      case Routes.login:
        return _buildRoute(const LoginScreen(), isIOS);
      case Routes.register:
        return _buildRoute(const RegisterScreen(), isIOS);
      case Routes.clinic:
        return _buildRoute(const ClinicScreen(), isIOS);
      default:
        return _buildRoute(const HomeScreen(), isIOS);
    }
  }

  static Route<dynamic> _buildRoute(Widget widget, bool isIOS) {
    return isIOS
        ? CupertinoPageRoute(builder: (_) => widget)
        : MaterialPageRoute(builder: (_) => widget);
  }

  // static Route<dynamic> _undefinedRoute() {
  //   return MaterialPageRoute(
  //     builder: (_) => Scaffold(
  //       appBar: AppBar(
  //         title: const Text('No Route Found'),
  //       ),
  //       body: const Center(child: Text('No Route Found')),
  //     ),
  //   );
  // }
}
