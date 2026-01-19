import 'package:flutter/material.dart';
import 'package:online_exam/core/constant/constants.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/helper/secure_storage.dart';
import 'package:online_exam/online_exam_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkUserIfLoggedIn();
  configureDependencies();

  runApp(const OnlineExamApp());
}

Future<void> checkUserIfLoggedIn() async {
  String? token = await SecureStorage().read(SharedKeys.userToken);
  if (token != null && token.isNotEmpty) {
    isUserLoggedIn = true;
  } else {
    isUserLoggedIn = false;
  }
}
