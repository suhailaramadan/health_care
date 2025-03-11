class ApiConstants {
  static const String baseUrl = "https://myclinicapp.runasp.net/api/";
  static const String imageBaseUrl = "https://myclinicapp.runasp.net/";
  static const String clinicEndPoint = "${baseUrl}Clinic";
  static const String getdoctorsEndPoint = "doctor";
  static const String registerPatientEndPoint =
      "Authentication/RegisterPatient";
  static const String loginPatientEndPoint = "Authentication/login";
}

class CacheConstants {
  static const tokenKey = "token";
}
