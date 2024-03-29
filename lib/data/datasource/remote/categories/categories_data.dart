import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/constant/linkapi.dart';

class CategorieData {
  Crud crud;
  CategorieData(this.crud);
  getAllCategories({required String token}) async {
    var response = await crud.getData(
      linkUrl: AppLinks.categories,
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }
}
