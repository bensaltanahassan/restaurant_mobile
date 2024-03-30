import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/functions/showsnackbar.dart';
import 'package:restaurant_mobile/core/services/services.dart';

class UserSettingsController extends GetxController {
  late final TextEditingController fullNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  final ms = Get.find<MyServices>();
  File? image;

  @override
  void onInit() {
    fullNameController = TextEditingController(text: ms.user!.fullName!);
    emailController = TextEditingController(text: ms.user!.email!);
    phoneController = TextEditingController(text: ms.user!.phone!);
    super.onInit();
  }

  pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        image = File(pickedFile.path);
        update();
      } else {
        showCustomSnackBar(
            title: "Error", message: "Error while picking image");
      }
    } catch (_) {
      showCustomSnackBar(title: "Error", message: "Error while picking image");
    }
  }

  changePhoto(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (c) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Change Photo",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor),
              ),
              const Divider(),
              ListTile(
                textColor: AppColors.primaryColor,
                iconColor: AppColors.primaryColor,
                leading: const Icon(Icons.camera_alt_outlined, size: 32),
                title: const Text("Take Photo"),
                onTap: () {
                  pickImage(ImageSource.camera);
                },
              ),
              SizedBox(height: 10.h),
              ListTile(
                textColor: AppColors.primaryColor,
                iconColor: AppColors.primaryColor,
                leading: const Icon(Icons.photo, size: 32),
                title: const Text("Choose from Gallery"),
                onTap: () {
                  pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
