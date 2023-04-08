import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:secure_cash_app/presentation/LoginScreen/models/login_response_model.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../App Configurations/color_constants.dart';
import '../../../Custom Widgets/app_ElevatedButton .dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_style.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/common_utils.dart';
import '../../../utils/HelperFiles/math_utils.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../CCCardScreen/model/cashcard_model.dart';
import '../../DashBoardScreen/controller/dashboard_screen_controller.dart';
import '../models/plenet_card.dart';

class ProfileScreenController extends GetxController {
  LoginResponseModel? loginResponseModel = LoginResponseModel();
  var homePageHeadeName = "".obs;
  var profilePicture = "".obs;
  var balance = "".obs;
  var accNum = "4738565434567700".obs;
  var routingNum = "".obs;
  var cardList = <Widget>[].obs;
  List<PlanetCard> planetCard = [];
  var cashCardModel = CashCardModel().obs;
  List<String> cardNumberList = [];
  List<Color> colorList = [];
  List<String> cvvList = [];
  var dashBoardController = Get.find<DashBoardScreenController>();
  @override
  void onInit() {
    getStoredData();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<dynamic> showLogOutDialouge() async {
    return Get.dialog(
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Wrap(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: ColorConstant.primaryWhite,
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 15, bottom: 20),
                  constraints: const BoxConstraints(minWidth: 200),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Logout",
                            style: AppStyle.DmSansFont.copyWith(fontSize: 22),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            "Are you sure,you want to Logout?",
                            textAlign: TextAlign.start,
                            style: AppStyle.DmSansFont.copyWith(fontSize: 18),
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: getHorizontalSize(150),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: AppElevatedButton(
                                buttonName: 'NO',
                                buttonColor: ColorConstant.primaryDarkGreen,
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 50,
                            width: getHorizontalSize(150),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: AppElevatedButton(
                                buttonName: 'YES',
                                buttonColor: ColorConstant.primaryDarkGreen,
                                onPressed: () {
                                  Get.back();
                                  callLogOutApi();
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

  Future<void> callGetCashCardApi() async {
    cardNumberList.clear();
    colorList.clear();
    cvvList.clear();
    colorList.add(ColorConstant.primaryLightGreen);
    colorList.add(
      ColorConstant.primaryOrange,
    );
    colorList.add(ColorConstant.naturalGrey4);

    cardNumberList.add(loginResponseModel!.data!.cardNumber.toString());
    cvvList.add(loginResponseModel!.data!.cvv.toString());

    ApiService()
        .callGetApi(
            body: await getGetCashCardApiBody(),
            headerWithToken: true,
            showLoader: false,
            url: ApiEndPoints.GET_CASHCARD)
        .then((value) {
      print(value);
      if (value != null && value['status']) {
        cashCardModel.value = CashCardModel.fromJson(value);
        for (int i = 0; i < cashCardModel.value.data!.length; i++) {
          if (cashCardModel.value.data![i].cardNumber!.isNotEmpty) {
            cardNumberList
                .add(cashCardModel.value.data![i].cardNumber.toString());
            cvvList.add(cashCardModel.value.data![i].cvv.toString());
          }
        }
        for (int i = 0; i < cardNumberList.length; i++) {
          if (cardNumberList[i].isNotEmpty) {
            planetCard.add(PlanetCard(
                cardNumber: cardNumberList[i],
                color: colorList[i],
                cvv: cvvList[i]));
          }
        }
        UIUtils.hideProgressDialog();
        _generateCards();
      } else {
        UIUtils.hideProgressDialog();
        // UIUtils.showSnakBar(
        //     bodyText: value['message']??'', headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getGetCashCardApiBody() async {
    final form = FormData({});
    return form;
  }

  Future<void> callLogOutApi() async {
    ApiService()
        .callPostApi(body: await getLogOutBody(), url: ApiEndPoints.LOGOUT)
        .then((value) {
      print(value);
      if (value != null && value['status']) {
        PrefUtils.clear();
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.SUCCESS);
        PrefUtils.clear();
        Get.offAllNamed(AppRoutes.authOptionScreen);
      } else {
        // UIUtils.showSnakBar(
        //     bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getLogOutBody() async {
    final form = FormData({});
    return form;
  }

  Future<void> getStoredData() async {
    loginResponseModel =
        (await PrefUtils.getLoginModelData(StringConstants.LOGIN_RESPONSE));
    homePageHeadeName.value = loginResponseModel!.data!.firstName! +
        " " +
        loginResponseModel!.data!.lastName.toString();
    profilePicture.value =
        loginResponseModel!.data!.profilePhotoPath.toString();
    balance.value =
        loginResponseModel!.data!.balance.toString();
    routingNum.value=loginResponseModel!.data!.routeNumber.toString();
    accNum.value=loginResponseModel!.data!.accountNumber.toString();
    callGetCashCardApi();
  }

  List _generateCards() {
    for (int x = 0; x < cardNumberList.length; x++) {
      cardList.value.add(
        Center(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 0),
            color: planetCard[x].color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap:(){
                    Get.toNamed(AppRoutes.showUserCardScreen);
                  },
                  child: Container(
                    width: size.width/1.1,
                    child: Wrap(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: getHorizontalSize(20),
                              right: getHorizontalSize(20),
                              top: getVerticalSize(20),bottom:getVerticalSize(12) ),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        x==0?"Balance":"CardHolder Name",
                                        style: AppStyle.textStyleDMSANS
                                            .copyWith(
                                            color: ColorConstant
                                                .primaryWhite,
                                            fontWeight:
                                            FontWeight.w500,
                                            fontSize:
                                            getFontSize(16)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: getHorizontalSize(4),
                                  ),
                                  x==0? Obx(
                                        ()=> dashBoardController.UserBalance.value==""?Container():Text(
                                      NumberFormat.currency(name: '\$ ').format(int.parse(dashBoardController.UserBalance.value)),
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(20)),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ):Obx(
                                        ()=> homePageHeadeName.value==""?Container():Text(homePageHeadeName.value,
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(20)),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    height: getHorizontalSize(10),
                                  ),
                                  Text(
                                    "Account number",
                                    style: AppStyle.textStyleDMSANS
                                        .copyWith(
                                        color: ColorConstant
                                            .primaryWhite,
                                        fontWeight:
                                        FontWeight.w400,
                                        fontSize:
                                        getFontSize(22)),
                                  ),
                                  SizedBox(
                                    height: getHorizontalSize(4),
                                  ),
                                  Text(
                                    CommonUtils.FormatCardNumber(accNum.toString()),
                                    style: AppStyle.textStyleDMSANS
                                        .copyWith(
                                        color: ColorConstant
                                            .primaryWhite,
                                        fontWeight:
                                        FontWeight.w700,
                                        fontSize:
                                        getFontSize(18)),
                                  ),
                                  SizedBox(
                                    height: getHorizontalSize(10),
                                  ),
                                  Text(
                                    "Routing number",
                                    style: AppStyle.textStyleDMSANS
                                        .copyWith(
                                        color: ColorConstant
                                            .primaryWhite,
                                        fontWeight:
                                        FontWeight.w400,
                                        fontSize:
                                        getFontSize(22)),
                                  ),
                                  SizedBox(
                                    height: getHorizontalSize(4),
                                  ),
                                  Text(
                                    routingNum.toString(),
                                    style: AppStyle.textStyleDMSANS
                                        .copyWith(
                                        color: ColorConstant
                                            .primaryWhite,
                                        fontWeight:
                                        FontWeight.w700,
                                        fontSize:
                                        getFontSize(18)),
                                  ),
                                  /*Row(
                                    children: [
                                      SvgPicture.asset(
                                        "asset/icons/ic_chip.svg",
                                        fit: BoxFit.fill,
                                      ),
                                      SizedBox(
                                        width: getHorizontalSize(18),
                                      ),
                                      Text(
                                        CommonUtils.FormatCardNumber(planetCard[x].cardNumber.toString()),
                                        style: AppStyle.textStyleDMSANS
                                            .copyWith(
                                            color: ColorConstant
                                                .primaryWhite,
                                            fontWeight:
                                            FontWeight.w500,
                                            fontSize:
                                            getFontSize(22)),
                                      ),
                                    ],
                                  ),*/
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    "asset/icons/ic_visa.svg",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        ),
      );
    }
    cardList.refresh();
    return cardList.value;
  }

  void removeCards(index) {
    cardList.value.removeAt(index);
    cardList.refresh();
    if (cardList.length == 0) {
      _generateCards();
    }
  }
}
