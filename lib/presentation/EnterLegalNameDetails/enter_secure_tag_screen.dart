import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_textField.dart';
import 'package:secure_cash_app/presentation/loader_screen.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/ui_utils.dart';
import 'controller/enter_legel_name_screen_controller.dart';
import 'enter_middle_name_screen.dart';

class EnterSecureTagScreen extends StatefulWidget {
  @override
  State<EnterSecureTagScreen> createState() => _EnterSecureTagScreenState();
}

class _EnterSecureTagScreenState extends State<EnterSecureTagScreen> {
  // var enterLegelNameController = Get.find<EnterLegalNameScreenController>();
  var enterLegelNameController = Get.put(EnterLegalNameScreenController());
@override
  void initState() {
  enterLegelNameController. getCashTagSuggestio();
    super.initState();
  }
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
                    padding: EdgeInsets.only(
                        top: getVerticalSize(20)),
                    child: SafeArea(
                      child: Stack(
                        children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
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
                                          Icons.arrow_back_ios_new_outlined,
                                          size: 22,),
                                      ),
                                    ),
                                    Text(
                                      "Enter Your SecureTag",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.primaryBlack,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(20)),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              12),
                                          border: Border.all(
                                              color: Colors.transparent)),
                                      padding: EdgeInsets.all(10),
                                      child: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        color: Colors.transparent,),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: getVerticalSize(120),
                              ),


                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      ),
                                      color: ColorConstant.primaryWhite
                                  ),

                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        height: getVerticalSize(130),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: getHorizontalSize(20)),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              "Your unique name for getting paid by anyone",
                                              style: AppStyle.DmSansFont
                                                  .copyWith(
                                                  color: ColorConstant.grey8F,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: getFontSize(18)),
                                            ),

                                            SizedBox(
                                              height: getVerticalSize(30),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width:12,
                                                  child: AppTextField(
                                                      hintText: '',
                                                    controller:enterLegelNameController.dollarController,
                                                    readOnly: true,
                                                    fontSize: 22,
                                                      ),
                                                ),
                                                Expanded(
                                                  child: AppTextField(
                                                      hintText: 'SecureTag',
                                                      fontSize: 22,
                                                      controller: enterLegelNameController.secureTagController),
                                                ),

                                              ],
                                            ),

                                            SizedBox(
                                              height: getVerticalSize(54),
                                            ),
                                            Text(
                                              "Your can choose some unique cashtag from below",
                                              style: AppStyle.DmSansFont
                                                  .copyWith(
                                                  color: ColorConstant.grey8F,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: getFontSize(18)),
                                            ),
                                            Container(
                                              child: GridView.builder(
                                                shrinkWrap: true,
                                                itemCount: 3,
                                                gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  childAspectRatio: 2,
                                                ),
                                                itemBuilder: (BuildContext context, int i) {
                                                  return Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        vertical: getVerticalSize(8)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        enterLegelNameController
                                                            .onTapOnLoanTenure(
                                                            enterLegelNameController
                                                                .loanTenuteList
                                                                .value[i]
                                                                .id!
                                                                .toInt(),
                                                            enterLegelNameController
                                                                .loanTenuteList
                                                                .value[i]
                                                                .name
                                                                .toString());
                                                      },
                                                      child: Obx(
                                                            () => Padding(
                                                          padding: const EdgeInsets.all(4.0),
                                                          child: enterLegelNameController
                                                              .loanTenuteList
                                                              .value.isNotEmpty?Container(
                                                            width: size.width / 3.5,
                                                            decoration: BoxDecoration(
                                                                color: enterLegelNameController
                                                                    .selectedLoanTenureId
                                                                    .value
                                                                    .toString() ==
                                                                    enterLegelNameController
                                                                        .loanTenuteList
                                                                        .value[i]
                                                                        .id
                                                                        .toString()
                                                                    ? ColorConstant
                                                                    .primaryLightGreen
                                                                    : ColorConstant.greenF3
                                                                    .withOpacity(0.5),
                                                                borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(10))),
                                                            child: Padding(
                                                              padding: EdgeInsets.only(
                                                                  left: getHorizontalSize(10),
                                                                  right:
                                                                  getHorizontalSize(10),
                                                                  top: getHorizontalSize(10),
                                                                  bottom:
                                                                  getHorizontalSize(10)),
                                                              child: Center(
                                                                child: Text(
                                                                  enterLegelNameController
                                                                      .loanTenuteList
                                                                      .value[i]
                                                                      .name
                                                                      .toString(),
                                                                  style: AppStyle.DmSansFont.copyWith(
                                                                      color: enterLegelNameController
                                                                          .selectedLoanTenureId
                                                                          .value
                                                                          .toString() ==
                                                                          enterLegelNameController
                                                                              .loanTenuteList
                                                                              .value[i]
                                                                              .id
                                                                              .toString()
                                                                          ? ColorConstant
                                                                          .primaryWhite
                                                                          : ColorConstant
                                                                          .grey8F,
                                                                      fontWeight:
                                                                      FontWeight.w400,
                                                                      fontSize:
                                                                      getFontSize(16)),
                                                                ),
                                                              ),
                                                            ),
                                                          ):Container(),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: getVerticalSize(54),
                                            ),
                                            AppElevatedButton(
                                              buttonName: 'Next',
                                              onPressed: () {
                                                if (enterLegelNameController
                                                    .secureTagController.text
                                                    .isEmpty) {
                                                  UIUtils.showSnakBar(
                                                      bodyText: "Please enter your SecureTag",
                                                      headerText: StringConstants
                                                          .ERROR);
                                                } else {
                                                  enterLegelNameController
                                                      .checkCashTagValidation();

                                                }
                                              },
                                            ),

                                            SizedBox(
                                              height: getVerticalSize(36),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),


                          Positioned(right: 10,
                            top: getVerticalSize(60),
                            child: Center(
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                                  child: Image.asset(
                                    'asset/icons/name_image.jpg',
                                    height: getVerticalSize(220),),
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
