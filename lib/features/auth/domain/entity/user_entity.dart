class UserEntity {
  final String? token;
  final String? role;
  final bool? success;
  final List<dynamic>? errors;
  UserEntity({
    this.token,
    this.role,
    this.success,
    this.errors,
  });
}
