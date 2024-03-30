import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/notifications/notifications_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_back_button.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete_outline,
              color: AppColors.whiteColor,
            ),
          ),
        ],
        leading: const CustomBackButton(),
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: AppColors.greyColor,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            //disable shape
            shape: const RoundedRectangleBorder(),
            leading: const Icon(Icons.shopping_bag_outlined),
            title: Text('Notification $index'),
            trailing: Text("12:0$index PM"),
          );
        },
      ),
    );
  }
}
