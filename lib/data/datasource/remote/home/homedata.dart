import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/constant/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData({required String token}) async {
    var response = await crud.getData(linkUrl: AppLinks.homepage, token: token);
    return response.fold((l) => l, (r) => r);
  }
}
