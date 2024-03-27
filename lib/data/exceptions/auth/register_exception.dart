class RegisterException {
  static String userAlredyExist = 'User already exists!';
  String handleException({required String message}) {
    if (message.toLowerCase().contains(userAlredyExist.toLowerCase())) {
      return userAlredyExist;
    }
    return 'An error occurred, please try again later';
  }
}
