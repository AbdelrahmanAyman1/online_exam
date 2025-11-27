import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/core/error/handle_exception%20.dart';

Future<Result<T>> executeApi<T>(Future<T> Function() callApi) async {
  try {
    var result = await callApi.call();
    return Success(result);
  } on Exception catch (e) {
    return Failure(HandleException.handleMessageError(e));
  }
}
