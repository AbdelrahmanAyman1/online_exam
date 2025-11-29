import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_client.dart';
import 'package:online_exam/core/api/execute_api.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/auth/data/model/sign_up_response_dto.dart';
import 'package:online_exam/features/profile/data/datasourse/remote_profile_data_sourse.dart';
import 'package:online_exam/features/profile/data/model/change_password_request.dart';
import 'package:online_exam/features/profile/data/model/update_request_dto.dart';
import 'package:online_exam/features/profile/data/model/user_info_dto.dart';

@LazySingleton(as: RemoteProfileDataSourse)
class RemoteProfileDataSourseImpl implements RemoteProfileDataSourse {
  final ApiClient _apiClient;

  const RemoteProfileDataSourseImpl(this._apiClient);

  @override
  Future<Result<UserInfoDto>> getUserInfo() {
    var response = excuteApi<UserInfoDto>(() => _apiClient.getProfileInfo());
    return response;
  }

  @override
  Future<Result<UserInfoDto>> editUserInfo(UpdateUserModel newUpdateUser) {
    var response = excuteApi<UserInfoDto>(
      () => _apiClient.editProfileInfo(newUpdateUser),
    );
    return response;
  }

  @override
  Future<Result<SignUpResponseDto>> changePassword(
    ChangePasswordRequest changePasswordRequest,
  ) {
    return excuteApi<SignUpResponseDto>(
      () => _apiClient.changePassword(changePasswordRequest),
    );
  }
}
