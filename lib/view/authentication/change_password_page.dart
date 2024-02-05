import 'package:flutter/material.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/authentication/custom_text_formfield_auth.dart';
import 'package:restaurant_mobile/view/widgets/authentication/stack_auth.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StackAuth(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Row(
                children: [
                  Image.asset(
                    AppImageAsset.logo,
                    width: 200,
                    height: 200,
                  ),
                  const Expanded(
                    child: Text(
                      'Change Password!',
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
              const SizedBox(height: 20),
              const CustomTextFormFieldAuth(
                labelText: 'New Password',
                hintText: 'New Password',
                prefixIcon: Icons.lock,
                isPassword: true,
              ),
              const SizedBox(height: 20),
              const CustomTextFormFieldAuth(
                labelText: 'Confirm Password',
                hintText: 'Confirm Password',
                prefixIcon: Icons.lock,
                isPassword: true,
              ),
              const Spacer(),
              CustomButton(
                title: "Change Password",
                titleSize: 20,
                titleColor: Colors.white,
                buttonColor: AppColors.secondColor,
                fontWeight: FontWeight.bold,
                onPressed: () {},
                width: double.infinity,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
