import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/authentication/login_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/authentication/custom_text_formfield_auth.dart';
import 'package:restaurant_mobile/view/widgets/authentication/stack_auth.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return StackAuth(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor.withOpacity(.01),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t have an account?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                  onPressed: controller.goToRegisterPage,
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: AppColors.secondColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: controller.formState,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Row(
                    children: [
                      Image.asset(
                        AppImageAsset.logo,
                        width: 200,
                        height: 200,
                      ),
                      const Expanded(
                        child: Text(
                          'Welcome Back!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const CustomTextFormFieldAuth(
                    hintText: 'Email',
                    labelText: 'Email',
                    prefixIcon: Icons.email,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormFieldAuth(
                    hintText: 'Password',
                    labelText: 'Password',
                    prefixIcon: Icons.lock,
                    isPassword: true,
                    suffixIcon: IconButton(
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.only(right: 10),
                          ),
                        ),
                        onPressed: () {},
                        icon: 1 == 1
                            ? const Icon(Icons.visibility, color: Colors.white)
                            : const Icon(Icons.visibility_off,
                                color: Colors.white)),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    title: "Login",
                    titleSize: 20,
                    titleColor: Colors.white,
                    buttonColor: AppColors.secondColor,
                    fontWeight: FontWeight.bold,
                    onPressed: controller.login,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: controller.goToForgetPasswordPage,
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
