import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/constant/linkapi.dart';

class Ordersdata {
  Crud crud;
  Ordersdata(this.crud);
  getAllOrders({required String userId, required String token}) async {
    var response =
        await crud.getData(linkUrl: '${AppLinks.orders}/$userId', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
