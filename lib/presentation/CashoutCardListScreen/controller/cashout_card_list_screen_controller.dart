
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../App Configurations/color_constants.dart';
import '../../../Custom Widgets/app_ElevatedButton .dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_style.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/math_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../CashOutAmountNumPadScreen/controller/cash_out_amount_num_pad_screen_controller.dart';
import '../../CashoutAmountScreen/controller/cashout_amount_scareen_controller.dart';
import '../../HomeScreen/model/get_linked_bank.dart';
import '../cashout_failed_screen.dart';
import '../model/cashout_card_list_response_model.dart';



class CashoutCardListScreenController extends GetxController {
  var cashoutCardListModel=CashoutCardListResponseModel().obs;
  RxList mainCardList=[].obs;
  var getLinkedBankModel = GrtLinkedBank().obs;
  var selectedIndex=1000.obs;
  var selectedCard= 0.obs;
  var isPin= 0.obs;
  var arguments = Get.arguments;

  var type = "";
  var amountNumPadController =
  Get.find<CashoutAmountController>();

  final pinController = TextEditingController();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    callGetBankListApi();
    getArguments();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }


  Future<FormData> getWalletApiBody() async {
    final form = FormData({});
    return form;
  }



  void selectCreditCard(var index){
    selectedCard.value = index;
  }

  void getArguments() {
    if (arguments != null) {
      type = arguments['TYPE'] ?? '';
      if(type=="1"){
        callGetLinkedBankApi();
      }else{
        callGetCardListApi();

      }
      // email.value = arguments['EMAIL'] ?? '';
      // name.value = arguments['NAME'] ?? '';
      // profile_pic.value = arguments['IMAGE'] ?? '';
      // isPin.value = arguments['IS_PIN'] ?? '';
    }
  }
  @override
  void onClose() {
    super.onClose();
  }

  Future<void> callGetCardListApi() async {
    ApiService()
        .callGetApi(
        body: await getBankApiBody(),
        headerWithToken: true,
        showLoader: true,
        url: ApiEndPoints.GET_CARDLIST)
        .then((value) {
      print(value);
      if (value['status']) {
        cashoutCardListModel.value = CashoutCardListResponseModel.fromJson(value);
        for (int i = 0; i < cashoutCardListModel.value.data!.length; i++) {
          mainCardList.value.add(cashoutCardListModel.value.data![i]);
        }

      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }


  Future<void> callGetLinkedBankApi() async {
    ApiService()
        .callGetApi(
        body: await getBankApiBody(),
        headerWithToken: true,
        showLoader: true,
        url: ApiEndPoints.HOME_PAGE_GET_LINKED_BANK)
        .then((value) {
      print(value);
      if (value['status'] ?? false) {
        getLinkedBankModel.value = GrtLinkedBank.fromJson(value);
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getBankApiBody() async {
    final form = FormData({});
    return form;
  }

  void showBankInfoBottomsheet() {
    Get.bottomSheet(
        isScrollControlled: true,
        Container(
          height: size.height,
          color: ColorConstant.blue26,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  padding: EdgeInsets.all(9),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: SvgPicture.asset(
                    "asset/icons/ic_bank.svg",
                    color: ColorConstant.primaryWhite,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
                child: Text(
                  "Link Your Bank Account",
                  style: AppStyle.DmSansFont.copyWith(
                      color: ColorConstant.primaryWhite,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontSize: getFontSize(24)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        textAlign: TextAlign.start,
                        StringConstants.BANK_INFO_TEXT,
                        style: AppStyle.DmSansFont.copyWith(
                            color: ColorConstant.primaryWhite,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w300,
                            fontSize: getFontSize(18)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "asset/icons/ic_okay.svg",
                      color: Colors.green,
                    ),
                    SizedBox(width: 8,),
                    Flexible(
                      child: Text(
                        textAlign: TextAlign.start,
                        StringConstants.BANK_INFO_TEXT_1,
                        style: AppStyle.DmSansFont.copyWith(
                            color: ColorConstant.primaryWhite,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w300,
                            fontSize: getFontSize(18)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "asset/icons/ic_okay.svg",
                      color: Colors.green,
                    ),
                    SizedBox(width: 8,),
                    Flexible(
                      child: Text(
                        textAlign: TextAlign.start,
                        StringConstants.BANK_INFO_TEXT_2,
                        style: AppStyle.DmSansFont.copyWith(
                            color: ColorConstant.primaryWhite,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w300,
                            fontSize: getFontSize(18)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Spacer(),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Flexible(
                      child: Text(
                        textAlign: TextAlign.center,
                        StringConstants.BANK_INFO_TEXT_3,
                        style: AppStyle.DmSansFont.copyWith(
                            color: ColorConstant.skyE8,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w300,
                            fontSize: getFontSize(18)),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: AppElevatedButton(
                  buttonName: 'Continue',
                  radius: 5,
                  onPressed: () {
                    onclickOfContinueButton();
                    // Get.toNamed(AppRoutes.dashBoardScreen);
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ));
  }

  void onclickOfContinueButton() {
    Get.toNamed(AppRoutes.bankListScreen);
  }

  void onTapOfTile(int index) {
    selectedIndex.value=index;
  }
  void onTapOfListTile(BuildContext context) {
    UIUtils.showProgressDialog(isCancellable: false);
    Future.delayed(Duration(milliseconds: 2000), () {
      WithdrawErrorApi(context);
    });
  }

  Future<void> WithdrawErrorApi(BuildContext context) async {
    ApiService()
        .callPostApi(
        body: await getBodyWithdrawError(amountNumPadController.amountController.text),
        headerWithToken: true,
        url: ApiEndPoints.WITHDRAW_ERROR)
        .then((value) {
      print(value);
      if (value['status']) {
        UIUtils.hideProgressDialog();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CashoutFailedScreen()),
        );
      } else {
        UIUtils.hideProgressDialog();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CashoutFailedScreen()),
        );
      }
    });
  }

  Future<FormData> getBodyWithdrawError(String amount) async {
    final form = FormData({"amount": amount});
    print(form.toString());
    return form;
  }
  Future<void> callGetBankListApi() async {
    ApiService()
        .callGetApi(
        body: await getCardApiBody(),
        headerWithToken: true,
        showLoader: true,
        url: ApiEndPoints.GET_CARDLIST)
        .then((value) {
      print(value);
      if (value['status']) {
        cashoutCardListModel.value = CashoutCardListResponseModel.fromJson(value);
        for (int i = 0; i < cashoutCardListModel.value.data!.length; i++) {
          mainCardList.value.add(cashoutCardListModel.value.data![i]);
        }

      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getCardApiBody() async {
    final form = FormData({});
    return form;
  }



}
