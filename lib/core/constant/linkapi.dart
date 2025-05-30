class AppLinks {
  // server
  static const String server = "http://10.0.2.2:5241/api";
  // static const String server = "http://localhost:5241/api";
  //=============Auth==============
  static const String userAuth = "$server/UserAuth";
  static const String register = "$userAuth/register";
  static const String login = "$userAuth/login";
  static const String verifycodesignup = "$server/auth/verifycode";
  static const String sendVerificationCode = "$server/auth/sendverifycode";

  //=============Password============
  static const String forgetpassword = "$server/auth/forgetpassword";
  static const String verifycodeforgetpassword = "$server/auth/verifycode";
  static const String resetpassword = "$userAuth/resetpassword";

  //=============Home============
  static const String home = "$server/home/mobile";

  //=============Categories============
  static const String categories = "$server/categories";

  //=============Products=================
  static const String products = "$server/product";

  //=============Search Products=================
  static const String search = "$products/SearchProduct";

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
  static const String updateUser = "$server/User/updateUser";
  //=============Booking=================
  static const String reservation = "$server/reservation";
}
