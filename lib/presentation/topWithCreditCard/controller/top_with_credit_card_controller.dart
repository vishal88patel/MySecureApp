import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../LoginScreen/models/login_response_model.dart';
import '../../NormalScreen/WelcomeScreen.dart';
import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../model/getWallet.dart';
import '../model/getUuiModel.dart';
import 'package:intl/intl.dart';


class TopWithCreditCardController extends GetxController {
  TextEditingController amountController = TextEditingController();

  var walletModel=GetWallet().obs;
  var uuidModel=GetUuidDetail().obs;
  RxList transactionList=[].obs;
  var pageNumber=1.obs;
  var lastPage=0.obs;
  var balance="00000".obs;
  var uuid="".obs;
  var isPin=0.obs;
  var qrCodeResult="".obs;
  late ScrollController controller;
  var formatter = NumberFormat('#,##,000').obs;


  var opt1=false.obs;
  var opt2=false.obs;
  var opt3=false.obs;
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

  onNext(BuildContext context){
    if(amountController.text=='0'){
      UIUtils.showSnakBar(
          headerText: StringConstants.ERROR,
          bodyText: "Please Enter Amount");
    }else if(amountController.text.isEmpty){
      UIUtils.showSnakBar(
          headerText: StringConstants.ERROR,
          bodyText: "Please Enter Amount");
    }else if(int.parse(balance.value)<int.parse(amountController.text)){
      UIUtils.showSnakBar(
          headerText: StringConstants.ERROR,
          bodyText: "Insufficient Wallet Balance");
    }else{
      //onTapOfListile(context);
      Get.toNamed(AppRoutes.topSelectionModeScreen);
      //Get.toNamed(AppRoutes.topAddCard1Screen);
    }
  }
  void _scrollListener() {

    if (controller.position.pixels == controller.position.maxScrollExtent) {
      pageNumber.value++;
      if(pageNumber.value<=lastPage.value){
        callGetWalletApi(pageNo: pageNumber.value);
      }
    }
  }
  void onTapOfListile(BuildContext context) {
    WithdrawErrorApi();
    print("tappppppppppppppppppppppppppppppppppppppppppppppppppp");
    UIUtils.showProgressDialog(isCancellable: false);
    Future.delayed(Duration(milliseconds: 3000), () {
      UIUtils.hideProgressDialog();
      AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.RIGHSLIDE,
          headerAnimationLoop: false,
          title: 'Error',
          desc:
          'Something went wrong. we cannot process this transaction. Please Contact Admin!!!',
          btnOkOnPress: () {},
          btnOkIcon: Icons.cancel,
          btnOkColor: Colors.red)
        ..show();
    });
  }

  Future<void> WithdrawErrorApi() async {
    ApiService()
        .callPostApi(
        body: await getBodyWithdrawError(amountController.text),
        headerWithToken: true,
        url: ApiEndPoints.WITHDRAW_ERROR)
        .then((value) {
      print(value);
      if (value['status']) {


      } else {

      }
    });
  }
  Future<FormData> getBodyWithdrawError(String amount) async {
    final form = FormData({"amount": amount});
    print(form.toString());
    return form;
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
