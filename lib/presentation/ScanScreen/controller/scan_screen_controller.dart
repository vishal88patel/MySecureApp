import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../CashoutAmountScreen/model/getWallet.dart';
import '../../HistoryScreen/Model/getUuidDetail.dart';
import '../../LoginScreen/models/login_response_model.dart';
import '../../ScanPinScreen/scan_password_screen.dart';
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
  var dropHeight=200.00.obs;
  var animContainerHeighr=85.00.obs;
  var selectedMethod="Select Payment Method".obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;

  var isFirstOpen = false.obs;
  var balance="00000".obs;
  var walletModel=GetWallet().obs;
  var arguments = Get.arguments;


  @override
  void onReady() {
    // cameraStart();
    super.onReady();
  }

  @override
  void onInit() {
    getArguments();
    getStoredData();
    super.onInit();
  }


  void getArguments({arguments}) {
    if (arguments!=null && arguments['uuid'] != null && arguments['amount'] != null) {
      qrCodeResult.value = arguments['uuid'];
      uuid.value = arguments['uuid'];
      amountController.text = arguments['amount'];
      final now = new DateTime.now();
      date.value = DateFormat.yMMMMd('en_US').format(now).toString();
      callGetUuidApi();

    }else{
      final now = new DateTime.now();
      date.value = DateFormat.yMMMMd('en_US').format(now).toString();
      callGetWalletApi(pageNo: 1);
    }
  }
  Future<void> cameraStart() async {

    Future.delayed(Duration(milliseconds: 200), () {
      controller?.resumeCamera();
    });
  }

  @override
  void onClose() {
    controller!.stopCamera();
    super.onClose();
  }
  void processToPay(){
    if (amountController.text.isEmpty) {
      UIUtils.showSnakBar(
        headerText: StringConstants.ERROR,
        bodyText: "Please enter amount",
      );
    }else if(int.parse(amountController.text.toString())<=0){
      UIUtils.showSnakBar(
          headerText: StringConstants.ERROR,
          bodyText: "Please Enter Valid Amount");
    }else if(int.parse(balance.value)<int.parse(amountController.text)+(int.parse(amountController.text)*0.02)){
      UIUtils.showSnakBar(
          headerText: StringConstants.ERROR,
          bodyText: "Insufficient Wallet Balance 2% payment fees has been added!!");
    }
   /* else if (selectedMethod.value =="Select Payment Method" ||selectedMethod.value.isEmpty) {
      UIUtils.showSnakBar(
        headerText: StringConstants.ERROR,
        bodyText: "Please select method",
      );
    }*/ else {
      Get.toNamed(AppRoutes.scanPasswordScreen,arguments: {
        "uuid":uuid.value,
      });
    }

  }

  Future<void> callGetWalletApi({required int pageNo}) async {
    ApiService()
        .callGetApi(
        body: await getWalletApiBody(),
        headerWithToken: true,
        showLoader: false,
        url: ApiEndPoints.GET_WALLET+"?page=$pageNo")
        .then((value) {
      print(value);
      if (value!=null&&value['status']) {
        walletModel.value = GetWallet.fromJson(value);
        isPin.value= walletModel.value.data!.isPin!;
        balance.value= walletModel.value.data!.walletBalance!;

      } else {
        UIUtils.hideProgressDialog();
        // UIUtils.showSnakBar(
        //     bodyText: value['message']??'', headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getWalletApiBody() async {
    final form = FormData({});
    return form;
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
      if (value!=null && value['status']) {
        uuidModel.value = GetUuidDetail.fromJson(value);
        email.value=uuidModel.value.data!.email!;
        name.value=uuidModel.value.data!.name!;
        image.value=uuidModel.value.data!.profilePhotoUrl!;
        UIUtils.hideProgressDialog();
        controller?.dispose();
        Get.toNamed(AppRoutes.scanSummaryScreen)!.then((value) {
          cameraStart();
        });
        cameraStart();
      } else {
        cameraStart();
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


  void onChangeOfExpansonTile() {
    if(dropHeight.value==600){
      isFirstOpen.value = false;
      dropHeight.value=200;
    }else{
      isFirstOpen.value = true;
      dropHeight.value=600;
    }
    if(animContainerHeighr.value==420){
      animContainerHeighr.value=85;
    }else{
      animContainerHeighr.value=420;
    }
  }

  void onTaoOfItem(String s) {
    selectedMethod.value=s;
    onChangeOfExpansonTile();
  }

  Future<void> getStoredData() async {
    loginResponseModel.value = (await PrefUtils.getLoginModelData(StringConstants.LOGIN_RESPONSE))!;
  }

}
