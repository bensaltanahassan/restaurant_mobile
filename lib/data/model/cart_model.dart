import 'package:restaurant_mobile/data/model/product_model.dart';

class CartModel {
  int? id;
  int? quantity;
  ProductModel? product;
  String? createdAt;
  String? updatedAt;

  CartModel(
      {this.id, this.quantity, this.product, this.createdAt, this.updatedAt});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product =
        json['product'] != null ? ProductModel.fromJson(json['product']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
