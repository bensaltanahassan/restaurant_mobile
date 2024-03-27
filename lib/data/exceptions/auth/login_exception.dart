class LoginException {
  static String userNotFound = "User doesn't exist!";
  static String emailOrPasswordIncorrect = "Email or password are incorrect!";
  static String emailNotVerified = "Email not verified!";

  String handleException({required String message}) {
    if (message.toLowerCase().contains(userNotFound.toLowerCase())) {
      return userNotFound;
    } else if (message
        .toLowerCase()
        .contains(emailOrPasswordIncorrect.toLowerCase())) {
      return emailOrPasswordIncorrect;
    } else if (message.toLowerCase().contains(emailNotVerified.toLowerCase())) {
      return emailNotVerified;
    } else {
      return 'An error occurred, please try again later';
    }
  }
}
