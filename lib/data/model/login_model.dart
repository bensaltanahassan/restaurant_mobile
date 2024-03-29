import 'package:restaurant_mobile/data/model/user_model.dart';

class LoginModel {
  bool? status;
  String? message;
  Data? data;

  LoginModel({this.status, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? token;
  String? expiration;
  UserModel? user;

  Data({this.token, this.expiration, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiration = json['expiration'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }
}
