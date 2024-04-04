import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_mobile/controllers/profile/profile_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_network_image.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20).r,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.profile,
                style: TextStyle(
                  fontSize: 30.sp,
                  height: 1,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                )),
            SizedBox(height: 20.h),
            ListTile(
              shape: const OutlineInputBorder(borderSide: BorderSide.none),
              leading: SizedBox(
                width: 60.w,
                height: 60.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.r),
                  child: CustomNetworkImage(
                    imageUrl: controller.ms.user!.image?.url,
                    width: 60.w,
                    height: 60.h,
                  ),
                ),
              ),
              title: Text(controller.ms.user!.fullName ?? ""),
              subtitle: Text(
                AppLocalizations.of(context)!.memberSince(
                    " ${controller.ms.user!.createdAt != null ? dateFormat.format(DateTime.parse(controller.ms.user!.createdAt!)) : ""}"),
              ),
            ),
            SizedBox(height: 40.h),
            ListTile(
              title: Text(AppLocalizations.of(context)!.userSettings),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () => controller.goToUserSettings(),
            ),
            SizedBox(height: 20.h),
            ListTile(
              leading: const Icon(Icons.lock),
              title: Text(AppLocalizations.of(context)!.changePassword),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () => controller.goToChangePassword(),
            ),
            SizedBox(height: 20.h),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: Text(AppLocalizations.of(context)!.favorites),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () => controller.goToFavorite(),
            ),
            SizedBox(height: 20.h),
            ListTile(
              title: Text(AppLocalizations.of(context)!.recentOrders),
              leading: const Icon(Icons.shopping_cart),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () => controller.goToRecentOrders(),
            ),
            SizedBox(height: 20.h),
            ListTile(
              title: Text(AppLocalizations.of(context)!.notifications),
              leading: const Icon(Icons.notifications),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () => controller.goToNotifications(),
            ),
            SizedBox(height: 20.h),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text(AppLocalizations.of(context)!.logout),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: controller.logout,
            ),
            SizedBox(height: 40.h)
          ],
        ),
      ),
    );
  }
}
