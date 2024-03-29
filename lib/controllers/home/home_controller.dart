import 'package:get/get.dart';
import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/core/functions/handlingdatacontroller.dart';
import 'package:restaurant_mobile/core/services/services.dart';
import 'package:restaurant_mobile/data/datasource/remote/home/homedata.dart';
import 'package:restaurant_mobile/data/model/categoriesmodel.dart';
import 'package:restaurant_mobile/data/model/home_model.dart';
import 'package:restaurant_mobile/data/model/product_model.dart';

class HomeController extends GetxController {
  late StatusRequest statusRequest;
  final homeData = HomeData(Get.find<Crud>());
  final myServices = Get.find<MyServices>();
  HomeModel? homeModel;

  void goToProductsCategory({required CategoryModel category}) {
    Get.toNamed(AppRoutes.productsCategory, arguments: {"category": category});
  }

  void goToProductDetail({required ProductModel product}) {
    Get.toNamed(AppRoutes.productdetail, arguments: {"product": product});
  }

  Future<void> getHomeData() async {
    statusRequest = StatusRequest.loading;
    update(["home_status"]);
    var response = await homeData.getData(token: myServices.user!.token ?? "");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      HomeModel data = HomeModel.fromJson(response);
      if (data.status == true) {
        homeModel = data;
      } else {}
    }
    update(["home_status"]);
  }

  @override
  void onInit() {
    getHomeData();

    super.onInit();
  }
}
