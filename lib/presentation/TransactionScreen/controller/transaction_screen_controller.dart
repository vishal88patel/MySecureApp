
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/presentation/TransactionScreen/model/getUuidDetail.dart';
import 'package:my_secure_app/routes/app_routes.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../model/getWallet.dart';



class TransactionScreenController extends GetxController {
  var walletModel=GetWallet().obs;
  var uuidModel=GetUuidDetail().obs;
  RxList transactionList=[].obs;
  var pageNumber=1.obs;
  var lastPage=0.obs;
  var balance="".obs;
  var uuid="".obs;
  var isPin=0.obs;
  var qrCodeResult="".obs;
  late ScrollController controller;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    callGetWalletApi(pageNo: 1);
    //controller = ScrollController()..addListener(_scrollListener);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
  Future<void> callGetWalletApi({required int pageNo}) async {
    ApiService()
        .callGetApi(
        body: await getWalletApiBody(),
        headerWithToken: true,
        showLoader: pageNo==1?true:false,
        url: ApiEndPoints.GET_WALLET+"?page=$pageNo")
        .then((value) {
      print(value);
      if (value!=null&&value['status']) {
        walletModel.value = GetWallet.fromJson(value);
        isPin.value= walletModel.value.data!.isPin!;
        lastPage.value= walletModel.value.data!.lastPage!;
        balance.value= walletModel.value.data!.walletBalance!;
        transactionList.addAll(walletModel.value.data!.userTransaction??[]);
        uuid.value= walletModel.value.data!.uuid!??"";

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

  void _scrollListener() {

    if (controller.position.pixels == controller.position.maxScrollExtent) {
      pageNumber.value++;
      if(pageNumber.value<=lastPage.value){
        callGetWalletApi(pageNo: pageNumber.value);
      }
    }
  }



  Future<void> callGetUuidApi() async {
    ApiService()
        .callPostApi(
        body: await getUuidApiBody(),
        headerWithToken: true,
        url: ApiEndPoints.GET_UUID_USER)
        .then((value) {
      print(value);
      if (value['status']) {
        uuidModel.value = GetUuidDetail.fromJson(value);
        Get.toNamed(AppRoutes.amountNumPadScreen,arguments: {
          "IS_PIN":isPin.value,
          "EMAIL":uuidModel.value.data?.email,
          "NAME":uuidModel.value.data?.name,
          "IMAGE":uuidModel.value.data?.profilePhotoUrl,
          "UUID_ID":uuid.value,
          "amount" :walletModel.value.data!.walletBalance
        });
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
}
