import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/features/auth/data/model/login_request_model.dart';
import 'package:online_exam/features/auth/domain/usecase/forget_password_usecase.dart';
import 'package:online_exam/features/auth/presentation/view_model/forget_password_view_model/forget_password_state.dart';

import '../../../domain/model/sign_up_response_model.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordUseCase forgetPasswordUseCase;
  ForgetPasswordCubit(this.forgetPasswordUseCase)
    : super(ForgetPasswordInitial());

  void forgetPassword(String email) async {
    emit(ForgetPasswordLoadingState());
    LoginRequestModel loginRequestModel = LoginRequestModel(email: email);
    var result = await forgetPasswordUseCase.forgetPassword(email);
    switch (result) {
      case Success<AuthResponseModel>():
        emit(ForgetPasswordSuccessState(result.data));
        break;
      case Failure<AuthResponseModel>():
        emit(ForgetPasswordFailureState(result.exception));
        break;
    }
  }
}
