import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/functions/handlingdatacontroller.dart';
import 'package:restaurant_mobile/core/functions/showsnackbar.dart';
import 'package:restaurant_mobile/core/services/services.dart';
import 'package:restaurant_mobile/data/datasource/remote/settings/settings_data.dart';
import 'package:restaurant_mobile/data/model/responses/update_user_response.dart';

class UserSettingsController extends GetxController {
  StatusRequest? statusRequest;
  late final TextEditingController fullNameController;
  late final TextEditingController adressController;
  late final TextEditingController phoneController;
  final ms = Get.find<MyServices>();
  final SettingsData st = SettingsData(Get.find<Crud>());
  File? image;

  Future<void> updateUser() async {
    statusRequest = StatusRequest.loading;
    update(["updateButton"]);
    final response = await st.updateUser(
      userId: ms.user!.id.toString(),
      fullName: fullNameController.text,
      phone: phoneController.text,
      adress: adressController.text,
      image: image,
    );
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      UpdateUserResponse updateUserResponse =
          UpdateUserResponse.fromJson(response);
      if (updateUserResponse.status == true) {
        ms.user?.address = updateUserResponse.user?.address ?? ms.user?.address;
        ms.user?.phone = updateUserResponse.user?.phone ?? ms.user?.phone;
        ms.user?.fullName =
            updateUserResponse.user?.fullName ?? ms.user?.fullName;
        ms.user?.image = updateUserResponse.user?.image ?? ms.user?.image;

        await ms.saveUser(ms.user!);
        Get.appUpdate();

        showCustomSnackBar(
          title: "Success",
          message: "Updates with success",
        );
      } else {
        showCustomSnackBar(
            title: "Error", message: "Error occured while update user");
      }
    } else {
      showCustomSnackBar(
          title: "Error", message: "Error occured while update user");
    }
    update(["updateButton"]);
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        image = File(pickedFile.path);
        update(["image"]);
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
  void onInit() {
    fullNameController = TextEditingController(text: ms.user!.fullName!);
    adressController = TextEditingController(text: ms.user?.address ?? "");
    phoneController = TextEditingController(text: ms.user!.phone!);
    super.onInit();
  }

  @override
  void onClose() {
    fullNameController.dispose();
    adressController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
