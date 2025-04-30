import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/auth/presentation/cubit/reset_password_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/verify_code_cubit.dart';
import 'package:graduation_project/features/auth/presentation/screens/change_password_screen.dart';
import 'package:graduation_project/features/auth/presentation/screens/choose_user_screen.dart';
import 'package:graduation_project/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:graduation_project/features/auth/presentation/screens/login_screen.dart';
import 'package:graduation_project/features/auth/presentation/screens/reset_password.dart';
import 'package:graduation_project/features/auth/presentation/screens/verfiy_code_screen.dart';
import 'package:graduation_project/features/auth/presentation/screens/register_screen.dart';
import 'package:graduation_project/features/doctors/presentation/screens/create_apointment_screen.dart';
import 'package:graduation_project/features/doctors/presentation/screens/doctor_appointments_screen.dart';
import 'package:graduation_project/features/doctors/presentation/screens/work_hours_screen.dart';
import 'package:graduation_project/features/home/presentation/screens/doctor_home_screen.dart';
import 'package:graduation_project/features/home/presentation/screens/patient_home_screen.dart';
import 'package:graduation_project/features/profile/data/model/profile_response/Update_request.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_entity.dart';
import 'package:graduation_project/features/profile/presentation/screen/update_profile.dart';
import 'package:graduation_project/features/splash_screen.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/doctors_appointment_model.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/create_appointment_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/doctor_appointments_cubit.dart';
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
      case Routes.splash:
        return _buildRoute(const SplashScreen(), isIOS);
      case Routes.doctor:
        return _buildRoute(const DoctorsScreen(), isIOS);
      case Routes.doctorAppointments:
        return _buildRoute(const DoctorAppointmentsScreen(), isIOS);
      case Routes.worksHours:
        return _buildRoute(const WorksHoursScreen(), isIOS);
      case Routes.chooseUser:
        return _buildRoute(const ChooseUserScreen(), isIOS);
      case Routes.register:
        return _buildRoute(const RegisterScreen(), isIOS);
      case Routes.clinic:
        return _buildRoute(const ClinicScreen(), isIOS);
      case Routes.profile:
        return _buildRoute(const ProfileScreen(), isIOS);
      case Routes.createAppointment:
        final doctorId = settings.arguments as String;
        return _buildRoute(CreateAppointmentScreen(doctorId: doctorId), isIOS);
      case Routes.updateprofile:
        final patient = settings.arguments as ProfileEntity;
        return _buildRoute(
            UpdateProfileScreen(
              patient: patient,
            ),
            isIOS);
      case Routes.booking:
        return _buildRoute(const BookingTab(), isIOS);
      case Routes.clinicDetails:
        return _buildRoute(const ClinicDetails(), isIOS);
      case Routes.forgetPassword:
        return _buildRoute(const ForgetPasswordScreen(), isIOS);
      case Routes.changePassword:
        return _buildRoute(const ChangePasswordScreen(), isIOS);
      case Routes.resetPassword:
        if (settings.arguments != null &&
            settings.arguments is Map<String, dynamic>) {
          final args = settings.arguments as Map<String, dynamic>;
          final email = args['email']?.toString() ?? '';
          final code = args['code']?.toString() ?? '';
          return _buildRoute(
            ResetPassword(
              email: email,
              code: code,
            ),
            isIOS,
          );
        } else {
          return _buildRoute(
              const Scaffold(body: Center(child: Text("بيانات ناقصة"))), isIOS);
        }
      // print("${settings.arguments}================================");
      // final args = settings.arguments as Map<String, dynamic>;
      // final email = args['email'] as String;
      // final code = args['code'] as String;
      // return _buildRoute(
      //     ResetPassword(
      //       code: code,
      //       email: email,
      //     ),
      //     isIOS);
      case Routes.verifycode:
        print("${settings.arguments}vvvvvvvvvvvvvvvvvvvvvvvvvvv");
        final args = settings.arguments as Map<String, dynamic>;
        final email = args['email'] as String;
        return _buildRoute(
            VerifyCodeScreen(
              email: email,
            ),
            isIOS);

      // const VerifyCodeScreen(
      //   email: '',
      // ),
      // isIOS);
      case Routes.doctorsDetails:
        return _buildRoute(
          const DoctorDetails(
            doctorId: '',
          ),
          isIOS,
        );
      default:
        return _buildRoute(const SplashScreen(), isIOS);
    }
  }

  static Route<dynamic> _buildRoute(Widget widget, bool isIOS) {
    return isIOS
        ? CupertinoPageRoute(builder: (_) => widget)
        : MaterialPageRoute(builder: (_) => widget);
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
