import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/core/constant/constants.dart';
import 'package:online_exam/core/helper/secure_storage.dart';
import 'package:online_exam/features/auth/data/model/login_request_model.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';
import 'package:online_exam/features/auth/domain/usecase/login_use_case.dart';
import 'package:online_exam/features/auth/presentation/view_model/login_view_model/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitialState());

  void login({required String email, required String password}) async {
    emit(LoginLoadingState());
    LoginRequestModel loginRequestModel = LoginRequestModel(
      email: email,
      password: password,
    );

    var result = await loginUseCase.invoke(loginRequestModel);
    switch (result) {
      case Success<AuthResponseModel>():
        _saveToken(result.data.token ?? "");
        emit(LoginSuccessState(result.data));
        break;
      case Failure<AuthResponseModel>():
        emit(LoginFailureState(result.exception.message));
        break;
    }
  }

  void _saveToken(String token) async {
    await SecureStorage().write(SharedKeys.userToken, token);
  }
}
