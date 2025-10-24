sealed class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoadingState extends ForgetPasswordState {}

class ForgetPasswordFailureState extends ForgetPasswordState {}

class ForgetPasswordSuccessState extends ForgetPasswordState {}
