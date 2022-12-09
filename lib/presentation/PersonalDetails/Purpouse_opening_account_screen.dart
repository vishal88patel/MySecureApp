import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:secureapp/App%20Configurations/color_constants.dart';
import 'package:secureapp/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secureapp/Custom%20Widgets/app_textField.dart';
import 'package:secureapp/presentation/PersonalDetails/controller/personal_detail_screen_controller.dart';
import 'package:secureapp/theme/app_style.dart';
import 'package:secureapp/utils/HelperFiles/math_utils.dart';

class PurpouseAccountScreen extends StatelessWidget {
  var personalDetailController = Get.find<PersonalScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
                  children: [
                    Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getHorizontalSize(20.0),
                              vertical: getVerticalSize(20)),
                          child: SafeArea(
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: getVerticalSize(10),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                    color:
                                                    ColorConstant.backBorder)),
                                            padding: EdgeInsets.all(6),
                                            child: Icon(
                                              Icons.arrow_back_ios_new_outlined,size: 22,),
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
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                              border: Border.all(color: Colors.transparent)),
                                          padding: EdgeInsets.all(10),
                                          child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.transparent,),
                                        ),                      ],
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(57),
                                    ),
                                    Center(
                                      child: SvgPicture.asset(
                                        "asset/icons/splash_image.svg",

                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(40),
                                    ),

                                    SizedBox(
                                      height: getVerticalSize(5),
                                    ),
                                    Text(
                                      "Purpouse Of Opening Account",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.darkBlue,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(32)),

                                    ),


                                    SizedBox(
                                      height: getVerticalSize(30),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Obx(
                                                () => InkWell(
                                              onTap: () {
                                                personalDetailController
                                                    .onTapOfBorroeOrPErsonalLoan("borrow_loan");
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                                    color: personalDetailController
                                                        .purposeOfOpeningAcc.value ==
                                                        "borrow_loan"
                                                        ? ColorConstant.buttonGreen
                                                        : Colors.transparent,
                                                    border: Border.all(
                                                        color: personalDetailController
                                                            .purposeOfOpeningAcc.value ==
                                                            "borrow_loan"
                                                            ? ColorConstant.buttonGreen
                                                            : ColorConstant.darkBlue,)),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: getHorizontalSize(16),
                                                      vertical: getVerticalSize(12)),
                                                  child: Text('Borrow Loan',
                                                      textAlign: TextAlign.center,

                                                      style: AppStyle.DmSansFont
                                                          .copyWith(
                                                          color: personalDetailController
                                                              .purposeOfOpeningAcc
                                                              .value ==
                                                              "borrow_loan"
                                                              ? ColorConstant.primaryWhite
                                                              : ColorConstant
                                                              .darkBlue,
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: getFontSize(16))),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: getHorizontalSize(11),
                                        ),
                                        Expanded(
                                          child: Obx(
                                                () => InkWell(
                                              onTap: () {
                                                personalDetailController
                                                    .onTapOfBorroeOrPErsonalLoan(
                                                    "using_wallet_service");
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(Radius.circular(10)),

                                                    color: personalDetailController
                                                        .purposeOfOpeningAcc.value ==
                                                        "using_wallet_service"
                                                        ? ColorConstant.buttonGreen
                                                        : Colors.transparent,
                                                    border: Border.all(
                                                        color:personalDetailController
                                                            .purposeOfOpeningAcc.value ==
                                                            "using_wallet_service"
                                                            ? ColorConstant.buttonGreen
                                                      : ColorConstant.darkBlue,)),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: getHorizontalSize(16),
                                                      vertical: getVerticalSize(12)),
                                                  child: Text('Using Wallet Service',
                                                      textAlign: TextAlign.center,
                                                      style: AppStyle.DmSansFont
                                                          .copyWith(
                                                          color: personalDetailController
                                                              .purposeOfOpeningAcc
                                                              .value ==
                                                              "using_wallet_service"
                                                              ? ColorConstant.primaryWhite
                                                              : ColorConstant
                                                              .darkBlue,
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: getFontSize(16))),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(22),
                                    ),
                                    // Wrap(
                                    //   children:  payment.map((i) =>
                                    //     Row(
                                    //       children: [
                                    //
                                    //         Row(
                                    //           children: [
                                    //             Container(  width: getHorizontalSize(9),
                                    //               height: getVerticalSize(9),
                                    //               decoration: BoxDecoration( color: Colors.transparent,
                                    //                   borderRadius: BorderRadius.circular(100),
                                    //                   border: Border.all(color: ColorConstant.primaryAppTextF1)
                                    //               ),),
                                    //             Text(i),
                                    //           ],
                                    //         ),
                                    //         // Text('Emily Fortuna'),
                                    //         // Text('Filip Hráček'),
                                    //       ],
                                    //     )).toList(),
                                    //
                                    //
                                    // ),
                                    Obx(
                                          () => personalDetailController
                                          .purposeOfOpeningAcc.value ==
                                          "using_wallet_service" || personalDetailController
                                          .purposeOfOpeningAcc.value ==
                                          ""
                                          ? Container()
                                          : Wrap(
                                        alignment: WrapAlignment.start,
                                        children: personalDetailController.loanList.value
                                            .map((i) => Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: getVerticalSize(8)),
                                          child: InkWell(
                                            onTap: () {
                                              personalDetailController
                                                  .onTapOnLoanTile(i.id);
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
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
                                                ),
                                                SizedBox(
                                                  width: getHorizontalSize(7),
                                                ),
                                                Text(
                                                  i.name.toString(),
                                                  style: AppStyle
                                                      .DmSansFont
                                                      .copyWith(
                                                      color: ColorConstant
                                                          .darkBlue,
                                                      fontSize:
                                                      getFontSize(14)),
                                                ),
                                                SizedBox(
                                                  width: getHorizontalSize(10),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ))
                                            .toList(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(40),
                                    ),
                                    AppElevatedButton(
                                      buttonName: 'Register',
                                      onPressed: () {
                                        personalDetailController.onClickOfRegisterButton();
                                        // Get.toNamed(AppRoutes.dashBoardScreen);
                                      },
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                  ],
                ))));
  }
}
