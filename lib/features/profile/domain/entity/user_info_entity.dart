class UserInfoEntity {
  final String? message;
  final UserEntity? user;

  UserInfoEntity({this.message, this.user});
}

class UserEntity {
  final String? userName;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  UserEntity({
    this.userName,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
  });
}
