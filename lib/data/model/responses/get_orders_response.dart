import 'package:restaurant_mobile/data/model/ordersmodel.dart';

class GetOrdersResponse {
  bool? status;
  List<OrderModel>? orders;

  GetOrdersResponse({this.status, this.orders});

  GetOrdersResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['orders'] != null) {
      orders = <OrderModel>[];
      json['orders'].forEach((v) {
        orders!.add(OrderModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
