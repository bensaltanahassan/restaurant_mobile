import 'package:restaurant_mobile/data/model/ordersmodel.dart';

class GetOrderDetailsResponse {
  bool? status;
  OrderModel? order;

  GetOrderDetailsResponse({this.status, this.order});

  GetOrderDetailsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    order = json['order'] != null ? OrderModel.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (order != null) {
      data['order'] = order!.toJson();
    }
    return data;
  }
}
