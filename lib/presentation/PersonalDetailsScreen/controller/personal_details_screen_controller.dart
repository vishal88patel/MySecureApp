import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../App Configurations/color_constants.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/math_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../LoginScreen/models/login_response_model.dart';



class PersonalDetailsScreenController extends GetxController {
 var loginResponseModel = LoginResponseModel();
 TextEditingController firstNameController = TextEditingController();
 TextEditingController lastNameController = TextEditingController();
 TextEditingController emailController = TextEditingController();
 TextEditingController dobController = TextEditingController();
 TextEditingController ssnController = TextEditingController();
 var balance = "".obs;
 var cardNumber = "".obs;
 var cardName = "".obs;
 var cardDate = "".obs;
 var cardCvv = "".obs;
 var firstName = "".obs;
 var lastName = "".obs;
 var dob = "".obs;
 var readOnly = true.obs;
 DateTime selectedDate = DateTime.now();
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    Future.delayed(Duration(milliseconds: 100),(){getUserDetails();});

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getUserDetails() async {
    UIUtils.showProgressDialog(isCancellable: false);
    ApiService()
        .callGetApi(
        body: await FormData({}),
        headerWithToken: true,
        showLoader: true,
        url: ApiEndPoints.GET_PROFILE)
        .then((value) {
      print(value);
      if (value!=null && value['status'] ?? false) {
        loginResponseModel = LoginResponseModel.fromJson(value);
        balance.value=loginResponseModel.data!.balance.toString();
        cardNumber.value=loginResponseModel.data!.cardNumber.toString();
        cardDate.value=dateConverter(loginResponseModel.data!.expiredAt.toString()).substring(0,5);
        cardCvv.value=loginResponseModel.data!.cvv.toString();
        cardName.value=loginResponseModel.data!.firstName.toString()+" "+loginResponseModel.data!.lastName.toString();
        firstNameController.text=loginResponseModel.data!.firstName.toString();
        lastNameController.text=loginResponseModel.data!.lastName.toString();
        emailController.text=loginResponseModel.data!.email.toString();
        dobController.text=dateConverter(loginResponseModel.data!.dateOfBirth.toString());
        ssnController.text=loginResponseModel.data!.ssn.toString();
        UIUtils.hideProgressDialog();

      } else {
        UIUtils.hideProgressDialog();
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

 Future<void> selectBirthDate(
     BuildContext context,
     ) async {
   final DateTime? picked = await showDatePicker(
     context: context,
     initialDate: selectedDate,
     firstDate: DateTime(1900, 8),
     lastDate: DateTime.now(),
     builder: (context, child) {
       return Theme(
         data: ThemeData.dark().copyWith(
             colorScheme: ColorScheme.light(
                 onPrimary: ColorConstant.primaryDarkGreen, // selected text color
                 onSurface: Colors.white, // default text color
                 primary: Colors.white // circle color
             ),
             dialogBackgroundColor: ColorConstant.primaryDarkGreen,
             textButtonTheme: TextButtonThemeData(
                 style: TextButton.styleFrom(
                     textStyle: TextStyle(
                         color: ColorConstant.primaryDarkGreen,
                         fontWeight: FontWeight.normal,
                         fontSize: 12,
                         fontFamily: 'Quicksand'),
                     primary: Colors.white, // color of button's letters
                     backgroundColor: ColorConstant.primaryDarkGreen, // Background color
                     shape: RoundedRectangleBorder(
                         side: BorderSide(
                             color: ColorConstant.primaryLightGreen,
                             width: 1,
                             style: BorderStyle.solid),
                         borderRadius: BorderRadius.circular(50))))),
         child: child!,
       );
     },
   );
   if (picked != null && picked != selectedDate) {
     final DateFormat formatter = DateFormat('MM/dd/yyyy');
     final String startDate = formatter.format(picked);
     dobController.text = startDate;

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

 Future<void> UpdateProfileApi(BuildContext context) async {
   // UIUtils.showProgressDialog(isCancellable: false);
   ApiService()
       .callPostApi(
       body: await UpdateProfileApiBody(),
       headerWithToken: true,
       showLoader: true,
       url: ApiEndPoints.UPDATE_PROFILE)
       .then((value) {
     print(value);
     if (value['status']) {

       UIUtils.showSnakBar(
           bodyText: "Personal details updated successfully",
           headerText:"Success" );
       Future.delayed(Duration(milliseconds: 1000), () {
         Get.offAllNamed(AppRoutes.dashBoardScreen,
             arguments: {"bottomTabCount": 0});  }
       );
     } else {
       UIUtils.showSnakBar(
           bodyText: value['message'] ?? '',
           headerText: StringConstants.ERROR);
       //Get.back();
       //  Get.back();
     }
   });
 }

 Future<FormData> UpdateProfileApiBody() async {
   final form = FormData({
     "first_name": firstNameController.text.toString(),
     "last_name": lastNameController.text.toString(),
     "date_of_birth": dobController.text.toString(),

   });
   return form;
 }

 void onTapUpdateButton(BuildContext context) {
   if (firstNameController.text.isEmpty) {
     UIUtils.showSnakBar(
       headerText: StringConstants.ERROR,
       bodyText: "Please enter Firstname",
     );
   } else if (lastNameController.text.isEmpty) {
     UIUtils.showSnakBar(
       headerText: StringConstants.ERROR,
       bodyText: "Please enter mobile",
     );
   } else if (dobController.text.isEmpty) {
     UIUtils.showSnakBar(
       headerText: StringConstants.ERROR,
       bodyText: "Please enter email",
     );
   }else {
     UpdateProfileApi(context);
   }
 }

}
