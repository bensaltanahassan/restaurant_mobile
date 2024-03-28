import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/constant/linkapi.dart';

class RegisterData {
  Crud crud;
  RegisterData(this.crud);
  postData(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String adress}) async {
    var response = await crud.postData(linkUrl: AppLinks.register, data: {
      "fullName": "$firstName $lastName",
      "email": email,
      "phone": lastName,
      "password": password,
      "adress": adress
    });
    return response.fold((l) => l, (r) => r);
  }
}
