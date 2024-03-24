import 'package:restaurant_mobile/data/model/image_model.dart';

class UserModel {
  int? id;
  String? email;
  String? fullName;
  String? phone;
  String? address;
  String? password;
  bool? isVerified;
  String? createdAt;
  String? updatedAt;
  int? imageId;
  ImageModel? image;
  String? token;

  UserModel(
      {this.id,
      this.email,
      this.fullName,
      this.phone,
      this.address,
      this.password,
      this.isVerified,
      this.createdAt,
      this.updatedAt,
      this.imageId,
      this.image,
      this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    fullName = json['fullName'];
    phone = json['phone'];
    address = json['address'];
    password = json['password'];
    isVerified = json['isVerified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    imageId = json['imageId'];
    image = json['image'] != null ? ImageModel.fromJson(json['image']) : null;
    token = json['token'];
  }
}
