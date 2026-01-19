import 'package:equatable/equatable.dart';

class CustomError extends Equatable implements Exception {
  final String? message;
  final int? code;

  const CustomError(this.message, {this.code});

  @override
  List<Object?> get props => [message, code];
}

class ConnectionError extends CustomError {
  const ConnectionError(super.message, {super.code});
}

class ServerError extends CustomError {
  const ServerError(super.message, {super.code});
}

class UnKnownErrer extends CustomError {
  const UnKnownErrer(super.message, {super.code});
}
