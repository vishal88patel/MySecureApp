
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/presentation/CashOutAmountNumPadScreen/controller/cash_out_amount_num_pad_screen_controller.dart';
import 'package:my_secure_app/presentation/HomeScreen/model/get_linked_bank.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../model/card_list_response_model.dart';



class CardListScreenController extends GetxController {
  var cardListModel=CardListResponseModel().obs;
  RxList mainCardList=[].obs;
  var getLinkedBankModel = GrtLinkedBank().obs;
  var selectedIndex=1000.obs;
  var arguments = Get.arguments;
  var type = "";
  var amountNumPadController = Get.put(CashOutAmountNumPadScreenController());
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
        cardListModel.value = CardListResponseModel.fromJson(value);
        for (int i = 0; i < cardListModel.value.data!.length; i++) {
          mainCardList.value.add(cardListModel.value.data![i]);
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

  Future<void> WithdrawErrorApi() async {
    ApiService()
        .callPostApi(
        body: await getBodyWithdrawError(amountNumPadController.amountController.text),
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
        cardListModel.value = CardListResponseModel.fromJson(value);
        for (int i = 0; i < cardListModel.value.data!.length; i++) {
          mainCardList.value.add(cardListModel.value.data![i]);
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
