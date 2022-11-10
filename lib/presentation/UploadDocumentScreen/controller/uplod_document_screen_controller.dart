import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/api_service.dart';
import '../../../ApiServices/network_info.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../EnterPasswordScreen/models/login_response_model.dart';
import 'package:http/http.dart' as http;



class UploadDocumentScreenController extends GetxController {
  File? profileImage;
  File? licenceImageFront;
  File? licenceImageBack;
  var netImage1="".obs;
  var netImage2="".obs;
  var netImage3="".obs;
  var qrCodeResult="".obs;
  var firstName="".obs;
  var lastName="".obs;
  var dob="".obs;
  var imageUrll ="".obs;
  var userName="".obs;
  LoginResponseModel? loginResponseModel=LoginResponseModel();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getStoredData();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }
  Future<void> getStoredData() async {
    loginResponseModel = (await PrefUtils.getLoginModelData(StringConstants.LOGIN_RESPONSE));
    userName.value=loginResponseModel!.data!.firstName!+" "+loginResponseModel!.data!.lastName.toString();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onClickOfSubmitButton() {
    if (netImage1.isNull ) {
      UIUtils.showSnakBar(
          bodyText: "Please Select Your Photo",
          headerText: StringConstants.ERROR);
    } else if (netImage2.isNull) {
      UIUtils.showSnakBar(
          bodyText: "Please Select Driving Licence Front Photo",
          headerText: StringConstants.ERROR);
    } else if (netImage3.isNull) {
      UIUtils.showSnakBar(
          bodyText: "Please Select Driving Licence Back Photo",
          headerText: StringConstants.ERROR);
    } else
    if (qrCodeResult.isEmpty || qrCodeResult.isNull || qrCodeResult.value=="-1") {
      UIUtils.showSnakBar(
          bodyText: "Please Scan Your Driving Licence",
          headerText: StringConstants.ERROR);
    } else {
      const start1 = "DCS";
      const end1 = "DDE";
      final startIndex1 = qrCodeResult.value.indexOf(start1);
      final endIndex1 = qrCodeResult.value.indexOf(end1, startIndex1 + start1.length);
      firstName.value=qrCodeResult.value.substring(startIndex1 + start1.length, endIndex1);

      const start2 = "DAC";
      const end2 = "DDF";
      final startIndex2 = qrCodeResult.value.indexOf(start2);
      final endIndex2 = qrCodeResult.value.indexOf(end2, startIndex2 + start2.length);
      lastName.value=qrCodeResult.value.substring(startIndex2 + start2.length, endIndex2);

      const start3 = "DBB";
      const end3 = "DBA";
      final startIndex3 = qrCodeResult.value.indexOf(start3);
      final endIndex3 = qrCodeResult.value.indexOf(end3, startIndex3 + start3.length);
      dob.value=qrCodeResult.value.substring(startIndex3 + start3.length, endIndex3);

      print(firstName.value+","+lastName.value+","+dob.value);
       callKycApi();
      // Get.toNamed(AppRoutes.personalDetailScreen);
    }
  }

 /* Future<void> ggggg() async {
    ApiService()
        .callPostApi(
        body: await getKycBody(
          profile: netImage1.value,
            licence_front: netImage1.value,
          licence_back: netImage1.value,
          licence_json: "{'first_name':${firstName.value.toString()},'last_name':${lastName.value.toString()},'date_of_birth': ${dob.value.toString()}}"
        ),
        headerWithToken: true,
        url: ApiEndPoints.KYC_UPDATE)
        .then((value) {
      print(value);
      if (value['status']) {
        UIUtils.showSnakBar(bodyText: value['message'], headerText: StringConstants.SUCCESS);
        Get.offAllNamed(AppRoutes.progressScreen);
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }*/

  callKycApi() async {
    UIUtils.showProgressDialog(isCancellable: false);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
      'Bearer ${await PrefUtils.getString(StringConstants.AUTH_TOKEN)}',
    };


    var request = http.MultipartRequest('POST', Uri.parse(ApiEndPoints.KYC_UPDATE));

    request.headers.addAll(headers);
    request.fields['licence_json'] =  "{'first_name':${firstName.value.toString()},'last_name':${lastName.value.toString()},'date_of_birth': ${dob.value.toString()}}";
    // "profile": profile,
    // "licence_front": licence_front,
    // "licence_back": licence_back,
    // "licence_json": licence_json,

    request.files.add(await http.MultipartFile.fromPath(
        "profile", netImage1.value));

    request.files.add(await http.MultipartFile.fromPath(
        "licence_front", netImage2.value));

    request.files.add(await http.MultipartFile.fromPath(
        "licence_back", netImage3.value));
    var response = await request.send();

    var responsed = await http.Response.fromStream(response);
    final responseData = json.decode(responsed.body);

    if (response.statusCode == 200) {
      UIUtils.hideProgressDialog();
      UIUtils.showSnakBar(bodyText: responseData['message'], headerText: StringConstants.SUCCESS);
      Get.offAllNamed(AppRoutes.dashBoardScreen,arguments: {"bottomTabCount":0});
    } else {
      UIUtils.hideProgressDialog();
      UIUtils.showSnakBar(bodyText: responseData['message'], headerText: StringConstants.SUCCESS);

    }
  }

  Future<FormData> getKycBody({
    required String profile,
    required String licence_front,
    required String licence_back,
    required String licence_json,
  }) async {
    final form = FormData({
      "profile": profile,
      "licence_front": licence_front,
      "licence_back": licence_back,
      "licence_json": licence_json,
    });
    return form;
  }

}
