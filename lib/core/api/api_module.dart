import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_client.dart';
import 'package:online_exam/core/api/interceptors/token_interceptor.dart';
import 'package:online_exam/core/constant/env.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class ApiModule {
  @lazySingleton
  ApiClient provideApiClient(Dio dio) {
    return ApiClient(dio, baseUrl: Env.baseUrl);
  }

  @lazySingleton
  Dio provideDio(BaseOptions option, PrettyDioLogger logger) {
    var dio = Dio(option);
    dio.interceptors.add(logger);
    dio.interceptors.add(TokenInterceptor());
    return dio;
  }

  @lazySingleton
  BaseOptions providerOption() {
    return BaseOptions(
      baseUrl: Env.baseUrl,
      sendTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
    );
  }

  @lazySingleton
  PrettyDioLogger prvoideLogger() {
    return PrettyDioLogger(
      requestBody: true,
      request: true,
      responseBody: true,
      error: true,
      requestHeader: true,
      responseHeader: false,
    );
  }
}
