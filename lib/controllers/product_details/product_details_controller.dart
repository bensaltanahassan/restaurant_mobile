import 'package:get/get.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/functions/handlingdatacontroller.dart';
import 'package:restaurant_mobile/core/functions/showsnackbar.dart';
import 'package:restaurant_mobile/core/services/services.dart';
import 'package:restaurant_mobile/data/datasource/remote/cart/cart_data.dart';
import 'package:restaurant_mobile/data/model/product_model.dart';
import 'package:restaurant_mobile/data/model/user_model.dart';

class ProductDetailsController extends GetxController {
  late ProductModel productModel;
  final Cartdata cd = Cartdata(Get.find());
  final MyServices sv = Get.find<MyServices>();
  late UserModel user;
  StatusRequest? statusRequest;
  int quantity = 1;
  double totalPrice = 0;

  Future<void> addToCart() async {
    statusRequest = StatusRequest.loading;
    update(["button"]);
    var response = await cd.postData(
      userId: user.id.toString(),
      productId: productModel.id.toString(),
      quantity: quantity,
      token: "token",
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      showCustomSnackBar(title: "Success", message: "Product added to cart");
      update(["button"]);
    } else {
      statusRequest = StatusRequest.serverfailure;
      update(["button"]);
    }
  }

  void increment() {
    quantity++;
    totalPrice = productModel.price! * quantity;
    update(["quantity"]);
  }

  void decrement() {
    if (quantity > 1) {
      quantity--;
      totalPrice = productModel.price! * quantity;
      update(["quantity"]);
    }
  }

  void initdata() {
    user = sv.user!;
    productModel = Get.arguments["product"];
    totalPrice = productModel.price!;
    update();
  }

  @override
  void onInit() {
    initdata();

    super.onInit();
  }
}
