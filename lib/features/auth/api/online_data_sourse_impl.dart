import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/api_utilts.dart';
import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/features/auth/api/api_client.dart';
import 'package:online_exam/features/auth/data/datasourse/online_data_sourse.dart';
import 'package:online_exam/features/auth/data/model/sign_up_request.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';

@Injectable(as: OnLineDataSoures)
class OnlineDataSourseImpl implements OnLineDataSoures {
  final ApiClient _apiClient;

  OnlineDataSourseImpl(this._apiClient);

  @override
  Future<Result<SignUpResponseModel>> signUp(
    SignUpRequestModel singUpRequestModel,
  ) async {
    return excuteApi<SignUpResponseModel>(() async {
      var response = await _apiClient.signUp(singUpRequestModel);
      return response.toModel();
    });
  }
}
