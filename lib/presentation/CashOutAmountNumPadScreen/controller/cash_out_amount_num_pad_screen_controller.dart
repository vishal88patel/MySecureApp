import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/utils/ConstantsFiles/string_constants.dart';
import 'package:my_secure_app/utils/HelperFiles/ui_utils.dart';

import '../../../App Configurations/color_constants.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_style.dart';
import '../../../utils/HelperFiles/math_utils.dart';

class CashOutAmountNumPadScreenController extends GetxController {
  final amountController = TextEditingController();
  var arguments = Get.arguments;
  var walletBalance = "".obs;
  var email = "".obs;
  var name = "".obs;
  var profile_pic = "".obs;
  var isPin = 0.obs;
  var isAmountAvailable = true.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    amountController.addListener(() {
      Get.closeAllSnackbars();
      if (int.parse(walletBalance.value) >= int.parse(amountController.text)) {
        Get.closeCurrentSnackbar();
        isAmountAvailable.value = true;
      } else {
        Get.closeAllSnackbars();
        UIUtils.showSnakBar(
            headerText: StringConstants.ERROR,
            bodyText: "AMount is not available");
        isAmountAvailable.value = false;
      }
    });
    getArguments();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getArguments() {
    if (arguments != null) {
      walletBalance.value = arguments['WALLET_BALANCE'] ?? '';
      // email.value = arguments['EMAIL'] ?? '';
      // name.value = arguments['NAME'] ?? '';
      // profile_pic.value = arguments['IMAGE'] ?? '';
      // isPin.value = arguments['IS_PIN'] ?? '';
    }
  }

  void goNextScreen(String type) {
    Get.back();

    Get.toNamed(AppRoutes.selectBankListScreen, arguments: {
      "TYPE":type,
      // "EMAIL":email.value,
      // "NAME":name.value,
      // "IMAGE":profile_pic.value,
      // "UUID_ID":uuid.value,
      // "AMOUNT":amountController.text,
    });
  }

  void showaccountSelectTypeBottomsheet() {
    Get.bottomSheet(
        isScrollControlled: true,
        SafeArea(
          child: Container(
            height: size.height,
            color: ColorConstant.blue26,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.close,
                          color: ColorConstant.primaryWhite,
                        )),
                    SizedBox(
                      width: 12,
                    ),
                    Text("Banking Details",
                        style: AppStyle.textStylePoppinsRegular.copyWith(
                            color: ColorConstant.primaryWhite,
                            fontWeight: FontWeight.w600,
                            fontSize: getFontSize(18))),
                    // InkWell(
                    //   onTap: () {
                    //     Get.toNamed(AppRoutes.accountDetailListScreen);
                    //   },
                    //   child: Image.asset(
                    //     'asset/icons/notification_icon.png',
                    //     height: getVerticalSize(20),
                    //     width: getHorizontalSize(16),
                    //   ),
                    // )
                  ],
                ),
                SizedBox(
                  height: getVerticalSize(25),
                ),
                InkWell(
                  onTap: () {

                    goNextScreen("1");
                  },
                  child: Container(
                    height: 100,
                    width: size.width,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: getVerticalSize(6.5)),
                      child: Container(
                        decoration: BoxDecoration(
                            color:
                                ColorConstant.primaryAppTextF1.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 12,
                            ),



                            Container(
                              padding: EdgeInsets.all(12),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: ColorConstant.primaryAppTextF1,
                                  borderRadius:
                                  BorderRadius.circular(10)),
                              child: SvgPicture.asset(
                                "asset/icons/ic_bank.svg",
                                color: ColorConstant.blue26,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text("My Banks",
                                style: AppStyle.textStylePoppinsRegular
                                    .copyWith(
                                    color: ColorConstant.primaryWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: getFontSize(18))),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    goNextScreen("2");
                  },
                  child: Container(
                    height: 100,
                    width: size.width,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: getVerticalSize(6.5)),
                      child: Container(
                        decoration: BoxDecoration(
                            color:
                                ColorConstant.primaryAppTextF1.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              padding: EdgeInsets.all(12),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: ColorConstant.primaryAppTextF1,
                                  borderRadius:
                                  BorderRadius.circular(10)),
                              child: SvgPicture.asset(
                                "asset/icons/ic_card.svg",
                                color: ColorConstant.blue26,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text("My Cards",
                                style: AppStyle.textStylePoppinsRegular
                                    .copyWith(
                                    color: ColorConstant.primaryWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: getFontSize(18))),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ));
  }
}
