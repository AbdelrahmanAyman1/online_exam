import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/auth/data/model/sign_up_response_dto.dart';
import 'package:online_exam/features/profile/data/model/change_password_request.dart';
import 'package:online_exam/features/profile/data/model/update_request_dto.dart';
import 'package:online_exam/features/profile/data/model/user_info_dto.dart';

abstract class RemoteProfileDataSourse {
  Future<Result<UserInfoDto>> getUserInfo();
  Future<Result<UserInfoDto>> editUserInfo(UpdateUserModel entity);
  Future<Result<SignUpResponseDto>> changePassword(
    ChangePasswordRequest changePasswordRequest,
  );
}
