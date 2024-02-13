import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/view/widgets/authentication/custom_text_formfield_auth.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class PaymentController extends GetxController {
  String paymentMethod = "creditCard";
  void changePaymentMethod(String newPaymentMethod) {
    paymentMethod = newPaymentMethod;
    update();
  }

  void changeAddress() {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))
            .r,
      ),
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: 0.5.sh,
            ),
            padding: const EdgeInsets.all(20).r,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ).r,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Enter your address",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Address",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                const CustomTextFormFieldAuth(
                  borderColor: AppColors.greyColor,
                  hintText: "Address",
                  fontColor: AppColors.greyColor,
                ),
                const Spacer(),
                CustomButton(
                  buttonColor: AppColors.primaryColor,
                  title: "Save",
                  onPressed: () {},
                  width: double.maxFinite,
                  titleColor: AppColors.whiteColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void changePhone() {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))
            .r,
      ),
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: 0.5.sh,
            ),
            padding: const EdgeInsets.all(20).r,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ).r,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Enter your phone number",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Phone Number",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                const CustomTextFormFieldAuth(
                  borderColor: AppColors.greyColor,
                  hintText: "Phone Number",
                  fontColor: AppColors.greyColor,
                ),
                const Spacer(),
                CustomButton(
                  buttonColor: AppColors.primaryColor,
                  title: "Save",
                  onPressed: () {},
                  width: double.maxFinite,
                  titleColor: AppColors.whiteColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void addNewCard({required BuildContext context}) async {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))
            .r,
      ),
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: 0.5.sh,
            ),
            padding: const EdgeInsets.all(20).r,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ).r,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Enter your card information",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Card Number",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                const CustomTextFormFieldAuth(
                  borderColor: AppColors.greyColor,
                  hintText: "Card Number",
                  fontColor: AppColors.greyColor,
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Expiration Date",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const CustomTextFormFieldAuth(
                            hintText: "MM/YY",
                            fontColor: AppColors.greyColor,
                            borderColor: AppColors.greyColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "CVV",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const CustomTextFormFieldAuth(
                            hintText: "CVV",
                            fontColor: AppColors.greyColor,
                            borderColor: AppColors.greyColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                CustomButton(
                  buttonColor: AppColors.primaryColor,
                  title: "Add Card",
                  onPressed: () {},
                  width: double.maxFinite,
                  titleColor: AppColors.whiteColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
