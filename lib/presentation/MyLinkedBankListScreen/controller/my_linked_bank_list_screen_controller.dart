import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lpinyin/lpinyin.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/presentation/test.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../Custom Widgets/app_ElevatedButton .dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_style.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../HomeScreen/model/get_linked_bank.dart';
import '../Model/get_bank_list.dart';

class MyLinkedBankListScreenController extends GetxController {
  var getBankModel = GetBankList().obs;
  var isBankSelected = 0.obs;
  var contacts = <ContactInfo>[].obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    callGetLinkedBankApi();
    // loadData();
    super.onInit();
  }

  void selectBank(var index) {
    isBankSelected.value = index;
  }

  void selectBankOnTap(BuildContext context,
      {bankId, bankName, bankUrl, bankScript, bankImage}) {
    Get.dialog(
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getHorizontalSize(40)),
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Wrap(
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: ColorConstant
                              .primaryWhite,
                          borderRadius:
                          const BorderRadius.all(
                              Radius.circular(15))),
                      margin: const EdgeInsets.only(
                          bottom: 20),
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      constraints: const BoxConstraints(
                          minWidth: 180),
                      child: Column(
                        children: [


                          const SizedBox(
                            height: 60,
                          ),
                          Container(
                              padding: const EdgeInsets
                                  .fromLTRB(
                                  0, 10, 0, 0),
                              child: Text(
                                "Do you want to link ${bankName} \nwith My Secure App?",
                                textAlign:
                                TextAlign.center,
                                style: AppStyle
                                    .DmSansFont
                                    .copyWith(
                                    fontSize: getFontSize(18),
                                    color: ColorConstant
                                        .darkBlue),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalSize(40)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: getVerticalSize(50),

                                  child: AppElevatedButton(
                                    buttonColor: ColorConstant
                                        .appProgressBarColor,
                                    buttonName: 'Cancel',
                                    radius: 10,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },),
                                ),
                                SizedBox(height: getVerticalSize(10),),
                                SizedBox(
                                  height: getVerticalSize(50),
                                  child: AppElevatedButton(
                                    buttonColor: ColorConstant
                                        .primaryLightGreen,
                                    buttonName: 'ok',
                                    radius: 10,
                                    onPressed: () {
                                      Navigator.pop(context);
                                      onClickOfNextButtonForAndroid(
                                          bankId: bankId, bankImage:bankImage, bankName:bankName,
                                          bankScript:bankScript, bankUrl:bankUrl);
                                    },),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: getVerticalSize(-50),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorConstant.primaryWhite,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            "asset/icons/bank1_image.png", height: 60,),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

  Future<void> onClickOfNextButtonForAndroid(
      {bankId, bankName, bankUrl, bankScript, bankImage}) async {
    final status = await Permission.manageExternalStorage.request();
    if (status == PermissionStatus.granted) {
      Get.toNamed(AppRoutes.collectDetailScreen, arguments: {
        'BANK_ID': bankId,
        'BANK_NAME': bankName,
        'BANK_URL': bankUrl,
        'BANK_JS': bankScript,
        'BANK_IMAGE': bankImage,
      });
    } else if (status == PermissionStatus.denied) {
      UIUtils.showSnakBar(
          bodyText: "Please allow permission",
          headerText: StringConstants.ERROR);
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Take the user to the settings page.');
      await openAppSettings();
    }
  }

  void loadData() async {
    getBankModel.value.data!.banks!.forEach((element) {
      contacts.add(ContactInfo(name: element.name.toString(),
          id: "",
          bgColor: Colors.red,
          firstletter: element.name.toString().substring(0, 1),
          img: "",
          namePinyin: "",
          tagIndex: ""));
      handleList(contacts);
    });
  }

  void handleList(List<ContactInfo> list) {
    if (list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = "#";
      }
    }
    // A-Z sort.
    SuspensionUtil.sortListBySuspensionTag(contacts);

    // show sus tag.
    SuspensionUtil.setShowSuspensionStatus(contacts);

    contacts.refresh();
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }

  List<String> countries = [
    "Nepal",
    "India",
    "Pakistan",
    "Bangladesh",
    "USA",
    "Canada",
    "China",
    "Russia",
    "Nepal",
    "India",
    "Pakistan",
    "Bangladesh",
    "USA",
    "Canada",
    "China",
    "Russia",
  ];


  Future<void> callGetLinkedBankApi() async {
    ApiService()
        .callGetApi(
        body: await getBankApiBody(),
        headerWithToken: true,
        showLoader: true,
        url: ApiEndPoints.GET_BANK_API)
        .then((value) {
      print(value);
      if (value['status'] ?? false) {
        getBankModel.value = GetBankList.fromJson(value);
        loadData();
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

  Widget buildListItem(ContactInfo model) {
    String susTag = model.getSuspensionTag();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Offstage(
              offstage: model.isShowSuspension != true,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$susTag',
                    textScaleFactor: 1.2,
                    style: AppStyle.DmSansFont.copyWith(
                        color: ColorConstant.grey8F,
                        fontWeight: FontWeight.w500,
                        fontSize: getFontSize(16)),
                  ),
                  const Divider(),
                ],
              )
          ),

          Text(
            model.name,
            style: AppStyle.DmSansFont.copyWith(
                color: ColorConstant.primaryBlack,
                fontWeight: FontWeight.w500,
                fontSize: getFontSize(16)),
          ),

          const Divider()
        ],
      ),
    );
  }

  Decoration getIndexBarDecoration(Color color) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.grey[300]!, width: .5));
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
                  style: AppStyle.textStyleDMSANS.copyWith(
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
                        style: AppStyle.textStyleDMSANS.copyWith(
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
                        style: AppStyle.textStyleDMSANS.copyWith(
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
                        style: AppStyle.textStyleDMSANS.copyWith(
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
                        style: AppStyle.textStyleDMSANS.copyWith(
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
}
