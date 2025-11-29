import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/core/state_box/state_box.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';
import 'package:online_exam/features/profile/domain/entity/user_info_entity.dart';
import 'package:online_exam/features/profile/domain/usecase/change_password_usecase.dart';
import 'package:online_exam/features/profile/domain/usecase/edit_user_profile_info_usecase.dart';
import 'package:online_exam/features/profile/domain/usecase/get_user_profile_info_usecase.dart';
import 'package:online_exam/features/profile/presenstation/view_model/profile_state.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileState> {
  final GetProfileInfoUcecase _getProfileInfoUcecase;
  final EditProfileInfoUcecase _editProfileInfoUcecase;
  final ChangePasswordUseCase _changePasswordUseCase;
  ProfileViewModel(
    this._getProfileInfoUcecase,
    this._editProfileInfoUcecase,
    this._changePasswordUseCase,
  ) : super(
        ProfileState(
          profileInfo: StateBox.initial(),
          updateProfileInfo: StateBox.initial(),
          changePassword: StateBox.initial(),
        ),
      );

  void getProfileInfo() async {
    emit(state.copyWith(profileInfo: StateBox.loading()));
    var res = await _getProfileInfoUcecase.call();
    switch (res) {
      case Success<UserInfoEntity>():
        emit(state.copyWith(profileInfo: StateBox.success(data: res.data)));
      case Failure<UserInfoEntity>():
        emit(
          state.copyWith(
            profileInfo: StateBox.failure(errorMessage: res.exception.message),
          ),
        );
    }
  }

  void editProfileInfo(UserEntity entity) async {
    emit(state.copyWith(updateProfileInfo: StateBox.loading()));
    var res = await _editProfileInfoUcecase.call(entity);
    switch (res) {
      case Success<UserInfoEntity>():
        emit(
          state.copyWith(updateProfileInfo: StateBox.success(data: res.data)),
        );
      case Failure<UserInfoEntity>():
        emit(
          state.copyWith(
            updateProfileInfo: StateBox.failure(
              errorMessage: res.exception.message,
            ),
          ),
        );
    }
  }

  void changePassword(
    String oldPassword,
    String password,
    String rePassword,
  ) async {
    emit(state.copyWith(changePassword: StateBox.loading()));
    var res = await _changePasswordUseCase.call(
      oldPassword,
      password,
      rePassword,
    );
    switch (res) {
      case Success<AuthResponseModel>():
        emit(state.copyWith(changePassword: StateBox.success(data: res.data)));
      case Failure<AuthResponseModel>():
        emit(
          state.copyWith(
            changePassword: StateBox.failure(
              errorMessage: res.exception.message,
            ),
          ),
        );
    }
  }
}
