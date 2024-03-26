import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/payment/payment_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/enums/payment_methodes.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';
import 'package:restaurant_mobile/view/widgets/payment/list_tile_setting.dart';
import 'package:restaurant_mobile/view/widgets/payment/payment_methode_card.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_back_button.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaymentController());
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20).r,
        child: CustomButton(
          buttonColor: AppColors.secondColor,
          onPressed: controller.goToCheckoutPage,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Continue",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\$ ${controller.order.totalPrice}",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Payment Method'),
        leading: const CustomBackButton(),
      ),
      body: GetBuilder<PaymentController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Adress",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
              ),
              GetBuilder<PaymentController>(
                  id: "adress",
                  builder: (context) {
                    return ListTileSettings(
                      title: controller.order.adress ?? "No address",
                      buttonText: "Change",
                      onPressed: controller.changeAddress,
                    );
                  }),
              SizedBox(height: 10.h),
              Text(
                "Phone number",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
              ),
              GetBuilder<PaymentController>(
                  id: "phone",
                  builder: (context) {
                    return ListTileSettings(
                      title: controller.order.phoneNumber ?? "No phone",
                      buttonText: "Change",
                      onPressed: controller.changePhone,
                    );
                  }),
              SizedBox(height: 10.h),
              Text(
                "Payment Method",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
              ),
              GetBuilder<PaymentController>(
                  id: "paymentMethod",
                  builder: (controller) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 150.h,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ChoicePaymentMethode(
                                onPressed: () => controller.changePaymentMethod(
                                    PaymentMethodes.creditCard),
                                id: 'creditCard',
                                title: "Credit Card",
                                icon: Icons.credit_card,
                                isSelected: controller.paymentMethod ==
                                    PaymentMethodes.creditCard,
                              ),
                              SizedBox(width: 20.w),
                              ChoicePaymentMethode(
                                onPressed: () => controller.changePaymentMethod(
                                    PaymentMethodes.cashOnDelivery),
                                id: 'cash',
                                title: "Cash",
                                icon: Icons.money,
                                isSelected: controller.paymentMethod ==
                                    PaymentMethodes.cashOnDelivery,
                              ),
                              SizedBox(width: 20.w),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: controller.paymentMethod ==
                              PaymentMethodes.creditCard,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 20.h),
                              ElevatedButton.icon(
                                onPressed: () =>
                                    controller.addNewCard(context: context),
                                icon: Container(
                                    padding: const EdgeInsets.all(10).r,
                                    decoration: BoxDecoration(
                                      color: AppColors.greyColor,
                                      borderRadius: BorderRadius.circular(10).r,
                                    ),
                                    child: const Icon(Icons.add)),
                                label: Text(
                                  "Add New Card",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(double.maxFinite, 65.h),
                                  backgroundColor: AppColors.secondColor,
                                  padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10)
                                      .r,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10).r,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }),
            ],
          ),
        );
      }),
    );
  }
}
