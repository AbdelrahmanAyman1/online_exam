class CustomError implements Exception {
  final String? message;
  final int? code;

  CustomError(this.message, {this.code});
}

class ConnectionError extends CustomError {
  ConnectionError(super.message, {super.code});
}

class ServerError extends CustomError {
  ServerError(super.message, {super.code});
}

class UnKnownErrer extends CustomError {
  UnKnownErrer(super.message, {super.code});
}
