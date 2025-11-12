import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/auth/data/model/reset_password_request.dart';
import 'package:online_exam/features/auth/domain/usecase/reset_password_use_case.dart';
import 'package:online_exam/features/auth/presentation/view_model/reset_password_view_model/reset_password_state.dart';

import '../../../domain/model/sign_up_response_model.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordUseCase resetPasswordUseCase;
  ResetPasswordCubit(this.resetPasswordUseCase) : super(ResetPasswordInitial());

  void restPassword({String? email, String? newPassword}) async {
    ResetPasswordRequest resetPasswordRequest = ResetPasswordRequest(
      email: email,
      newPassword: newPassword,
    );
    emit(ResetPasswordLoadingState());
    var result = await resetPasswordUseCase.invoke(resetPasswordRequest);

    switch (result) {
      case Success<AuthResponseModel>():
        emit(ResetPasswordSuccessState(result.data));
        break;
      case Failure<AuthResponseModel>():
        emit(ResetPasswordFailureState(result.exception.message));
        break;
    }
  }
}
