import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/payment/checkout_page.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/core/middleware/mymiddleware.dart';
import 'package:restaurant_mobile/view/pages/authentication/change_password_page.dart';
import 'package:restaurant_mobile/view/pages/authentication/forget_password_page.dart';
import 'package:restaurant_mobile/view/pages/authentication/login_page.dart';
import 'package:restaurant_mobile/view/pages/authentication/register_page.dart';
import 'package:restaurant_mobile/view/pages/authentication/verify_code_page.dart';
import 'package:restaurant_mobile/view/pages/authentication/welcome_page.dart';
import 'package:restaurant_mobile/view/pages/booking/booking_page.dart';
import 'package:restaurant_mobile/view/pages/container/container_page.dart';
import 'package:restaurant_mobile/view/pages/languages/change_language_page.dart';
import 'package:restaurant_mobile/view/pages/notifications/notifications_page.dart';
import 'package:restaurant_mobile/view/pages/onboarding/introduction_page.dart';
import 'package:restaurant_mobile/view/pages/order_details/order_details_page.dart';
import 'package:restaurant_mobile/view/pages/orders/orders_page.dart';
import 'package:restaurant_mobile/view/pages/payments/payment_page.dart';
import 'package:restaurant_mobile/view/pages/product_details/product_details_page.dart';
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
    GetPage(name: AppRoutes.paymentPage, page: () => const PaymentPage()),
    GetPage(
        name: AppRoutes.notifications, page: () => const NotificationsPage()),
    GetPage(
        name: AppRoutes.productdetail, page: () => const ProductDetailsPage()),
    GetPage(name: AppRoutes.reservation, page: () => const BookingPage()),
    GetPage(name: AppRoutes.checkout, page: () => const CheckoutPage()),
    GetPage(
        name: AppRoutes.changeLanguage, page: () => const ChangeLanguagePage()),
  ];
}
