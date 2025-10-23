import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/features/auth/data/model/sign_up_request.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';
import 'package:online_exam/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:online_exam/features/auth/presentation/view_model/sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUsecase signUpUsecase;

  SignUpCubit({required this.signUpUsecase}) : super(SignUpInitialState());

  void signUp({
    required String userName,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {
    emit(SignUpLoadingState());

    SignUpRequestModel signUpRequestModel = SignUpRequestModel(
      userName: userName,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );

    var result = await signUpUsecase.invoke(signUpRequestModel);
    switch (result) {
      case Success<SignUpResponseModel>():
        emit(SignUpSuccessState(result.data));

      case Failure<SignUpResponseModel>():
        emit(SignUpFailureState(result.expection));
    }
  }
}
