import 'package:equatable/equatable.dart';
import 'package:online_exam/core/state_box/state_box.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';
import 'package:online_exam/features/profile/domain/entity/user_info_entity.dart';

class ProfileState extends Equatable {
  final StateBox<UserInfoEntity> profileInfo;
  final StateBox<UserInfoEntity> updateProfileInfo;
  final StateBox<AuthResponseModel> changePassword;

  const ProfileState({
    required this.profileInfo,
    required this.updateProfileInfo,
    required this.changePassword,
  });

  ProfileState copyWith({
    StateBox<UserInfoEntity>? profileInfo,
    StateBox<UserInfoEntity>? updateProfileInfo,
    StateBox<AuthResponseModel>? changePassword,
  }) {
    return ProfileState(
      profileInfo: profileInfo ?? this.profileInfo,
      updateProfileInfo: updateProfileInfo ?? this.updateProfileInfo,
      changePassword: changePassword ?? this.changePassword,
    );
  }

  @override
  List<Object?> get props => [profileInfo, updateProfileInfo, changePassword];
}
