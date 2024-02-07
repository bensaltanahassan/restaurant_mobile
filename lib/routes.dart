import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/view/authentication/change_password_page.dart';
import 'package:restaurant_mobile/view/authentication/forget_password_page.dart';
import 'package:restaurant_mobile/view/authentication/login_page.dart';
import 'package:restaurant_mobile/view/authentication/register_page.dart';
import 'package:restaurant_mobile/view/authentication/verify_code_page.dart';
import 'package:restaurant_mobile/view/pages/home/home_page.dart';
import 'package:restaurant_mobile/view/pages/products_category/products_category_page.dart';

class AppRouter {
  static final List<GetPage<dynamic>> routes = [
    // ================== Authentication ==================
    GetPage(name: AppRoutes.login, page: () => const LoginPage()),
    GetPage(name: AppRoutes.signUp, page: () => const RegisterPage()),
    GetPage(
        name: AppRoutes.forgetPassword, page: () => const ForgetPasswordPage()),
    GetPage(
        name: AppRoutes.verifycodeSignUp, page: () => const VerifyCodePage()),
    GetPage(
        name: AppRoutes.verifyCodeForgetPassword,
        page: () => const VerifyCodePage()),
    GetPage(
        name: AppRoutes.changePassword, page: () => const ChangePasswordPage()),
    // ================== Home ==================
    GetPage(name: AppRoutes.home, page: () => const ContainerPage()),
    GetPage(
        name: AppRoutes.productsCategory,
        page: () => const ProductsCategoryPage()),
  ];
}
