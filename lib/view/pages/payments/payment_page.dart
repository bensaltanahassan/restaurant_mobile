import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/payment/payment_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

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
          onPressed: () {},
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
                "\$ 200.00",
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
        leading: Container(
          margin: const EdgeInsets.only(left: 10).r,
          child: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.only(left: 10).r,
            ),
            child: const Center(
                child:
                    Icon(Icons.arrow_back_ios, color: AppColors.secondColor)),
          ),
        ),
      ),
      body: Padding(
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
            ListTileSettings(
              title: "137 Tnine Ghiate , Safi , Marrakech-Safi, Morocco",
              buttonText: "Change",
              onPressed: () {},
            ),
            SizedBox(height: 10.h),
            Text(
              "Phone number",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
            ListTileSettings(
              title: "+212698989898",
              buttonText: "Change",
              onPressed: () {},
            ),
            SizedBox(height: 10.h),
            Text(
              "Payment Method",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(
              height: 150.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const ChoicePaymentMethode(
                    title: "Credit Card",
                    icon: Icons.credit_card,
                    isSelected: true,
                  ),
                  SizedBox(width: 20.w),
                  const ChoicePaymentMethode(
                    title: "Cash",
                    icon: Icons.money,
                    isSelected: false,
                  ),
                  SizedBox(width: 20.w),
                  const ChoicePaymentMethode(
                    title: "Paypal",
                    icon: Icons.paypal,
                    isSelected: false,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Container(
                  padding: const EdgeInsets.all(10).r,
                  decoration: BoxDecoration(
                    color: AppColors.greyColor,
                    borderRadius: BorderRadius.circular(10),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10).r,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10).r,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChoicePaymentMethode extends StatelessWidget {
  const ChoicePaymentMethode({
    super.key,
    required this.title,
    this.onPressed,
    required this.icon,
    required this.isSelected,
  });

  final String title;
  final void Function()? onPressed;
  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20).r,
      height: 150.h,
      width: 150.w,
      decoration: BoxDecoration(
          color: isSelected ? AppColors.secondColor : AppColors.greyColor,
          borderRadius: BorderRadius.circular(10).r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10).r,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.greyColor.withOpacity(.4)
                  : AppColors.primaryColor.withOpacity(.15),
              borderRadius: BorderRadius.circular(10).r,
            ),
            child: Icon(
              icon,
              color:
                  isSelected ? AppColors.primaryColor : AppColors.secondColor,
              size: 40.r,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color:
                  isSelected ? AppColors.primaryColor : AppColors.secondColor,
            ),
          ),
        ],
      ),
    );
  }
}

class ListTileSettings extends StatelessWidget {
  const ListTileSettings({
    super.key,
    required this.title,
    this.onPressed,
    required this.buttonText,
  });

  final String title;
  final void Function()? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold),
      ),
      trailing: TextButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            color: AppColors.secondColor,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
