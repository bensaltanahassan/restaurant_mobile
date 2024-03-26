class ProductModel {
  int? id;
  String? name;
  String? nameAn;
  String? description;
  String? descriptionAn;
  double? price;
  int? discount;
  int? nbrOfSales;
  bool? isAvailable;
  int? categoryId;
  Category? category;
  String? createdAt;
  String? updatedAt;
  List<ProductImages>? productImages;

  ProductModel(
      {this.id,
      this.name,
      this.nameAn,
      this.description,
      this.descriptionAn,
      this.price,
      this.discount,
      this.nbrOfSales,
      this.isAvailable,
      this.categoryId,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.productImages});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAn = json['nameAn'];
    description = json['description'];
    descriptionAn = json['descriptionAn'];
    price = json['price'] is int ? json['price'].toDouble() : json['price'];
    discount = json['discount'];
    nbrOfSales = json['nbrOfSales'];
    isAvailable = json['isAvailable'];
    categoryId = json['categoryId'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['productImages'] != null) {
      productImages = <ProductImages>[];
      json['productImages'].forEach((v) {
        productImages!.add(ProductImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['nameAn'] = nameAn;
    data['description'] = description;
    data['descriptionAn'] = descriptionAn;
    data['price'] = price;
    data['discount'] = discount;
    data['nbrOfSales'] = nbrOfSales;
    data['isAvailable'] = isAvailable;
    data['categoryId'] = categoryId;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (productImages != null) {
      data['productImages'] = productImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? nameAn;

  Category({this.id, this.name, this.nameAn});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAn = json['nameAn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['nameAn'] = nameAn;
    return data;
  }
}

class ProductImages {
  int? id;
  Image? image;
  bool? isMain;

  ProductImages({this.id, this.image, this.isMain});

  ProductImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    isMain = json['isMain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['isMain'] = isMain;
    return data;
  }
}

class Image {
  int? id;
  String? publicId;
  String? url;
  String? createdAt;
  String? updatedAt;

  Image({this.id, this.publicId, this.url, this.createdAt, this.updatedAt});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    publicId = json['publicId'];
    url = json['url'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['publicId'] = publicId;
    data['url'] = url;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
