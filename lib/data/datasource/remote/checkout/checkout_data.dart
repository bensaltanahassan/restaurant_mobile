import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/constant/linkapi.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);
  checkOut(
      {required int userId,
      required double totalPrice,
      required String adress,
      required String phoneNumber,
      required String paymentMethod,
      required String paymentStatus,
      required String orderStatus,
      String? token}) async {
    var response = await crud.postData(
      linkUrl: "${AppLinks.checkout}/$userId",
      data: {
        "totalPrice": totalPrice,
        "adress": adress,
        "phoneNumber": phoneNumber,
        "paymentMethod": paymentMethod,
        "paymentStatus": paymentStatus,
        "orderStatus": orderStatus
      },
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }
}
