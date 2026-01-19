import 'package:online_exam/core/error/custom_error.dart';

sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T data;
  Success(this.data);
}

class Failure<T> extends Result<T> {
  final CustomError exception;
  Failure(this.exception);
}
