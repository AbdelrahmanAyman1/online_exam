import "package:dio/dio.dart";
import "package:online_exam/core/error/custom_error.dart";

class HandleException {
  static CustomError handleMessageError(Exception e) {
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return ConnectionError(e.message);
        case DioExceptionType.sendTimeout:
          return ConnectionError(e.message);
        case DioExceptionType.receiveTimeout:
          return ConnectionError(e.message);
        case DioExceptionType.badCertificate:
          return ConnectionError(e.message);
        case DioExceptionType.badResponse:
          return ServerError(
            e.response?.data['message'] ?? "Something went wrong",
            code: e.response?.statusCode,
          );
        case DioExceptionType.cancel:
          return ConnectionError(e.message);
        case DioExceptionType.connectionError:
          return ConnectionError(e.message);
        case DioExceptionType.unknown:
          return UnKnownErrer(e.message);
      }
    }
    return UnKnownErrer(e.toString());
  }

  static UnKnownErrer handleCatchError(Object e) {
    return UnKnownErrer(e.toString());
  }
}
