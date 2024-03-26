import 'package:restaurant_mobile/data/model/product_model.dart';

class FavorisModel {
  int? id;
  int? productId;
  String? createdAt;
  ProductModel? product;

  FavorisModel({this.id, this.productId, this.createdAt, this.product});

  FavorisModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    createdAt = json['createdAt'];
    product =
        json['product'] != null ? ProductModel.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productId'] = productId;
    data['createdAt'] = createdAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}
