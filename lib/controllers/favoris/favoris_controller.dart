import 'package:get/get.dart';
import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/core/functions/handlingdatacontroller.dart';
import 'package:restaurant_mobile/core/services/services.dart';
import 'package:restaurant_mobile/data/datasource/remote/favoris/favorisdata.dart';
import 'package:restaurant_mobile/data/model/favorismodel.dart';
import 'package:restaurant_mobile/data/model/product_model.dart';

class FavorisController extends GetxController {
  late StatusRequest statusRequest;
  FavorisData fd = FavorisData(Get.find<Crud>());
  List<FavorisModel> favorites = [];
  MyServices sv = Get.find<MyServices>();

  void goToProductDetail({required ProductModel productModel}) {
    Get.toNamed(AppRoutes.productdetail, arguments: {"product": productModel});
  }

  Future<void> getAllFavoris() async {
    favorites.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await fd.getData(
        userId: sv.user!.id!.toString(), token: sv.user!.token ?? "");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == true) {
        List<dynamic> data = response["favorites"];
        for (var element in data) {
          favorites.add(FavorisModel.fromJson(element as Map<String, dynamic>));
        }
        favorites.sort((a, b) => DateTime.parse(a.createdAt!)
            .compareTo(DateTime.parse(b.createdAt!)));
        update();
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
      update();
    }
  }

  Future<void> deleteFavorite(FavorisModel favoris) async {
    statusRequest = StatusRequest.loading;
    update(["delete/${favoris.id}"]);
    var response =
        await fd.deleteData(favId: favoris.id.toString(), token: "token");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      favorites.remove(favoris);
      update(["favButton/${favoris.productId}"]);
      update();
    } else {
      statusRequest = StatusRequest.serverfailure;
      update();
    }
  }

  Future<void> addToFavoris(ProductModel product) async {
    var response = await fd.addData(
        userId: sv.user!.id!.toString(),
        productId: product.id.toString(),
        token: sv.user!.token ?? "");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      await getAllFavoris();
      update(["favButton/${product.id}"]);
    } else {
      statusRequest = StatusRequest.serverfailure;
      update();
    }
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    await getAllFavoris();
    super.onInit();
  }
}
