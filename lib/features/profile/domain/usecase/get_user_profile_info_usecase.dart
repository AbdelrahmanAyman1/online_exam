import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/profile/domain/entity/user_info_entity.dart';
import 'package:online_exam/features/profile/domain/repo/profile_repo.dart';

@lazySingleton
class GetProfileInfoUcecase {
  final ProfileRepo _profileRepo;

  const GetProfileInfoUcecase(this._profileRepo);

  Future<Result<UserInfoEntity>> call() => _profileRepo.getUserInfo();
}
