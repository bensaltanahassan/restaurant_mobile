import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/constant/linkapi.dart';

class SettingsData {
  Crud crud;
  SettingsData(this.crud);

  updateUser({
    required String userId,
    required String fullName,
    required String phone,
    required String adress,
    File? image,
  }) async {
    var response = await crud.putData(
      linkUrl: "${AppLinks.updateUser}/$userId",
      data: dio.FormData.fromMap({
        "fullName": fullName,
        "phone": phone,
        "Address": adress,
        "file": image != null
            ? await dio.MultipartFile.fromFile(
                image.path,
                filename: image.path.split("/").last,
              )
            : null,
      }),
    );
    return response.fold((l) => l, (r) => r);
  }

  changeEmail(String email, String newEmail, String password) async {
    var response = await crud.putData(linkUrl: AppLinks.changeEmail, data: {
      "user_email": email,
      "user_newemail": newEmail,
      "user_password": password,
    });
    return response.fold((l) => l, (r) => r);
  }

  changePhone(String userId, String newPhone, String password) async {
    var response = await crud.putData(
      linkUrl: AppLinks.changePhone,
      data: {
        "user_id": userId,
        "user_newphone": newPhone,
        "user_password": password,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  changePassword(String userId, String password, String newPassword) async {
    var response = await crud.putData(
      linkUrl: AppLinks.changePassword,
      data: {
        "user_id": userId,
        "user_password": password,
        "user_newpassword": newPassword,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteAccount(String userId, String password) async {
    var response = await crud.deleteData(
        linkUrl: AppLinks.deleteAccount,
        data: {
          "user_id": userId,
          "user_password": password,
        },
        token: "");
    return response.fold((l) => l, (r) => r);
  }
}
