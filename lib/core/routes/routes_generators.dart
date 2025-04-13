import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/auth/presentation/screens/choose_user_screen.dart';
import 'package:graduation_project/features/auth/presentation/screens/login_screen.dart';
import 'package:graduation_project/features/auth/presentation/screens/register_screen.dart';
import 'package:graduation_project/features/home/presentation/screens/doctor_home_screen.dart';
import 'package:graduation_project/features/home/presentation/screens/patient_home_screen.dart';
import 'package:graduation_project/features/user/booking/presentation/screen/booking_screen.dart';
import 'package:graduation_project/features/user/clinic/presentation/screen/clinic_screen.dart';
import 'package:graduation_project/features/user/clinic/presentation/widget/clinic_details.dart';
import 'package:graduation_project/features/doctor/presentation/screen/doctor_screen.dart';
import 'package:graduation_project/features/doctor/presentation/widgets/doctor_details.dart';
import 'package:graduation_project/features/user/onBoarding/presentation/screen/on_boarding_screen.dart';
import 'package:graduation_project/features/profile/presentation/screen/profile_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    final isIOS = defaultTargetPlatform == TargetPlatform.iOS;
    switch (settings.name) {
      case Routes.patientHome:
        return _buildRoute(const PatientHomeScreen(), isIOS);
      case Routes.doctorHome:
        return _buildRoute(const DoctorHomeScreen(), isIOS);
      case Routes.onBoarding:
        return _buildRoute(const OnBoardingScreen(), isIOS);
      case Routes.login:
        return _buildRoute(
            const LoginScreen(
              userType: 'User',
            ),
            isIOS);
      case Routes.doctor:
        return _buildRoute(const DoctorsScreen(), isIOS);
      case Routes.chooseUser:
        return _buildRoute(const ChooseUserScreen(), isIOS);
      case Routes.register:
        return _buildRoute(const RegisterScreen(), isIOS);
      case Routes.clinic:
        return _buildRoute(const ClinicScreen(), isIOS);
      case Routes.profile:
        return _buildRoute(const ProfileScreen(), isIOS);
      case Routes.booking:
        return _buildRoute(const BookingTab(), isIOS);
      case Routes.clinicDetails:
        return _buildRoute(const ClinicDetails(), isIOS);
      case Routes.doctorsDetails:
        return _buildRoute(
          const DoctorDetails(
            doctorId: '',
          ),
          isIOS,
        );
      default:
        return _buildRoute(const PatientHomeScreen(), isIOS);
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
