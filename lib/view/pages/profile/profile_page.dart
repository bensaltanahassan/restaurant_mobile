import 'package:flutter/material.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Profile",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: AppColors.whiteColor,
            ),
            title: Text(
              "User Profile",
              style: TextStyle(
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
