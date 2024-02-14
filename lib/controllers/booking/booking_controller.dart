import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingController extends GetxController {
  final TextEditingController numberOfPeopleController =
      TextEditingController();
  late DateTime selectedDate;
  late TimeOfDay selectedTime;
  late String formattedDate;
  late String formattedTime;

  void pickDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2100));
    if (pickedDate != null) {
      formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      update();
    } else {
      SnackBar snackBar = const SnackBar(content: Text('Please select a date'));
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    }
  }

  pickTime() {
    showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
      helpText: "Select Time",
    ).then((value) {
      if (value != null) {
        selectedTime = value;
        formattedTime = selectedTime.format(Get.context!);
        update();
      } else {
        SnackBar snackBar =
            const SnackBar(content: Text('Please select a time'));
        ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
      }
    });
  }

  @override
  void onInit() {
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.now();
    formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
    formattedTime = selectedTime.format(Get.context!);

    super.onInit();
  }

  @override
  void onClose() {
    numberOfPeopleController.dispose();
    super.onClose();
  }
}
