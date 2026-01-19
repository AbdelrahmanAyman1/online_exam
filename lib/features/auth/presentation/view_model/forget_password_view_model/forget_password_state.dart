import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';

sealed class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoadingState extends ForgetPasswordState {}

class ForgetPasswordFailureState extends ForgetPasswordState {
  final String? errorMessage;

  ForgetPasswordFailureState(this.errorMessage);
}

class ForgetPasswordSuccessState extends ForgetPasswordState {
  AuthResponseModel authResponseModel;

  ForgetPasswordSuccessState(this.authResponseModel);
}
