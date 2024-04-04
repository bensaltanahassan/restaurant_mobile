import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/cart/cart_controller.dart';
import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/core/functions/handlingdatacontroller.dart';
import 'package:restaurant_mobile/core/functions/showsnackbar.dart';
import 'package:restaurant_mobile/core/services/services.dart';
import 'package:restaurant_mobile/data/datasource/remote/cart/cart_data.dart';
import 'package:restaurant_mobile/data/datasource/remote/home/homedata.dart';
import 'package:restaurant_mobile/data/model/categoriesmodel.dart';
import 'package:restaurant_mobile/data/model/home_model.dart';
import 'package:restaurant_mobile/data/model/product_model.dart';

class HomeController extends GetxController {
  late StatusRequest statusRequest;
  final homeData = HomeData(Get.find<Crud>());
  final Cartdata cd = Cartdata(Get.find());
  final myServices = Get.find<MyServices>();
  HomeModel? homeModel;
  ProductModel? productModel;

  Future<void> addToCart({required ProductModel product}) async {
    statusRequest = StatusRequest.loading;
    productModel = product;
    update(["addToCartButton/${product.id}"]);
    var response = await cd.postData(
      userId: myServices.user!.id!.toString(),
      productId: product.id.toString(),
      token: myServices.user!.token ?? "",
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      showCustomSnackBar(title: "Success", message: "Product added to cart");
      update(["addToCartButton/${product.id}"]);
      if (Get.isRegistered<CartController>()) {
        Get.find<CartController>().getAllProductsInCart();
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
      update(["addToCartButton/${product.id}"]);
    }
  }

  void goToProductsCategory({required CategoryModel category}) {
    Get.toNamed(AppRoutes.productsCategory, arguments: {"category": category});
  }

  void goToProductDetail({required ProductModel product}) {
    Get.toNamed(AppRoutes.productdetail, arguments: {"product": product});
  }

  Future<void> getHomeData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getData(token: myServices.user!.token ?? "");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      HomeModel data = HomeModel.fromJson(response);
      if (data.status == true) {
        homeModel = data;
      } else {}
    }
    update();
  }

  @override
  void onInit() {
    getHomeData();

    super.onInit();
  }
}
