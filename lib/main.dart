

import 'package:flutter/material.dart';

import 'features/auth/di.dart';
import 'online_exam_app.dart';

void main() {
  configureDependencies();
  runApp(const OnlineExamApp() as Widget);
}
