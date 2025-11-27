sealed class BaseState<T> {}

class IdleState<T> extends BaseState<T> {}

class SuccessState<T> extends BaseState<T> {
  T data;
  SuccessState(this.data);
}

class FailureState<T> extends BaseState<T> {
  String message;
  FailureState(this.message);
}

class LoadingState<T> extends BaseState<T> {}
