import 'package:flutter/material.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
          const ListTile(
            title: Text("User Settings"),
            leading: Icon(Icons.settings),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          const SizedBox(height: 20),
          const ListTile(
            leading: Icon(Icons.lock),
            title: Text("Change Password"),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          const SizedBox(height: 20),
          const ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Favorite"),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          const SizedBox(height: 20),
          const ListTile(
            title: Text("Recent Orders"),
            leading: Icon(Icons.shopping_cart),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          const SizedBox(height: 20),
          const ListTile(
            title: Text("Notifications"),
            leading: Icon(Icons.notifications),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          const SizedBox(height: 20),
          const ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}
