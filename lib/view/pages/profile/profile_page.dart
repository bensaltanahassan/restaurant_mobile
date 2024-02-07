import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Profile",
              style: TextStyle(
                fontSize: 30,
                height: 1,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              )),
          const SizedBox(height: 20),
          ListTile(
            //disable shap
            shape: const OutlineInputBorder(borderSide: BorderSide.none),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(AppImageAsset.hassan,
                  fit: BoxFit.cover, width: 60, height: 60),
            ),
            title: const Text("BENSALTANA HASSAN"),
            subtitle: const Text("Member since 2021"),
          ),
          const SizedBox(height: 40),
          ListTile(
            title: const Text("User Settings"),
            leading: const Icon(Icons.settings),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => controller.goToUserSettings(),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text("Change Password"),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => controller.goToChangePassword(),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text("Favorite"),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => controller.goToFavorite(),
          ),
          const SizedBox(height: 20),
          ListTile(
            title: const Text("Recent Orders"),
            leading: const Icon(Icons.shopping_cart),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => controller.goToRecentOrders(),
          ),
          const SizedBox(height: 20),
          ListTile(
            title: const Text("Notifications"),
            leading: const Icon(Icons.notifications),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => controller.goToNotifications(),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: controller.logout,
          ),
        ],
      ),
    );
  }
}
