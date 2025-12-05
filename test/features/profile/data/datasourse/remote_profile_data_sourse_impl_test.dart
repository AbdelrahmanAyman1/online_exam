import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/api_client.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/core/error/custom_error.dart';
import 'package:online_exam/features/profile/data/datasourse/remote_profile_data_sourse.dart';
import 'package:online_exam/features/profile/data/datasourse/remote_profile_data_sourse_impl.dart';
import 'package:online_exam/features/profile/data/model/user_info_dto.dart';

import 'remote_profile_data_sourse_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late RemoteProfileDataSourse _remoteProfileDataSourse;
  late ApiClient _apiClient;

  setUp(() {
    _apiClient = MockApiClient();
    _remoteProfileDataSourse = RemoteProfileDataSourseImpl(_apiClient);
  });
  group("test the profile data sourse", () {
    test("test get_user_info should retern data when success", () async {
      //arrange
      UserInfoDto tDto = UserInfoDto(message: "success");
      when(_apiClient.getProfileInfo()).thenAnswer((_) async => tDto);
      //act
      var result =
          await _remoteProfileDataSourse.getUserInfo() as Success<UserInfoDto>;
      //assert
      expect(result, isA<Success<UserInfoDto>>());
      expect(result.data, tDto);
      expect(result.data.message, isA<String>());
      expect(result.data.message, equals("success"));
    });
    test("test get_user_info should retern failure when fail", () async {
      //arrange
      CustomError tError = CustomError("fail");
      when(_apiClient.getProfileInfo()).thenThrow(tError);
      //act
      var result =
          await _remoteProfileDataSourse.getUserInfo() as Failure<UserInfoDto>;
      //assert
      //assert
      expect(result, isA<Failure<UserInfoDto>>());
      expect(result.exception, isA<CustomError>());
      expect(result.exception.message, isA<String>());
      expect(result.exception.message, equals("fail"));
    });
  });
}
