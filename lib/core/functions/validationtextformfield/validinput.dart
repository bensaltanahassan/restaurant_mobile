import 'package:get/get.dart';

validInput({required String val, int? min, int? max, String? type}) {
  if (val.isEmpty) {
    return "value can't be empty";
  }

  if (type == "name") {
    if (!GetUtils.isUsername(val)) {
      return "not valid";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phone number";
    }
  }
  if (type == "double") {
    if (!GetUtils.isNum(val)) {
      return "not valid double";
    }
  }

  if (min != null && val.length < min) {
    return "value can't be less than $min";
  }
  if (max != null && val.length > max) {
    return "value can't be less than $max";
  }
}
