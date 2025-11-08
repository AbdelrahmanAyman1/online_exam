import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';

sealed class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoadingState extends ResetPasswordState {}

class ResetPasswordFailureState extends ResetPasswordState {
  Exception exception;

  ResetPasswordFailureState(this.exception);
}

class ResetPasswordSuccessState extends ResetPasswordState {
  AuthResponseModel authResponseModel;

  ResetPasswordSuccessState(this.authResponseModel);
}
