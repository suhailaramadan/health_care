import 'package:graduation_project/features/auth/presentation/screens/login_screen.dart';
import 'package:graduation_project/features/auth/presentation/screens/register_screen.dart';
import 'package:graduation_project/features/user/clinic/presentation/screen/clinic_screen.dart';
import 'package:graduation_project/features/user/clinic/presentation/widget/clinic_details.dart';
import 'package:graduation_project/features/user/home/presentation/screens/home_screen.dart';
import 'package:graduation_project/features/user/onBoarding/presentation/screen/on_boarding_screen.dart';
import 'package:graduation_project/features/user/profile/presentation/screen/profile_screen.dart';

class Routes {
  static const home = HomeScreen.home;
  static const onBoarding = OnBoardingScreen.onBoarding;
  static const register = RegisterScreen.register;
  static const login = LoginScreen.login;
  static const clinic = ClinicScreen.clinic;
  static const profile = ProfileScreen.profile;
  static const clinicDetails = ClinicDetails.clinicDetails;
}
