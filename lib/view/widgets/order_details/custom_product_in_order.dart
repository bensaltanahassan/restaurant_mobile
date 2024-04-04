import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/localization/changelocal.dart';
import 'package:restaurant_mobile/data/model/ordersmodel.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_network_image.dart';

class CustomProductInOrder extends StatelessWidget {
  const CustomProductInOrder({
    super.key,
    required this.orderItem,
    this.onTap,
  });

  final OrderItems orderItem;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isEnglish = Get.find<LocaleController>().isEnglish;

    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).r),
      textColor: AppColors.whiteColor,
      leading: SizedBox(
        height: 60.h,
        width: 60.w,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10).r,
            child: Hero(
              tag:
                  orderItem.product?.productImages?.first.image?.publicId ?? "",
              child: CustomNetworkImage(
                  imageUrl: orderItem.product?.productImages?.first.image?.url),
            )),
      ),
      title: Text(
        isEnglish ? orderItem.product!.nameAn! : orderItem.product!.name!,
        maxLines: 1,
      ),
      subtitle: Text("${orderItem.product!.price!.toStringAsFixed(2)} DH",
          style: TextStyle(fontSize: 16.sp, color: AppColors.greyColor)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
              (orderItem.product!.price! * orderItem.quantity!)
                  .toStringAsFixed(2),
              style: TextStyle(fontSize: 16.sp)),
          Text("x${orderItem.quantity}",
              style: TextStyle(fontSize: 16.sp, color: AppColors.greyColor)),
        ],
      ),
    );
  }
}
