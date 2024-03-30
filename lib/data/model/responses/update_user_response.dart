import 'package:restaurant_mobile/data/model/user_model.dart';

class UpdateUserResponse {
  bool? status;
  String? message;
  UserModel? user;

  UpdateUserResponse({this.status, this.message, this.user});

  UpdateUserResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }
}
