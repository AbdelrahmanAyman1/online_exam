import 'package:flutter/material.dart';
import 'package:online_exam/features/auth/di.dart';
import 'package:online_exam/online_exam_app.dart';

void main() {
  configureDependencies();
  runApp(const OnlineExamApp());
}
