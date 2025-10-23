import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';

sealed class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpSuccessState extends SignUpState {
  final SignUpResponseModel signUpResponseModel;

  SignUpSuccessState(this.signUpResponseModel);
}

class SignUpFailureState extends SignUpState {
  final Exception exception;

  SignUpFailureState(this.exception);
}

class SignUpLoadingState extends SignUpState {}
