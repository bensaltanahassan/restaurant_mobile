import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/authentication/welcome_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/authentication/stack_auth.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WelcomeController());
    return StackAuth(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor.withOpacity(.01),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImageAsset.logo, width: 200, height: 200),
                const Text(
                  'Restaurant Akhawayn',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Special & Delicious Food',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                CustomButton(
                  title: 'Log In',
                  titleColor: AppColors.whiteColor,
                  titleSize: 20,
                  buttonColor: AppColors.secondColor,
                  width: double.infinity,
                  height: 50,
                  fontWeight: FontWeight.bold,
                  onPressed: controller.goToLoginPage,
                ),
                const SizedBox(height: 10),
                CustomButton(
                  title: 'Sign Up',
                  titleColor: AppColors.secondColor,
                  titleSize: 20,
                  buttonColor: AppColors.whiteColor,
                  width: double.infinity,
                  height: 50,
                  fontWeight: FontWeight.bold,
                  onPressed: controller.goToRegisterPage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
