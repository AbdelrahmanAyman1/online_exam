// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import 'api/api_client.dart' as _i332;
import 'api/api_module.dart' as _i95;
import 'api/online_data_sourse_impl.dart' as _i178;
import 'data/datasourse/online_data_sourse.dart' as _i691;
import 'data/repo/auth_repo_imp.dart' as _i696;
import 'domain/repo/auth_repo.dart' as _i818;
import 'domain/usecase/forget_password_usecase.dart' as _i150;
import 'domain/usecase/login_use_case.dart' as _i839;
import 'domain/usecase/sign_up_usecase.dart' as _i286;
import 'presentation/view_model/forget_password_view_model/forget_password_cubit.dart'
    as _i201;
import 'presentation/view_model/login_view_model/login_cubit.dart' as _i423;
import 'presentation/view_model/sign_up_view_model/sign_up_cubit.dart' as _i251;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final apiModule = _$ApiModule();
    gh.singleton<_i361.BaseOptions>(() => apiModule.providerOption());
    gh.singleton<_i528.PrettyDioLogger>(() => apiModule.prvoideLogger());
    gh.singleton<_i361.Dio>(
      () => apiModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.singleton<_i332.ApiClient>(
      () => apiModule.provideApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i691.OnLineDataSoures>(
      () => _i178.OnlineDataSourseImpl(gh<_i332.ApiClient>()),
    );
    gh.factory<_i818.AuthRepo>(
      () => _i696.AuthRepoImp(gh<_i691.OnLineDataSoures>()),
    );
    gh.factory<_i839.LoginUseCase>(
      () => _i839.LoginUseCase(gh<_i818.AuthRepo>()),
    );
    gh.factory<_i150.ForgetPasswordUseCase>(
      () => _i150.ForgetPasswordUseCase(gh<_i818.AuthRepo>()),
    );
    gh.factory<_i201.ForgetPasswordCubit>(
      () => _i201.ForgetPasswordCubit(gh<_i150.ForgetPasswordUseCase>()),
    );
    gh.factory<_i286.SignUpUsecase>(
      () => _i286.SignUpUsecase(gh<_i818.AuthRepo>()),
    );
    gh.factory<_i251.SignUpCubit>(
      () => _i251.SignUpCubit(signUpUsecase: gh<_i286.SignUpUsecase>()),
    );
    gh.factory<_i423.LoginCubit>(
      () => _i423.LoginCubit(gh<_i839.LoginUseCase>()),
    );
    return this;
  }
}

class _$ApiModule extends _i95.ApiModule {}
