import 'package:online_exam/core/utils/result.dart';

Future<Result<T>> excuteApi<T>(Future<T> Function() callApi) async {
  try {
    var result = await callApi.call();
    return Success(result);
  } on Exception catch (e) {
    return Failure(e);
  }
}
