import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';

sealed class VerifyResetCodeState {}

class VerifyResetCodeInitialState extends VerifyResetCodeState {}

class VerifyResetCodeLoadingState extends VerifyResetCodeState {}

class VerifyResetCodeSuccessState extends VerifyResetCodeState {
  AuthResponseModel authResponseModel;

  VerifyResetCodeSuccessState(this.authResponseModel);
}

class VerifyResetCodeFailureState extends VerifyResetCodeState {
  Exception exception;

  VerifyResetCodeFailureState(this.exception);
}
