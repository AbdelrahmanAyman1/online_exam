import 'package:equatable/equatable.dart';
import 'package:online_exam/features/auth/domain/model/user_model.dart';

class AuthResponseModel extends Equatable {
  String? message;
  String? token;
  UserModel? user;

  AuthResponseModel({this.message, this.token, this.user});

  @override
  List<Object?> get props => [message, token, user];
}
