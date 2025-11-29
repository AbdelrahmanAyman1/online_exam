import 'package:equatable/equatable.dart';

enum StateType { initial, loading, success, failure }

class StateBox<T> extends Equatable {
  final StateType stateType;
  final String? errorMessage;
  final T? data;
  const StateBox({required this.stateType, this.errorMessage, this.data});
  const StateBox.initial() : this(stateType: StateType.initial);
  const StateBox.loading() : this(stateType: StateType.loading);
  const StateBox.success({required T data})
    : this(stateType: StateType.success, data: data);
  const StateBox.successWithoutData() : this(stateType: StateType.success);
  const StateBox.failure({String? errorMessage})
    : this(stateType: StateType.failure, errorMessage: errorMessage);

  bool get isLoading => stateType == StateType.loading;
  bool get isSuccess => stateType == StateType.success;
  bool get isFailure => stateType == StateType.failure;
  bool get isInitial => stateType == StateType.initial;

  @override
  List<Object?> get props => [stateType, errorMessage, data];
}
