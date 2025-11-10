import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';

sealed class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoadingState extends ResetPasswordState {}

class ResetPasswordFailureState extends ResetPasswordState {
 final String ?errorMessage;

  ResetPasswordFailureState(this.errorMessage);
}

class ResetPasswordSuccessState extends ResetPasswordState {
  AuthResponseModel authResponseModel;

  ResetPasswordSuccessState(this.authResponseModel);
}
