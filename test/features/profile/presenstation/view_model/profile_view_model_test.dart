import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/core/error/custom_error.dart';
import 'package:online_exam/core/state_box/state_box.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';
import 'package:online_exam/features/profile/domain/entity/user_info_entity.dart';
import 'package:online_exam/features/profile/domain/usecase/change_password_usecase.dart';
import 'package:online_exam/features/profile/domain/usecase/edit_user_profile_info_usecase.dart';
import 'package:online_exam/features/profile/domain/usecase/get_user_profile_info_usecase.dart';
import 'package:online_exam/features/profile/presenstation/view_model/profile_state.dart';
import 'package:online_exam/features/profile/presenstation/view_model/profile_view_model.dart';

import 'profile_view_model_test.mocks.dart';

@GenerateMocks([
  GetProfileInfoUcecase,
  EditProfileInfoUcecase,
  ChangePasswordUseCase,
])
void main() {
  late ProfileViewModel profileViewModel;
  late GetProfileInfoUcecase mockGetProfileInfoUcecase;
  late EditProfileInfoUcecase mockEditProfileInfoUcecase;
  late ChangePasswordUseCase mockChangePasswordUseCase;

  setUp(() {
    mockGetProfileInfoUcecase = MockGetProfileInfoUcecase();
    mockEditProfileInfoUcecase = MockEditProfileInfoUcecase();
    mockChangePasswordUseCase = MockChangePasswordUseCase();
    profileViewModel = ProfileViewModel(
      mockGetProfileInfoUcecase,
      mockEditProfileInfoUcecase,
      mockChangePasswordUseCase,
    );
  });

  group('ProfileViewModel - GetProfileInfo', () {
    blocTest<ProfileViewModel, ProfileState>(
      'emits [loading, success] when GetProfileInfoEvent is triggered successfully',
      build: () => profileViewModel,
      setUp: () {
        final tUserInfo = UserInfoEntity();
        final successResponse = Success<UserInfoEntity>(tUserInfo);
        provideDummy<Result<UserInfoEntity>>(successResponse);

        when(
          mockGetProfileInfoUcecase.call(),
        ).thenAnswer((_) async => successResponse);
      },
      act: (cubit) => cubit.doIntent(GetProfileInfoEvent()),
      expect: () {
        var initialState = ProfileState(
          profileInfo: StateBox.initial(),
          changePassword: StateBox.initial(),
          updateProfileInfo: StateBox.initial(),
        );
        final tUserInfo = UserInfoEntity();
        return [
          initialState.copyWith(
            profileInfo: StateBox.loading(),
          ),
          initialState.copyWith(
            profileInfo: StateBox.success(data: tUserInfo),
          ),
        ];
      },
      verify: (_) {
        verify(mockGetProfileInfoUcecase.call()).called(1);
      },
    );

    blocTest<ProfileViewModel, ProfileState>(
      'emits [loading, failure] when GetProfileInfoEvent fails',
      build: () => profileViewModel,
      setUp: () {
        final failureResponse = Failure<UserInfoEntity>(
          CustomError("Failed to fetch"),
        );
        provideDummy<Result<UserInfoEntity>>(failureResponse);

        when(
          mockGetProfileInfoUcecase.call(),
        ).thenAnswer((_) async => failureResponse);
      },
      act: (cubit) => cubit.doIntent(GetProfileInfoEvent()),
      expect: () {
        var initialState = ProfileState(
          profileInfo: StateBox.initial(),
          changePassword: StateBox.initial(),
          updateProfileInfo: StateBox.initial(),
        );
        return [
          initialState.copyWith(
            profileInfo: StateBox.loading(),
          ),
          initialState.copyWith(
            profileInfo: StateBox.failure(errorMessage: "Failed to fetch"),
          ),
        ];
      },
      verify: (_) {
        verify(mockGetProfileInfoUcecase.call()).called(1);
      },
    );
  });

  group('ProfileViewModel - EditProfileInfo', () {
    blocTest<ProfileViewModel, ProfileState>(
      'emits [loading, success] when ChangeProfileUpdateEvent is triggered successfully',
      build: () => profileViewModel,
      setUp: () {
        final tUserInfo = UserInfoEntity();
        final tEntity = UserEntity(email: "test@gmail.com");
        final successResponse = Success<UserInfoEntity>(tUserInfo);
        provideDummy<Result<UserInfoEntity>>(successResponse);

        when(
          mockEditProfileInfoUcecase.call(tEntity),
        ).thenAnswer((_) async => successResponse);
      },
      act: (cubit) => cubit.doIntent(
        ChangeProfileUpdateEvent(entity: UserEntity(email: "test@gmail.com")),
      ),
      expect: () {
        var initialState = ProfileState(
          profileInfo: StateBox.initial(),
          changePassword: StateBox.initial(),
          updateProfileInfo: StateBox.initial(),
        );
        final tUserInfo = UserInfoEntity();
        return [
          initialState.copyWith(
            updateProfileInfo: StateBox.loading(),
          ),
          initialState.copyWith(
            updateProfileInfo: StateBox.success(data: tUserInfo),
          ),
        ];
      },
    );
  });

  group('ProfileViewModel - ChangePassword', () {
    blocTest<ProfileViewModel, ProfileState>(
      'emits [loading, success] when ChangePasswordEvent is triggered successfully',
      build: () => profileViewModel,
      setUp: () {
        final tResponse = AuthResponseModel();
        final successResponse = Success<AuthResponseModel>(tResponse);
        provideDummy<Result<AuthResponseModel>>(successResponse);

        when(
          mockChangePasswordUseCase.call("old", "new", "new"),
        ).thenAnswer((_) async => successResponse);
      },
      act: (cubit) => cubit.doIntent(
        ChangePasswordEvent(
          oldPassword: "old",
          newPassword: "new",
          rePassword: "new",
        ),
      ),
      expect: () {
        var initialState = ProfileState(
          profileInfo: StateBox.initial(),
          changePassword: StateBox.initial(),
          updateProfileInfo: StateBox.initial(),
        );
        final tResponse = AuthResponseModel();
        return [
          initialState.copyWith(
            changePassword: StateBox.loading(),
          ),
          initialState.copyWith(
            changePassword: StateBox.success(data: tResponse),
          ),
        ];
      },
      verify: (_) {
        verify(mockChangePasswordUseCase.call("old", "new", "new")).called(1);
      },
    );

    blocTest<ProfileViewModel, ProfileState>(
      'emits [loading, failure] when ChangePasswordEvent fails',
      build: () => profileViewModel,
      setUp: () {
        final failureResponse = Failure<AuthResponseModel>(
          CustomError("Invalid password"),
        );
        provideDummy<Result<AuthResponseModel>>(failureResponse);

        when(
          mockChangePasswordUseCase.call("old", "new", "new"),
        ).thenAnswer((_) async => failureResponse);
      },
      act: (cubit) => cubit.doIntent(
        ChangePasswordEvent(
          oldPassword: "old",
          newPassword: "new",
          rePassword: "new",
        ),
      ),
      expect: () {
        var initialState = ProfileState(
          profileInfo: StateBox.initial(),
          changePassword: StateBox.initial(),
          updateProfileInfo: StateBox.initial(),
        );
        return [
          initialState.copyWith(
            changePassword: StateBox.loading(),
          ),
          initialState.copyWith(
            changePassword: StateBox.failure(errorMessage: "Invalid password"),
          ),
        ];
      },
      verify: (_) {
        verify(mockChangePasswordUseCase.call("old", "new", "new")).called(1);
      },
    );
  });
}
