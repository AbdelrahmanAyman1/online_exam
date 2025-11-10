import 'package:flutter/material.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/online_exam_app.dart';

void main() {
  configureDependencies();
  runApp(const OnlineExamApp());
}
