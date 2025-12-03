import 'package:equatable/equatable.dart';

class UserInfoEntity extends Equatable {
  final String? message;
  final UserEntity? user;

  const UserInfoEntity({this.message, this.user});

  @override
  List<Object?> get props => [message, user];
}

class UserEntity extends Equatable {
  final String? userName;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  const UserEntity({
    this.userName,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
  });

  @override
  List<Object?> get props => [
    userName,
    firstName,
    lastName,
    email,
    phoneNumber,
  ];
}
