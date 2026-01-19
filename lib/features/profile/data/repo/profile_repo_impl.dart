import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/core/constant/constants.dart';
import 'package:online_exam/core/helper/secure_storage.dart';
import 'package:online_exam/features/auth/data/model/sign_up_response_dto.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';
import 'package:online_exam/features/profile/data/datasourse/remote_profile_data_sourse.dart';
import 'package:online_exam/features/profile/data/mapper/user_info_mapper.dart';
import 'package:online_exam/features/profile/data/model/change_password_request.dart';
import 'package:online_exam/features/profile/data/model/user_info_dto.dart';
import 'package:online_exam/features/profile/domain/entity/user_info_entity.dart';
import 'package:online_exam/features/profile/domain/repo/profile_repo.dart';

@LazySingleton(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final RemoteProfileDataSourse _dataSourse;

  const ProfileRepoImpl(this._dataSourse);

  @override
  Future<Result<UserInfoEntity>> getUserInfo() async {
    var result = await _dataSourse.getUserInfo();
    switch (result) {
      case Success<UserInfoDto>():
        var data = result.data.toEntity();
        return Success(data);
      case Failure<UserInfoDto>():
        return Failure(result.exception);
    }
  }

  @override
  Future<Result<UserInfoEntity>> editUserInfo(UserEntity entity) async {
    var result = await _dataSourse.editUserInfo(entity.todto());
    switch (result) {
      case Success<UserInfoDto>():
        var data = result.data.toEntity();
        return Success(data);
      case Failure<UserInfoDto>():
        return Failure(result.exception);
    }
  }

  @override
  Future<Result<AuthResponseModel>> changePassword(
    String oldPassword,
    String password,
    String rePassword,
  ) async {
    var result = await _dataSourse.changePassword(
      ChangePasswordRequest(
        oldPassword: oldPassword,
        password: password,
        rePassword: rePassword,
      ),
    );
    switch (result) {
      case Success<SignUpResponseDto>():
        if (result.data.token != null) {
          await SecureStorage().write(SharedKeys.userToken, result.data.token!);
        }
        return Success(result.data.toModel());
      case Failure<SignUpResponseDto>():
        return Failure(result.exception);
    }
  }
}
