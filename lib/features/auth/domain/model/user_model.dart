class UserModel {
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isVerified;
  String? id;
  String? createAt;

  UserModel({
    this.createAt,
    this.email,
    this.firstName,
    this.id,
    this.isVerified,
    this.lastName,
    this.phone,
    this.role,
    this.userName,
  });
}
