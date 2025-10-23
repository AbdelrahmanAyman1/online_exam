import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/features/auth/data/datasourse/online_data_sourse.dart';
import 'package:online_exam/features/auth/data/model/sign_up_request.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';
import 'package:online_exam/features/auth/domain/repo/auth_repo.dart';

@Injectable(as: AuthRepo)
class AuthRepoImp implements AuthRepo {
  final OnLineDataSoures _dataSourse;

  AuthRepoImp(this._dataSourse);

  @override
  Future<Result<SignUpResponseModel>> signUp(
    SignUpRequestModel signUpRequestModel,
  ) => _dataSourse.signUp(signUpRequestModel);
}
