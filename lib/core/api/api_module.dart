import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_client.dart';
import 'package:online_exam/core/constant/constants.dart';
import 'package:online_exam/core/constant/env.dart';
import 'package:online_exam/core/helper/secure_storage.dart';
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

    return dio;
  }

  Future<String> get _headerToken async {
    String hToken = "";
    String? token = await SecureStorage().read(SharedKeys.userToken);
    if (token != null && token.isNotEmpty) {
      hToken = token;
      return hToken;
    } else {
      return hToken;
    }
  }

  @lazySingleton
  BaseOptions providerOption() {
    return BaseOptions(
      headers: {'token': _headerToken},
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
    );
  }
}
