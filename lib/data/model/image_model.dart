class ImageModel {
  int? id;
  String? publicId;
  String? url;
  String? createdAt;
  String? updatedAt;

  ImageModel(
      {this.id, this.publicId, this.url, this.createdAt, this.updatedAt});

  ImageModel.fromJson(Map<String, dynamic> json) {
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
