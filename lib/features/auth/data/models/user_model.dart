class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final int phoneNumber;
  final String college;
  final int nationalId;
  final String imageUrl;
  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.college,
      required this.nationalId,
      required this.imageUrl});
}
