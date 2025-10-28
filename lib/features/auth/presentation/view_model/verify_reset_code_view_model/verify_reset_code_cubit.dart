import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/features/auth/data/model/verify_reset_code_request_model.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';
import 'package:online_exam/features/auth/domain/usecase/verify_reset_code_use_case.dart';
import 'package:online_exam/features/auth/presentation/view_model/verify_reset_code_view_model/verify_reset_code_state.dart';

@injectable
class VerifyResetCodeCubit extends Cubit<VerifyResetCodeState> {
  VerifyResetCodeUseCase verifyResetCodeUseCase;
  VerifyResetCodeCubit(this.verifyResetCodeUseCase)
    : super(VerifyResetCodeInitialState());

  void verifyResetCode({required String code}) async {
    emit(VerifyResetCodeLoadingState());
    VerifyResetCodeRequestModel verifyResetCodeRequestModel =
        VerifyResetCodeRequestModel(resetCode: code);

    var result = await verifyResetCodeUseCase.invoke(
      verifyResetCodeRequestModel,
    );
    switch (result) {
      case Success<AuthResponseModel>():
        emit(VerifyResetCodeSuccessState(result.data));
        break;
      case Failure<AuthResponseModel>():
        emit(VerifyResetCodeFailureState(result.exception));
        break;
    }
  }
}
