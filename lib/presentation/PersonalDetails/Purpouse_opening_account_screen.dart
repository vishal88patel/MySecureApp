import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/presentation/PersonalDetails/controller/personal_detail_screen_controller.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

class PurpouseAccountScreen extends StatelessWidget {
  var personalDetailController = Get.find<PersonalScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                color: ColorConstant.buttonGreen.withOpacity(0.3),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: getVerticalSize(20)),
                      child: SafeArea(
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: getVerticalSize(10),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(20.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: ColorConstant
                                                      .backBorder)),
                                          padding: EdgeInsets.all(6),
                                          child: Icon(
                                            Icons.arrow_back_ios_new_outlined,
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "                 ",
                                        style: AppStyle.DmSansFont.copyWith(
                                            color: ColorConstant.darkBlue,
                                            fontWeight: FontWeight.w700,
                                            fontSize: getFontSize(20)),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                                color: Colors.transparent)),
                                        padding: EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.arrow_back_ios_new_outlined,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: getVerticalSize(80),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                        ),
                                        color: ColorConstant.primaryWhite),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: getHorizontalSize(20.0)),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: getVerticalSize(150),
                                        ),
                                        Text(
                                          "Purpouse Of Opening Account",
                                          style: AppStyle.DmSansFont.copyWith(
                                              color: ColorConstant.darkBlue,
                                              fontWeight: FontWeight.w700,
                                              fontSize: getFontSize(26)),
                                        ),
                                        SizedBox(
                                          height: getVerticalSize(30),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  getHorizontalSize(30)),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: personalDetailController
                                                              .purposeOfOpeningAcc
                                                              .value ==
                                                          "using_wallet_service" ||
                                                      personalDetailController
                                                              .purposeOfOpeningAcc
                                                              .value ==
                                                          ""
                                                  ? Colors.transparent
                                                  : ColorConstant.greyF4,
                                            ),
                                            child: Column(
                                              children: [
                                                Obx(
                                                  () => InkWell(
                                                    onTap: () {
                                                      personalDetailController
                                                          .onTapOfBorroeOrPErsonalLoan(
                                                              "borrow_loan");
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.only(
                                                              topRight:
                                                                  Radius.circular(
                                                                      10),
                                                              topLeft: Radius.circular(
                                                                  10),
                                                              bottomLeft: Radius.circular(
                                                                  personalDetailController.purposeOfOpeningAcc.value == "using_wallet_service" || personalDetailController.purposeOfOpeningAcc.value == ""
                                                                      ? 10
                                                                      : 0),
                                                              bottomRight:
                                                                  Radius.circular(
                                                                      personalDetailController.purposeOfOpeningAcc.value == "using_wallet_service" || personalDetailController.purposeOfOpeningAcc.value == ""
                                                                          ? 10
                                                                          : 0)),
                                                          color: personalDetailController
                                                                      .purposeOfOpeningAcc
                                                                      .value ==
                                                                  "borrow_loan"
                                                              ? ColorConstant.buttonGreen
                                                              : Colors.transparent,
                                                          border: Border.all(
                                                            color: personalDetailController
                                                                        .purposeOfOpeningAcc
                                                                        .value ==
                                                                    "borrow_loan"
                                                                ? ColorConstant
                                                                    .buttonGreen
                                                                : ColorConstant
                                                                    .buttonGreen,
                                                          )),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical:
                                                                    getVerticalSize(
                                                                        20)),
                                                        child: Text('Borrow Loan',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: AppStyle.DmSansFont.copyWith(
                                                                color: personalDetailController
                                                                            .purposeOfOpeningAcc.value ==
                                                                        "borrow_loan"
                                                                    ? ColorConstant
                                                                        .primaryWhite
                                                                    : ColorConstant
                                                                        .darkBlue,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize:
                                                                    getFontSize(
                                                                        16))),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: getVerticalSize(15),
                                                ),
                                                Obx(
                                                  () => personalDetailController
                                                                  .purposeOfOpeningAcc
                                                                  .value ==
                                                              "using_wallet_service" ||
                                                          personalDetailController
                                                                  .purposeOfOpeningAcc
                                                                  .value ==
                                                              ""
                                                      ? Container()
                                                      : ListView(
                                                          shrinkWrap: true,
                                                          children:
                                                              personalDetailController
                                                                  .loanList
                                                                  .value
                                                                  .map((i) =>
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.symmetric(vertical: getVerticalSize(5)),
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            personalDetailController.onTapOnLoanTile(i.id);
                                                                          },
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.symmetric(horizontal: getHorizontalSize(50)),
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Icon(
                                                                                  personalDetailController.selectedLoanId.value == i.id.toString() ? Icons.check_box : Icons.check_box_outline_blank_outlined,
                                                                                  color: personalDetailController.selectedLoanId.value == i.id.toString() ? ColorConstant.buttonGreen : Colors.black.withOpacity(0.5),
                                                                                  size: 24,
                                                                                ),
                                                                                /*Container(
                                                            width: getHorizontalSize(22),
                                                            height: getVerticalSize(22),
                                                            decoration: BoxDecoration(
                                                                  color: personalDetailController
                                                                      .selectedLoanId
                                                                      .value ==
                                                                      i.id.toString()
                                                                      ? ColorConstant
                                                                      .buttonGreen
                                                                      : Colors.transparent,
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      100),
                                                                  border: Border.all(
                                                                      color: personalDetailController
                                                                          .selectedLoanId
                                                                          .value ==
                                                                          i.id.toString()?
                                                                      ColorConstant
                                                                          .buttonGreen:Colors.black)),
                                                          ),*/
                                                                                SizedBox(
                                                                                  width: getHorizontalSize(9),
                                                                                ),
                                                                                Text(
                                                                                  i.name.toString(),
                                                                                  style: AppStyle.DmSansFont.copyWith(color: ColorConstant.darkBlue, fontSize: getFontSize(22)),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: getHorizontalSize(10),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ))
                                                                  .toList(),
                                                        ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: getVerticalSize(15),
                                        ),
                                        Obx(
                                          () => Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    getHorizontalSize(30)),
                                            child: InkWell(
                                              onTap: () {
                                                personalDetailController
                                                    .onTapOfBorroeOrPErsonalLoan(
                                                        "using_wallet_service");
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    color: personalDetailController
                                                                .purposeOfOpeningAcc
                                                                .value ==
                                                            "using_wallet_service"
                                                        ? ColorConstant
                                                            .buttonGreen
                                                        : Colors.transparent,
                                                    border: Border.all(
                                                        color: ColorConstant
                                                            .buttonGreen)),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical:
                                                          getVerticalSize(20)),
                                                  child: Text(
                                                      'Using Wallet Service',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: AppStyle.DmSansFont.copyWith(
                                                          color: personalDetailController
                                                                      .purposeOfOpeningAcc
                                                                      .value ==
                                                                  "using_wallet_service"
                                                              ? ColorConstant
                                                                  .primaryWhite
                                                              : ColorConstant
                                                                  .darkBlue,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize:
                                                              getFontSize(16))),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: getVerticalSize(60),
                                        ),
                                        AppElevatedButton(
                                          buttonName: 'Register',
                                          onPressed: () {
                                            personalDetailController
                                                .onClickOfRegisterButton();
                                            // Get.toNamed(AppRoutes.dashBoardScreen);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              right: 0,
                              left: 0,
                              top: getVerticalSize(50),
                              child: Center(
                                  child: Image.asset(
                                'asset/icons/r_image.png',
                                height: getVerticalSize(220),
                              )),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ))));
  }
}
