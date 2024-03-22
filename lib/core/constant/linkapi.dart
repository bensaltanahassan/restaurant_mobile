class AppLinks {
  // server
  static const String server = "http://10.0.2.2:5241";
  //=============Auth==============
  static const String signup = "$server/auth/signup";
  static const String verifycodesignup = "$server/auth/verifycode";
  static const String login = "$server/auth/login";
  static const String sendVerificationCode = "$server/auth/sendverifycode";

  //=============Password============
  static const String forgetpassword = "$server/auth/forgetpassword";
  static const String verifycodeforgetpassword = "$server/auth/verifycode";
  static const String resetpassword = "$server/auth/resetpassword";

  //=============Home============
  static const String homepage = "$server/home";

  //=============Categories============
  static const String categories = "$server/categories";

  //=============Products=================
  static const String products = "$server/products";

  //=============Search Products=================
  static const String search = "$products/search";

  //=============Favoris=================
  static const String favoris = "$server/favorite";

  //=============Cart=================
  static const String cart = "$server/cart";

  //=============Orders=================
  static const String orders = "$server/orders";

  //=============checkout=================
  static const String checkout = "$server/checkout";

  //Settings
  static const String changeEmail = "$server/settings/changeemail";
  static const String changePhone = "$server/settings/changephone";
  static const String changePassword = "$server/settings/changepassword";
  static const String deleteAccount = "$server/settings/deleteaccount";
}
