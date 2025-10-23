sealed class Result<T>{}

class Success<T> extends Result<T>{
  final T data;
  Success(this.data);
}
class Failure<T> extends Result<T>{
  final Exception expection;
  Failure(this.expection);
}