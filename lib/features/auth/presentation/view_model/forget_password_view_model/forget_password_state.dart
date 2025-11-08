import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';

sealed class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoadingState extends ForgetPasswordState {}

class ForgetPasswordFailureState extends ForgetPasswordState {
  Exception exception;

  ForgetPasswordFailureState(this.exception);
}

class ForgetPasswordSuccessState extends ForgetPasswordState {
  AuthResponseModel authResponseModel;

  ForgetPasswordSuccessState(this.authResponseModel);
}
