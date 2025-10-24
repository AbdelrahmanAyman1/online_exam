import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../auth/api/api_client.dart';
import '../data/data_source/home_data_source.dart';
import '../data/data_source/home_remote_data_source.dart';
import '../data/repo/home_repo_impl.dart';
import '../domain/repo/home_repo.dart';
import '../domain/usecase/get_subjects_usecase.dart';
import '../presentation/cubit/home_cubit.dart';

final sl = GetIt.instance;

Future<void> initHomeDependencies() async {
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://exam.elevateegy.com/api/v1/',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    return dio;
  });

  sl.registerLazySingleton<ApiClient>(
        () => ApiClient(sl<Dio>()),
  );

  sl.registerLazySingleton<HomeRemoteDataSource>(
        () => HomeRemoteDataSourceImpl(sl<ApiClient>()),
  );

  sl.registerLazySingleton<HomeRepo>(
        () => HomeRepoImpl(sl<HomeRemoteDataSource>()),
  );

  sl.registerLazySingleton<GetSubjectsUseCase>(
        () => GetSubjectsUseCase(sl<HomeRepo>()),
  );

  sl.registerFactory<HomeCubit>(
        () => HomeCubit(sl<GetSubjectsUseCase>()),
  );
}
