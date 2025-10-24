sealed class Result<T> {
  const Result();

  // Static factories لتصنع Success/Failure بنفس الطريقة اللي كودك بيتوقعها
  static Success<T> success<T>(T data) => Success<T>(data);
  static Failure<T> failure<T>(Exception exception) => Failure<T>(exception);

  // when method للتعامل السكيني
  R when<R>({
    required R Function(T data) success,
    required R Function(Exception exception) failure,
  }) {
    if (this is Success<T>) {
      return success((this as Success<T>).data);
    } else if (this is Failure<T>) {
      return failure((this as Failure<T>).exception);
    } else {
      throw Exception('Invalid Result type');
    }
  }
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends Result<T> {
  final Exception exception;
  const Failure(this.exception);
}
