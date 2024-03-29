import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/cart/cart_controller.dart';
import 'package:restaurant_mobile/controllers/favoris/favoris_controller.dart';
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
    update(["addToCartButton"]);
    var response = await cd.postData(
      userId: user.id.toString(),
      productId: productModel.id.toString(),
      quantity: quantity,
      token: "token",
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      showCustomSnackBar(title: "Success", message: "Product added to cart");
      update(["addToCartButton"]);
      Get.find<CartController>().getAllProductsInCart();
    } else {
      statusRequest = StatusRequest.serverfailure;
      update(["addToCartButton"]);
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
    if (Get.isRegistered<FavorisController>()) {
      Get.find<FavorisController>();
    } else {
      Get.put(FavorisController(), permanent: true);
    }
    if (Get.isRegistered<CartController>()) {
      Get.find<CartController>();
    } else {
      Get.put(CartController(), permanent: true);
    }

    update();
  }

  @override
  void onInit() {
    initdata();

    super.onInit();
  }
}
