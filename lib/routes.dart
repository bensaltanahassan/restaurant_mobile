import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/core/middleware/mymiddleware.dart';
import 'package:restaurant_mobile/view/authentication/change_password_page.dart';
import 'package:restaurant_mobile/view/authentication/forget_password_page.dart';
import 'package:restaurant_mobile/view/authentication/login_page.dart';
import 'package:restaurant_mobile/view/authentication/register_page.dart';
import 'package:restaurant_mobile/view/authentication/verify_code_page.dart';
import 'package:restaurant_mobile/view/authentication/welcome_page.dart';
import 'package:restaurant_mobile/view/onboarding/introduction_page.dart';
import 'package:restaurant_mobile/view/pages/container/container_page.dart';
import 'package:restaurant_mobile/view/pages/orders/order_details_page.dart';
import 'package:restaurant_mobile/view/pages/orders/orders_page.dart';
import 'package:restaurant_mobile/view/pages/products_category/products_category_page.dart';
import 'package:restaurant_mobile/view/pages/user_settings/user_settings_page.dart';

class AppRouter {
  static final List<GetPage<dynamic>> routes = [
    // Language
    GetPage(
        name: "/",
        page: () => const IntroductionPage(),
        middlewares: [MyMiddleWare()]),
    // ================== Authentication ==================
    GetPage(name: AppRoutes.welcome, page: () => const WelcomePage()),
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
    GetPage(name: AppRoutes.containerPage, page: () => const ContainerPage()),
    GetPage(
        name: AppRoutes.productsCategory,
        page: () => const ProductsCategoryPage()),
    GetPage(name: AppRoutes.userSettings, page: () => const UserSettingsPage()),
    GetPage(name: AppRoutes.myOrders, page: () => const OrdersPage()),
    GetPage(name: AppRoutes.orderdetails, page: () => const OrderDetailsPage()),
  ];
}
