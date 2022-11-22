import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/utils/ConstantsFiles/string_constants.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import 'package:my_secure_app/utils/HelperFiles/ui_utils.dart';

import '../../Custom Widgets/credit_card_widget.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';
import 'controller/select_bank_list_screen_controller.dart';

class SelectBankBankListScreen extends StatelessWidget {
  var bankListController = Get.put(SelectBankListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MainCutomBackGround(
            child: Padding(
          padding: EdgeInsets.only(
              left: getHorizontalSize(20.0),
              right: getHorizontalSize(20.0),
              top: getVerticalSize(26)),
          child: SafeArea(
            child: Stack(
              children: [
                bankListController.type == "1"
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
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
                              Text("My Banks",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(
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
                          Obx(
                            () => bankListController
                                        .getLinkedBankModel.value.data !=
                                    null
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: bankListController
                                                .getLinkedBankModel
                                                .value
                                                .data!
                                                .length >
                                            2
                                        ? 2
                                        : bankListController.getLinkedBankModel
                                            .value.data!.length,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () {
                                          onTapOfListile(context);

                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: getVerticalSize(6.5)),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: ColorConstant.blue26,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(16),
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          ColorConstant.blue26,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: SvgPicture.asset(
                                                    "asset/icons/ic_bank.svg",
                                                    color: Colors.grey,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 12,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                            bankListController
                                                                    .getLinkedBankModel
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .bankName
                                                                    .toString() +
                                                                "   " +
                                                                bankListController
                                                                    .getLinkedBankModel
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .accountNumber
                                                                    .toString()
                                                                    .substring(
                                                                        0, 4),
                                                            style: AppStyle
                                                                .textStylePoppinsRegular
                                                                .copyWith(
                                                                    color: ColorConstant
                                                                        .skyE8
                                                                        .withOpacity(
                                                                            0.5),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        getFontSize(
                                                                            18))),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                Obx(
                                                  () => bankListController
                                                              .selectedIndex
                                                              .value ==
                                                          index
                                                      ? Row(
                                                          children: [
                                                            Container(
                                                              height: 20,
                                                              width: 20,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: ColorConstant
                                                                    .skyE8
                                                                    .withOpacity(
                                                                        0.5),
                                                                border: Border.all(
                                                                    color: ColorConstant
                                                                        .blueFF),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 4,
                                                            ),
                                                            Text(
                                                              "Selected",
                                                              style: TextStyle(
                                                                  color:
                                                                      ColorConstant
                                                                          .skyE8),
                                                            )
                                                          ],
                                                        )
                                                      : SizedBox(),
                                                ),
                                                SizedBox(
                                                  width: 14,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    })
                                : Container(),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: ColorConstant.primaryWhite,
                                  )),
                              SizedBox(
                                width: 12,
                              ),
                              Text("My Linked Cards",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w600,
                                          fontSize: getFontSize(18))),
                            ],
                          ),
                          SizedBox(
                            height: getVerticalSize(25),
                          ),
                          Expanded(
                            child: Obx(
                              () => bankListController
                                          .cardListModel.value.data !=
                                      null
                                  ? ListView.builder(
                                      itemCount: bankListController
                                          .mainCardList.length,
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: getVerticalSize(6.5)),
                                          child: InkWell(
                                            onTap: () {
                                              onTapOfListile(context);
                                            },
                                            child: CreditCardWidget(
                                                cardHolderName:
                                                    bankListController
                                                        .mainCardList
                                                        .value[index]
                                                        .holderName
                                                        .toString(),
                                                cardNumber: bankListController
                                                    .mainCardList
                                                    .value[index]
                                                    .cardNumber
                                                    .toString(),
                                                expiryDate: bankListController
                                                        .mainCardList
                                                        .value[index]
                                                        .expireMonth
                                                        .toString() +
                                                    "/" +
                                                    bankListController
                                                        .mainCardList
                                                        .value[index]
                                                        .expireYear
                                                        .toString()),
                                            // holderName
                                            // cardNumber
                                            // expireYear
                                            // expireMonth
                                          ),
                                        );
                                      })
                                  : Container(),
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(25),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        )),
      ],
    ));
  }

  void onTapOfListile(BuildContext context) {
    bankListController.WithdrawErrorApi();
    UIUtils.showProgressDialog(isCancellable: true);
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
}
