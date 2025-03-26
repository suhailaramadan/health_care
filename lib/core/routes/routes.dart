import 'package:flutter/material.dart';
import 'package:graduation_project/features/auth/presentation/screens/choose_user_screen.dart';
import 'package:graduation_project/features/auth/presentation/screens/login_screen.dart';
import 'package:graduation_project/features/auth/presentation/screens/register_screen.dart';
import 'package:graduation_project/features/user/booking/presentation/screen/booking_screen.dart';
import 'package:graduation_project/features/user/clinic/presentation/screen/clinic_screen.dart';
import 'package:graduation_project/features/user/clinic/presentation/widget/clinic_details.dart';
import 'package:graduation_project/features/doctor/presentation/screen/doctor_screen.dart';
import 'package:graduation_project/features/doctor/presentation/widgets/doctor_details.dart';
import 'package:graduation_project/features/home/presentation/screens/doctor_home_screen.dart';
import 'package:graduation_project/features/home/presentation/screens/patient_home_screen.dart';
import 'package:graduation_project/features/user/onBoarding/presentation/screen/on_boarding_screen.dart';
import 'package:graduation_project/features/profile/presentation/screen/profile_screen.dart';

class Routes {
  static const patientHome = PatientHomeScreen.patientHome;
  static const doctorHome = DoctorHomeScreen.doctorHome;
  static const onBoarding = OnBoardingScreen.onBoarding;
  static const register = RegisterScreen.register;
  static const chooseUser = ChooseUserScreen.chooseUser;
  static const login = LoginScreen.login;
  static const clinic = ClinicScreen.clinic;
  static const doctor = DoctorsScreen.doctor;
  static const profile = ProfileScreen.profile;
  static const booking = BookingScreen.booking;
  static const clinicDetails = ClinicDetails.clinicDetails;
  static const doctorsDetails = DoctorDetails.dectorDetails;
}
