import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';

sealed class LoginState {}

class LoginInitialState extends LoginState {}

class LoginSuccessState extends LoginState {
  AuthResponseModel authResponseModel;
  LoginSuccessState(this.authResponseModel);
}

class LoginFailureState extends LoginState {
  Exception exception;
  LoginFailureState(this.exception);
}

class LoginLoadingState extends LoginState {}
