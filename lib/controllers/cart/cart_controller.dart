import 'package:get/get.dart';
import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/core/functions/handlingdatacontroller.dart';
import 'package:restaurant_mobile/core/functions/showsnackbar.dart';
import 'package:restaurant_mobile/core/services/services.dart';
import 'package:restaurant_mobile/data/datasource/remote/cart/cart_data.dart';
import 'package:restaurant_mobile/data/model/cart_model.dart';
import 'package:restaurant_mobile/data/model/ordersmodel.dart';
import 'package:restaurant_mobile/data/model/product_model.dart';

class CartController extends GetxController {
  StatusRequest? statusRequest;
  bool loadingButtons = false;
  double totalPrice = 0;
  Cartdata cd = Cartdata(Get.find<Crud>());
  MyServices sv = Get.find<MyServices>();
  List<CartModel> carts = [];
  void goToPaymentPage() {
    if (carts.isEmpty) {
      return;
    }
    OrderModel order = OrderModel(
      totalPrice: totalPrice,
      orderItems: carts
          .map((e) => OrderItems(
                product: e.product!,
                quantity: e.quantity,
              ))
          .toList(),
      adress: sv.user!.address!,
      phoneNumber: sv.user!.phone!,
    );

    Get.toNamed(AppRoutes.paymentPage, arguments: {"order": order});
  }

  void goToProductDetail({required ProductModel productModel}) {
    Get.toNamed(AppRoutes.productdetail, arguments: {"product": productModel});
  }

  Future<void> getAllProductsInCart() async {
    carts.clear();
    totalPrice = 0;
    statusRequest = StatusRequest.loading;
    update();
    var response = await cd.getData(
        userId: sv.user!.id!.toString(), token: sv.user!.token ?? "");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == true) {
        List<dynamic> data = response["cart"];
        for (var element in data) {
          carts.add(CartModel.fromJson(element as Map<String, dynamic>));
        }
        carts.sort((a, b) => DateTime.parse(a.createdAt!)
            .compareTo(DateTime.parse(b.createdAt!)));
        calculateTotalPrice();
        update();
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
      update();
    }
  }

  void calculateTotalPrice() {
    totalPrice = 0;
    for (var element in carts) {
      totalPrice += element.product!.price! * element.quantity!;
    }
    update(["totalPrice"]);
  }

  Future<void> delete(CartModel carte) async {
    statusRequest = StatusRequest.loading;
    update(["delete/${carte.id}"]);
    var response =
        await cd.deleteData(cartId: carte.id.toString(), token: "token");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      carts.remove(carte);
      calculateTotalPrice();
      update();
    } else {
      statusRequest = StatusRequest.serverfailure;
      update();
    }
  }

  Future<void> changeQuantity(
      {required int quantity, required CartModel cart}) async {
    if (quantity == -1 && cart.quantity == 1) {
      return;
    }
    statusRequest = StatusRequest.loading;
    var response = await cd.putData(
        cartId: cart.id.toString(), token: "token", quantity: quantity);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      cart.quantity = cart.quantity! + quantity;
      calculateTotalPrice();
      update(["quantity/${cart.id}"]);
    } else {
      statusRequest = StatusRequest.serverfailure;
      update();
    }
  }

  Future<void> addToCart({required String productId}) async {
    loadingButtons = true;
    update(["button/$productId"]);
    var response = await cd.postData(
      userId: sv.user!.id!.toString(),
      productId: productId,
      token: sv.user!.token ?? "",
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      showCustomSnackBar(
        title: "Success",
        message: "Product added to cart",
      );
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    loadingButtons = false;
    update(["button/$productId"]);
    getAllProductsInCart();
  }

  @override
  void onInit() async {
    getAllProductsInCart();

    super.onInit();
  }
}
