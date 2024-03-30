import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/constant/linkapi.dart';

class ReservationData {
  Crud crud;
  ReservationData(this.crud);
  bookTable({
    required String fullName,
    required String phone,
    required DateTime date,
    required String numberOfPeople,
  }) async {
    var response = await crud.postData(linkUrl: AppLinks.reservation, data: {
      "date": date.toIso8601String(),
      "nbrOfPeople": numberOfPeople,
      "fullName": fullName,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
