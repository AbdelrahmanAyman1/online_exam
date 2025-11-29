import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';
import 'package:online_exam/features/profile/domain/repo/profile_repo.dart';

@injectable
class ChangePasswordUseCase {
  final ProfileRepo _profileRepo;

  ChangePasswordUseCase(this._profileRepo);

  Future<Result<AuthResponseModel>> call(
    String oldPassword,
    String password,
    String rePassword,
  ) {
    return _profileRepo.changePassword(oldPassword, password, rePassword);
  }
}
