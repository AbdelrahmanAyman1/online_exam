import 'package:online_exam/features/auth/domain/model/user_model.dart';

class AuthResponseModel {
  String? message;
  String? token;
  UserModel? user;

  AuthResponseModel({this.message, this.token, this.user});
}
