import 'package:restaurant_mobile/data/model/categoriesmodel.dart';

class GetCategoriesResponse {
  bool? status;
  List<CategoryModel>? categories;

  GetCategoriesResponse({this.status, this.categories});

  GetCategoriesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['categories'] != null) {
      categories = <CategoryModel>[];
      json['categories'].forEach((v) {
        categories!.add(CategoryModel.fromJson(v));
      });
    }
  }
}
