import 'package:restaurant_mobile/data/model/image_model.dart';

class CategoryModel {
  int? id;
  String? name;
  String? nameAn;
  String? createdAt;
  String? updatedAt;
  int? imageId;
  ImageModel? image;

  CategoryModel(
      {this.id,
      this.name,
      this.nameAn,
      this.createdAt,
      this.updatedAt,
      this.imageId,
      this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAn = json['nameAn'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    imageId = json['imageId'];
    image = json['image'] != null ? ImageModel.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['nameAn'] = nameAn;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['imageId'] = imageId;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}
