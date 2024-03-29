import 'package:restaurant_mobile/data/model/categoriesmodel.dart';
import 'package:restaurant_mobile/data/model/product_model.dart';

class HomeModel {
  bool? status;
  List<Categories>? categories;
  List<ProductModel>? topProducts;

  HomeModel({this.status, this.categories, this.topProducts});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['topProducts'] != null) {
      topProducts = <ProductModel>[];
      json['topProducts'].forEach((v) {
        topProducts!.add(ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (topProducts != null) {
      data['topProducts'] = topProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  CategoryModel? category;
  List<ProductModel>? products;

  Categories({this.category, this.products});

  Categories.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
    if (json['products'] != null) {
      products = <ProductModel>[];
      json['products'].forEach((v) {
        products!.add(ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
