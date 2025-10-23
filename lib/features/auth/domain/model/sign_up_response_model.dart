import 'package:online_exam/features/auth/domain/model/user_model.dart';

class SignUpResponseModel {
  String? message;
  String? token;
  UserModel? user;

  SignUpResponseModel({this.message, this.token, this.user});
}
