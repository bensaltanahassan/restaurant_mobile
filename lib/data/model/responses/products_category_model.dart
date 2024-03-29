import 'package:restaurant_mobile/data/model/product_model.dart';

class ProductsCategoryModel {
  bool? status;
  int? totalItems;
  int? currentPage;
  List<ProductModel>? products;

  ProductsCategoryModel(
      {this.status, this.totalItems, this.currentPage, this.products});

  ProductsCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalItems = json['totalItems'];
    currentPage = json['currentPage'];
    if (json['products'] != null) {
      products = <ProductModel>[];
      json['products'].forEach((v) {
        products!.add(ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalItems'] = totalItems;
    data['currentPage'] = currentPage;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
