import 'package:restaurant_mobile/data/model/user_model.dart';

class LoginModel {
  String? status;
  String? token;
  String? expiration;
  UserModel? user;

  LoginModel({this.status, this.token, this.expiration, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    expiration = json['expiration'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }
}
