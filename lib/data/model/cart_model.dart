import 'package:restaurant_mobile/data/model/product_model.dart';
import 'package:restaurant_mobile/data/model/user_model.dart';

class CartModel {
  String? cartId;
  UserModel? user;
  ProductModel? product;
  int? quantity;
  String? orderId;
  int? version;

  CartModel({this.cartId, this.user, this.product, this.version});

  CartModel.fromJson(Map<String, dynamic> json) {
    cartId = json['_id'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    product =
        json['product'] != null ? ProductModel.fromJson(json['product']) : null;
    quantity = json['quantity'];
    orderId = json['order'];
    version = json['__v'];
  }
}
