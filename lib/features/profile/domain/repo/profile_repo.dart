import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';
import 'package:online_exam/features/profile/domain/entity/user_info_entity.dart';

abstract class ProfileRepo {
  Future<Result<UserInfoEntity>> getUserInfo();
  Future<Result<UserInfoEntity>> editUserInfo(UserEntity userEntity);
  Future<Result<AuthResponseModel>> changePassword(
    String oldPassword,
    String password,
    String rePassword,
  );
}
