import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/authentication/register_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/authentication/custom_text_formfield_auth.dart';
import 'package:restaurant_mobile/view/widgets/authentication/stack_auth.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
      body: StackAuth(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 10,
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.formState,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AppImageAsset.logo,
                              width: 200,
                              height: 200,
                            ),
                            const Text(
                              'Welcome!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const CustomTextFormFieldAuth(
                          hintText: 'First Name',
                          labelText: 'First Name',
                          prefixIcon: Icons.person,
                        ),
                        const SizedBox(height: 20),
                        const CustomTextFormFieldAuth(
                          hintText: 'Last Name',
                          labelText: 'Last Name',
                          prefixIcon: Icons.person,
                        ),
                        const SizedBox(height: 20),
                        const CustomTextFormFieldAuth(
                          hintText: 'Email',
                          labelText: 'Email',
                          prefixIcon: Icons.email,
                        ),
                        const SizedBox(height: 20),
                        const CustomTextFormFieldAuth(
                          hintText: 'Password',
                          labelText: 'Password',
                          prefixIcon: Icons.lock,
                          isPassword: true,
                        ),
                        const SizedBox(height: 20),
                        const CustomTextFormFieldAuth(
                          hintText: 'Confirm Password',
                          labelText: 'Confirm Password',
                          prefixIcon: Icons.lock,
                          isPassword: true,
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          title: "Register",
                          titleSize: 20,
                          titleColor: Colors.white,
                          buttonColor: AppColors.secondColor,
                          fontWeight: FontWeight.bold,
                          onPressed: () {},
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                        onPressed: controller.goToLoginPage,
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: AppColors.secondColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
