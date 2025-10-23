import 'package:injectable/injectable.dart';
import 'package:online_exam/features/auth/data/model/sign_up_request.dart';
import 'package:online_exam/features/auth/domain/usecase/sign_up_usecase.dart';

@injectable
class ViewModel {
  SignUpUsecase _signUpUsecase;

  ViewModel(this._signUpUsecase);

  void signUp() {
    SignUpRequestModel _signUpRequestModel = SignUpRequestModel(
      userName: "omar11233",
      firstName: "omar",
      lastName: "Tech",
      email: "admin133@omar.com",
      password: "Omar@123",
      rePassword: "Omar@123",
      phone: "01012874381",
    );
    _signUpUsecase.invoke(_signUpRequestModel);
  }
}
