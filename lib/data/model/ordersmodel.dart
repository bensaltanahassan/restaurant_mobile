import 'package:restaurant_mobile/data/model/product_model.dart';

class OrderModel {
  int? id;
  int? userId;
  double? totalPrice;
  String? adress;
  String? phoneNumber;
  String? paymentMethod;
  String? paymentStatus;
  String? orderStatus;
  String? createdAt;
  String? updatedAt;
  List<OrderItems>? orderItems;

  OrderModel(
      {this.id,
      required this.totalPrice,
      required this.adress,
      required this.userId,
      required this.phoneNumber,
      this.paymentMethod,
      this.paymentStatus,
      this.orderStatus,
      this.createdAt,
      this.updatedAt,
      this.orderItems});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    totalPrice = json['totalPrice'];
    adress = json['adress'];
    phoneNumber = json['phoneNumber'];
    paymentMethod = json['paymentMethod'];
    paymentStatus = json['paymentStatus'];
    orderStatus = json['orderStatus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['orderItems'] != null) {
      orderItems = <OrderItems>[];
      json['orderItems'].forEach((v) {
        orderItems!.add(OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['totalPrice'] = totalPrice;
    data['adress'] = adress;
    data['phoneNumber'] = phoneNumber;
    data['paymentMethod'] = paymentMethod;
    data['paymentStatus'] = paymentStatus;
    data['orderStatus'] = orderStatus;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (orderItems != null) {
      data['orderItems'] = orderItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderItems {
  int? id;
  int? quantity;
  int? orderId;
  ProductModel? product;
  String? createdAt;
  String? updatedAt;

  OrderItems(
      {this.id,
      this.quantity,
      this.product,
      this.createdAt,
      this.updatedAt,
      this.orderId});

  OrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    orderId = json['orderId'];
    product =
        json['product'] != null ? ProductModel.fromJson(json['product']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['orderId'] = orderId;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
