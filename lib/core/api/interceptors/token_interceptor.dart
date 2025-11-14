import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:online_exam/core/constant/constants.dart';
import 'package:online_exam/core/helper/secure_storage.dart';

class TokenInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final token = await SecureStorage().read(SharedKeys.userToken);
      if (token != null && token.isNotEmpty) {
        options.headers['token'] = token;
      }
    } catch (e) {
      log(e.toString());
    }
    super.onRequest(options, handler);
  }
}
