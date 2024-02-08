import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/profile/profile_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20).r,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Profile",
                style: TextStyle(
                  fontSize: 30.sp,
                  height: 1,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                )),
            SizedBox(height: 20.h),
            ListTile(
              //disable shap
              shape: const OutlineInputBorder(borderSide: BorderSide.none),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: Image.asset(AppImageAsset.hassan,
                    fit: BoxFit.cover, width: 60.w, height: 60.h),
              ),
              title: const Text("BENSALTANA HASSAN"),
              subtitle: const Text("Member since 2021"),
            ),
            SizedBox(height: 40.h),
            ListTile(
              title: const Text("User Settings"),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () => controller.goToUserSettings(),
            ),
            SizedBox(height: 20.h),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text("Change Password"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () => controller.goToChangePassword(),
            ),
            SizedBox(height: 20.h),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text("Favorite"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () => controller.goToFavorite(),
            ),
            SizedBox(height: 20.h),
            ListTile(
              title: const Text("Recent Orders"),
              leading: const Icon(Icons.shopping_cart),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () => controller.goToRecentOrders(),
            ),
            SizedBox(height: 20.h),
            ListTile(
              title: const Text("Notifications"),
              leading: const Icon(Icons.notifications),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () => controller.goToNotifications(),
            ),
            SizedBox(height: 20.h),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
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
