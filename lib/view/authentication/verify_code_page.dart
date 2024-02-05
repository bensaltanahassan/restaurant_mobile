import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/authentication/stack_auth.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class VerifyCodePage extends StatelessWidget {
  const VerifyCodePage({super.key});

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
                      'Verify Code',
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
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter the code sent to your email xxxx@yyyy.com',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Pinput(
                length: 5,
                onCompleted: (pin) {},
                defaultPinTheme: const PinTheme(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.secondColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 2),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                  onPressed: () {},
                  child: const Text('Resend Code',
                      style: TextStyle(
                        color: AppColors.secondColor,
                        fontSize: 18,
                      ))),
              const Spacer(),
              CustomButton(
                title: "Verify Code",
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
