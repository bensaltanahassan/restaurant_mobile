import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/functions/handlingdatacontroller.dart';
import 'package:restaurant_mobile/core/functions/showsnackbar.dart';
import 'package:restaurant_mobile/core/services/services.dart';
import 'package:restaurant_mobile/data/datasource/reservations/reservation_data.dart';
import 'package:restaurant_mobile/data/model/responses/book_table_response.dart';

class BookingController extends GetxController {
  final numberOfPeopleController = TextEditingController();
  final services = Get.find<MyServices>();
  final reservationData = ReservationData(Get.find<Crud>());
  StatusRequest? statusRequest;
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
      selectedDate = pickedDate;
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

  Future<void> bookTable() async {
    statusRequest = StatusRequest.loading;
    update(['bookingButton']);
    DateTime selectedDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    var response = await reservationData.bookTable(
      fullName: services.user!.fullName!,
      phone: services.user!.phone!,
      date: selectedDateTime,
      numberOfPeople: numberOfPeopleController.text,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      BookTableResponse bookTableResponse =
          BookTableResponse.fromJson(response);
      if (bookTableResponse.status == true) {
        showCustomSnackBar(
          title: 'Success',
          message: "Your request has been sent, we will contact you soon",
        );
      } else {
        showCustomSnackBar(
          title: 'Failed',
          message: "Failed to book table",
        );
      }
    } else {
      showCustomSnackBar(
        title: 'Failed',
        message: "Failed to book table",
      );
    }

    update(['bookingButton']);
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
