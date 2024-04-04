import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/checkout/checkout_controller.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';
import 'package:restaurant_mobile/view/widgets/checkout/custom_product_checkout.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_animated_switcher.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_back_button.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_loading_button.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckOutController());
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.checkout),
          leading: const CustomBackButton(),
        ),
        bottomNavigationBar: GetBuilder<CheckOutController>(
            id: "checkoutButton",
            builder: (_) {
              return Container(
                height: 80.h,
                padding:
                    const EdgeInsets.only(left: 20, right: 20, bottom: 20).r,
                child: CustomAnimatedSwitcher(
                  condition: controller.statusRequest == StatusRequest.loading,
                  firstChild: CustomLoadingButton(
                    height: 80.h,
                  ),
                  secondChild: CustomButton(
                    height: 80.h,
                    width: double.maxFinite,
                    buttonColor: AppColors.secondColor,
                    onPressed: controller.onCheckout,
                    widget: Text(
                      AppLocalizations.of(context)!.checkout,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20).r,
          children: [
            Text(
              AppLocalizations.of(context)!.shoppingCart,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
            const Divider(),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.order.orderItems!.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                return CustomProductCheckout(
                  orderItem: controller.order.orderItems![index],
                );
              },
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.total,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                  ),
                ),
                Text(
                  "${controller.order.totalPrice} DH",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
