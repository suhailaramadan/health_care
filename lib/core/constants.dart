class ApiConstants {
  static const String baseUrl = "https://myclinicapp.runasp.net/api/";
  static const String imageBaseUrl = "https://myclinicapp.runasp.net";
  static const String clinicEndPoint = "${baseUrl}Clinic";
  static const String getdoctorsEndPoint = "Doctor";
  static const String registerPatientEndPoint =
      "Authentication/RegisterPatient";
  static const String loginPatientEndPoint = "Authentication/login";
  static const String profilePatientEndPoint = 'Patient';
}

class CacheConstants {
  static const tokenKey = "token";
  static const roleKey = 'role';
  static const firstNameKey = 'firstName';
  static const lastNameKey = 'lastName';
  static const userImageKey = 'userImage';
}
