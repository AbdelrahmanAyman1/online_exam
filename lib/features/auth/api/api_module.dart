import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/auth/api/api_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class ApiModule {
  @singleton
  ApiClient provideApiClient() {
    return ApiClient(Dio(), baseUrl: "https://exam.elevateegy.com/api/v1/");
  }

  @singleton
  Dio provideDio(BaseOptions option, PrettyDioLogger logger) {
    var dio = Dio(option);

    dio.interceptors.add(logger);

    return dio;
  }

  @singleton
  BaseOptions providerOption() {
    return BaseOptions(
      sendTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
    );
  }

  @singleton
  PrettyDioLogger prvoideLogger() {
    return PrettyDioLogger(
      requestBody: true,
      request: true,
      responseBody: true,
      error: true,
    );
  }
}
