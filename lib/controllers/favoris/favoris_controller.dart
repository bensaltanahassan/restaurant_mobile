import 'package:get/get.dart';
import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/core/functions/handlingdatacontroller.dart';
import 'package:restaurant_mobile/core/services/services.dart';
import 'package:restaurant_mobile/data/datasource/remote/favoris/favorisdata.dart';
import 'package:restaurant_mobile/data/model/favorismodel.dart';

class FavorisController extends GetxController {
  late StatusRequest statusRequest;
  FavorisData fd = FavorisData(Get.find<Crud>());
  List<FavorisModel> favorites = [];
  MyServices sv = Get.find<MyServices>();
  void goToProductDetail({required String tag}) {
    Get.toNamed(AppRoutes.productdetail, arguments: {"tag": tag});
  }

  Future<void> getAllFavoris() async {
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
        update(["main"]);
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
      update(["main"]);
    }
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    await getAllFavoris();
    super.onInit();
  }
}
