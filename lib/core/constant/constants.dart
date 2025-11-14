bool isUserLoggedIn = false;

class SharedKeys {
  static const String userToken = 'userToken';
}

abstract class EndPoints {
  static const String signUp = 'auth/signup';
  static const String signIn = 'auth/signin';
  static const String forgetPassword = 'auth/forgotPassword';
  static const String verifyResetCode = 'auth/verifyResetCode';
  static const String resetPassword = 'auth/resetPassword';

  // Exams & Questions EndPoints
  static const String getQuestions = 'questions';
  static const String questionCheck = 'questions/check';
}
