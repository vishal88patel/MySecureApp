import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../HistoryScreen/Model/getUuidDetail.dart';
import '../scan_password_screen.dart';
import '../scan_success_screen.dart';



class ScanScreenController extends GetxController {
  var qrCodeResult="".obs;
  TextEditingController passController = TextEditingController();
  var passIsObsecure = true.obs;
  QRViewController? controller;
  var uuidModel=GetUuidDetail().obs;
  final jobRoleCtrl = TextEditingController();
  var uuid="".obs;
  var date="".obs;
  var isPin=0.obs;
  var email="".obs;
  var name="".obs;
  var image="".obs;
  TextEditingController amountController = TextEditingController();
  var dropHeight=250.00.obs;
  var selectedMethod="Select Payment Method".obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    final now = new DateTime.now();
    date.value = DateFormat.yMMMMd('en_US').format(now).toString();
    super.onInit();

  }
  Future<void> cameraStart() async {
    Future.delayed(Duration(milliseconds: 100), () {
      controller?.resumeCamera();
    });
  }

  @override
  void onClose() {
    controller?.stopCamera();
    super.onClose();
  }
  void processToPay(){
    if (amountController.text.isEmpty) {
      UIUtils.showSnakBar(
        headerText: StringConstants.ERROR,
        bodyText: "Please enter amount",
      );
    }
    else if (jobRoleCtrl.text.isEmpty) {
      UIUtils.showSnakBar(
        headerText: StringConstants.ERROR,
        bodyText: "Please select method",
      );
    } else {
      Get.to(ScanPasswordScreen());
    }

  }

  void onTapOfPassObsecure(bool val) {
    passIsObsecure.value = !val;
  }

  Future<void> callGetUuidApi() async {
    UIUtils.showProgressDialog(isCancellable: false);
    ApiService()
        .callPostApi(
        body: await getUuidApiBody(),
        headerWithToken: true,
        url: ApiEndPoints.GET_UUID_USER)
        .then((value) {
      print(value);
      if (value['status']) {
        uuidModel.value = GetUuidDetail.fromJson(value);
        email.value=uuidModel.value.data!.email!;
        name.value=uuidModel.value.data!.name!;
        image.value=uuidModel.value.data!.profilePhotoUrl!;
        UIUtils.hideProgressDialog();
        Get.toNamed(AppRoutes.scanSummaryScreen);
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }


  Future<FormData> getUuidApiBody() async {
    final form = FormData({
      "uuid": qrCodeResult.value
    });
    return form;
  }

  void clickOnTransaction(){
    if (passController.text.isEmpty) {
      UIUtils.showSnakBar(
        headerText: StringConstants.ERROR,
        bodyText: "Please enter password",
      );
    } else {
      callTransactionApi();
    }
  }

  Future<void> callTransactionApi() async {
    UIUtils.showProgressDialog(isCancellable: false);
    ApiService()
        .callPostApi(
        body: await getTransactionApiBody(),
        headerWithToken: true,
        url: ApiEndPoints.TRANSACTION)
        .then((value) {
      print(value);
      if (value['status']) {
        UIUtils.hideProgressDialog();
        Get.to(ScanSuccessScreen());
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getTransactionApiBody() async {
    final form = FormData({
      "uuid": uuid.value.toString(),
      "amount": amountController.text.toString(),
      "pin": passController.text
    });
    return form;
  }

  void onChangeOfExpansonTile() {
    if(dropHeight.value==350){
      dropHeight.value=250;
    }else{
      dropHeight.value=350;
    }
  }

}
