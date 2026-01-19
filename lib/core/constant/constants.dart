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
  static const String exam = 'exams';
  static const String subject = 'subjects';
  static const String getProfileInfo = 'auth/profileData';
  static const String editProfileInfo = 'auth/editProfile';
  static const String changePassword = 'auth/changePassword';
  static const String getQuestions = 'questions';
  static const String questionCheck = 'questions/check';
}
