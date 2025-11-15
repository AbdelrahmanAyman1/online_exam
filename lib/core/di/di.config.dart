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

import '../../features/auth/data/datasourse/online_data_sourse.dart' as _i358;
import '../../features/auth/data/datasourse/online_data_sourse_impl.dart'
    as _i914;
import '../../features/auth/data/repo/auth_repo_imp.dart' as _i39;
import '../../features/auth/domain/repo/auth_repo.dart' as _i170;
import '../../features/auth/domain/usecase/forget_password_usecase.dart'
    as _i16;
import '../../features/auth/domain/usecase/login_use_case.dart' as _i391;
import '../../features/auth/domain/usecase/reset_password_use_case.dart'
    as _i878;
import '../../features/auth/domain/usecase/sign_up_usecase.dart' as _i134;
import '../../features/auth/domain/usecase/verify_reset_code_use_case.dart'
    as _i1040;
import '../../features/auth/presentation/view_model/forget_password_view_model/forget_password_cubit.dart'
    as _i1043;
import '../../features/auth/presentation/view_model/login_view_model/login_cubit.dart'
    as _i925;
import '../../features/auth/presentation/view_model/reset_password_view_model/reset_password_cubit.dart'
    as _i609;
import '../../features/auth/presentation/view_model/sign_up_view_model/sign_up_cubit.dart'
    as _i230;
import '../../features/auth/presentation/view_model/verify_reset_code_view_model/verify_reset_code_cubit.dart'
    as _i451;
import '../../features/home/data/datasourse/remote_data_sourse.dart' as _i617;
import '../../features/home/data/datasourse/remote_data_sourse_impl.dart'
    as _i542;
import '../../features/home/data/repo/exam_on_subject_repo_impl.dart' as _i521;
import '../../features/home/domain/repo/get_exam_on_subject_repo.dart' as _i377;
import '../../features/home/domain/usecase/get_exam_on_subject_usecase.dart'
    as _i685;
import '../../features/home/presentation/view_model/get_all_exam_by_subject/exam_view_model.dart'
    as _i1035;
import '../../features/questions/data/data_source/questions_data_source.dart'
    as _i269;
import '../../features/questions/data/data_source/questions_data_source_impl.dart'
    as _i161;
import '../../features/questions/data/repo/exam_page_repo_impl.dart' as _i500;
import '../../features/questions/domain/repo/exam_page_repo.dart' as _i406;
import '../../features/questions/domain/use_case/get_questions_use_case.dart'
    as _i1061;
import '../../features/questions/presentation/view_model/exam_page_cubit.dart'
    as _i462;
import '../api/api_client.dart' as _i277;
import '../api/api_module.dart' as _i0;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final apiModule = _$ApiModule();
    gh.lazySingleton<_i361.BaseOptions>(() => apiModule.providerOption());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => apiModule.prvoideLogger());
    gh.lazySingleton<_i361.Dio>(
      () => apiModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.lazySingleton<_i277.ApiClient>(
      () => apiModule.provideApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i617.RemoteDataSourse>(
      () => _i542.RemoteDataSourseImpl(gh<_i277.ApiClient>()),
    );
    gh.lazySingleton<_i358.OnLineDataSoures>(
      () => _i914.OnlineDataSourseImpl(gh<_i277.ApiClient>()),
    );
    gh.lazySingleton<_i170.AuthRepo>(
      () => _i39.AuthRepoImp(gh<_i358.OnLineDataSoures>()),
    );
    gh.factory<_i269.QuestionsDataSource>(
      () => _i161.QuestionsDataSourceImpl(gh<_i277.ApiClient>()),
    );
    gh.lazySingleton<_i16.ForgetPasswordUseCase>(
      () => _i16.ForgetPasswordUseCase(gh<_i170.AuthRepo>()),
    );
    gh.lazySingleton<_i391.LoginUseCase>(
      () => _i391.LoginUseCase(gh<_i170.AuthRepo>()),
    );
    gh.lazySingleton<_i878.ResetPasswordUseCase>(
      () => _i878.ResetPasswordUseCase(gh<_i170.AuthRepo>()),
    );
    gh.lazySingleton<_i1040.VerifyResetCodeUseCase>(
      () => _i1040.VerifyResetCodeUseCase(gh<_i170.AuthRepo>()),
    );
    gh.factory<_i609.ResetPasswordCubit>(
      () => _i609.ResetPasswordCubit(gh<_i878.ResetPasswordUseCase>()),
    );
    gh.lazySingleton<_i377.ExamRepo>(
      () => _i521.ExamOnSubjectRepoImpl(gh<_i617.RemoteDataSourse>()),
    );
    gh.factory<_i1043.ForgetPasswordCubit>(
      () => _i1043.ForgetPasswordCubit(gh<_i16.ForgetPasswordUseCase>()),
    );
    gh.lazySingleton<_i134.SignUpUsecase>(
      () => _i134.SignUpUsecase(gh<_i170.AuthRepo>()),
    );
    gh.factory<_i406.ExamPageRepo>(
      () => _i500.ExamPageRepoImpl(gh<_i269.QuestionsDataSource>()),
    );
    gh.factory<_i451.VerifyResetCodeCubit>(
      () => _i451.VerifyResetCodeCubit(gh<_i1040.VerifyResetCodeUseCase>()),
    );
    gh.factory<_i230.SignUpCubit>(
      () => _i230.SignUpCubit(signUpUsecase: gh<_i134.SignUpUsecase>()),
    );
    gh.factory<_i925.LoginCubit>(
      () => _i925.LoginCubit(gh<_i391.LoginUseCase>()),
    );
    gh.lazySingleton<_i685.GetExamOnSubjectUsecase>(
      () => _i685.GetExamOnSubjectUsecase(gh<_i377.ExamRepo>()),
    );
    gh.factory<_i1035.ExamViewModel>(
      () => _i1035.ExamViewModel(gh<_i685.GetExamOnSubjectUsecase>()),
    );
    gh.factory<_i1061.GetQuestionsUseCase>(
      () => _i1061.GetQuestionsUseCase(gh<_i406.ExamPageRepo>()),
    );
    gh.factory<_i462.ExamPageCubit>(
      () => _i462.ExamPageCubit(gh<_i1061.GetQuestionsUseCase>()),
    );
    return this;
  }
}

class _$ApiModule extends _i0.ApiModule {}
