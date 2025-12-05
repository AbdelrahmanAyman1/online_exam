import 'package:online_exam/features/profile/data/model/update_request_dto.dart';
import 'package:online_exam/features/profile/data/model/user_info_dto.dart';
import 'package:online_exam/features/profile/domain/entity/user_info_entity.dart';

extension UserXInfo on UserInfoDto {
  UserInfoEntity toEntity() {
    return UserInfoEntity(message: message, user: user?.toEntity());
  }
}

extension UserX on UserModel {
  UserEntity toEntity() => UserEntity(
    email: email,
    firstName: firstName,
    lastName: lastName,
    phoneNumber: phoneNumber,
    userName: userName,
  );
}

extension UserrequiestX on UserEntity {
  UpdateUserModel todto() => UpdateUserModel(
    email: email,
    firstName: firstName,
    lastName: lastName,
    phoneNumber: phoneNumber,
    userName: userName,
  );
}
