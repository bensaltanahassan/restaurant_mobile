import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/constant/linkapi.dart';

class ProductsData {
  Crud crud;
  ProductsData(this.crud);

  getAllProducts({required String token, Map<String, dynamic>? filtre}) async {
    var response = await crud.getData(
      linkUrl: AppLinks.products,
      queryParameters: filtre,
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }

  searchForProduct(
      {required String keyword,
      required int page,
      required int limit,
      int? categoryId}) async {
    var response = await crud.getData(
      linkUrl: AppLinks.search,
      queryParameters: {
        "productName": keyword,
        "page": page,
        "limit": limit,
        "categoryId": categoryId,
      },
    );

    return response.fold((l) => l, (r) => r);
  }
}
