import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/constant/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postData(String email, String password) async {
    var response = await crud.postData(linkUrl: AppLinks.login, data: {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }

  sendVerificationCode(String id) async {
    var response =
        await crud.postData(linkUrl: AppLinks.sendVerificationCode, data: {
      "user_id": id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
