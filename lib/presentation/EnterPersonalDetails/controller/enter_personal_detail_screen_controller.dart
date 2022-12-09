import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:secure_cash_app/routes/app_routes.dart';

import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import 'package:flutter/services.dart';

import '../../loader_screen.dart';

class EnterBirthDateController extends GetxController {
  TextEditingController dobController = TextEditingController();
  TextEditingController ssnController = TextEditingController();
  DateTime selectedDate = DateTime.now();


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onTapOfNextButton() {
    if (dobController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter Date of Birth",
          headerText: StringConstants.ERROR);
      // } else if (!isAdult(dobController.text)) {
    } else if (dobController.text=="00/00/0000") {

      UIUtils.showSnakBar(
          bodyText: "Pleas enter valid birth date", headerText: StringConstants.ERROR);
    }else if (!isAdult(dobController.text)) {
      UIUtils.showSnakBar(
          bodyText: "Under 18 year old are not eligible for register", headerText: StringConstants.ERROR);
    }
    else {
      Get.to(()=> LoaderScreen(AppRoutes.enterSnnDetailScreen),transition: Transition.rightToLeft);
      // Get.toNamed(AppRoutes.enterSnnDetailScreen);
    }
  }

  onTapOfNextSnnButton() {

    if (ssnController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter SSN", headerText: StringConstants.ERROR);
    }else if (ssnController.text.length!=9) {
      UIUtils.showSnakBar(
          bodyText: "SSN Should be 9 digit number", headerText: StringConstants.ERROR);
    }
    else {
      // Get.toNamed(AppRoutes.personalDetailScreen);
      Get.to(()=> LoaderScreen(AppRoutes.personalDetailScreen),transition: Transition.rightToLeft);

    }
  }


  bool isAdult(String birthDateString) {
    String datePattern = "dd/MM/yyyy";

    DateTime birthDate = DateFormat(datePattern).parse(birthDateString);
    DateTime today = DateTime.now();

    int yearDiff = today.year - birthDate.year;
    int monthDiff = today.month - birthDate.month;
    int dayDiff = today.day - birthDate.day;

    return yearDiff > 18 || yearDiff == 18 && monthDiff >= 0 && dayDiff >= 0;
  }


  Future<void> selectBirthDate(
      BuildContext context,
      ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900, 8),
      lastDate: DateTime.now(),
      builder: (context, child){
        return Theme(
          data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                  onPrimary: Colors.black, // selected text color
                  onSurface: Colors.white, // default text color
                  primary: Colors.white // circle color
              ),
              dialogBackgroundColor: Colors.black,
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          fontFamily: 'Quicksand'),
                      primary: Colors.white, // color of button's letters
                      backgroundColor: Colors.black, // Background color
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Colors.black,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(50))))),
          child: child!,
        );
      },

    );
    if (picked != null && picked != selectedDate) {
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      final String startDate = formatter.format(picked);
      dobController.text=startDate;

    }
  }
}

