import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_AppBar%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';

import '../../App Configurations/color_constants.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/pref_utils.dart';
import 'controller/top_with_credit_card_controller.dart';

class TopWithCreditCardScreen extends StatelessWidget {
  var topWithCreditCardScreenController =
      Get.find<TopWithCreditCardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: Container(
        width: size.width,
        child:  PrefUtils.getString(StringConstants.IS_KYC_DONE) == "4"?SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: getVerticalSize(
                  420.00,
                ),
                width: size.width,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(45),
                          bottomRight: Radius.circular(45)),
                      child: Image.asset(
                        "asset/icons/ic_noti_background.png",
                        width: MediaQuery.of(context).size.width,
                        height: getVerticalSize(
                          500.00,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              AppAppBar(
                                title: "Top Up",
                                icon1: "asset/icons/ic_back.svg",
                                icon2: "asset/icons/ic_notification.svg",
                                onPressedIcon1: () {
                                  Get.back();
                                },
                                onPressedIcon2: () {
                                  Get.toNamed(AppRoutes.notificationScreen);
                                },
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Credit Card",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.DmSansFont.copyWith(
                                                color:
                                                    ColorConstant.primaryWhite,
                                                fontSize: getFontSize(22),
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 7,
                                              right: 10,
                                            ),
                                            child: Text(
                                              "Choose your credit card",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style:
                                                  AppStyle.DmSansFont.copyWith(
                                                      color: ColorConstant
                                                          .naturalGrey,
                                                      fontSize: getFontSize(20),
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Image.asset(
                                        'asset/icons/ic_plus_orange.png',
                                        height: getVerticalSize(50),
                                        width: getHorizontalSize(50),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: getVerticalSize(26),
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(horizontal: 0),
                          color: ColorConstant.naturalBlack.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: getHorizontalSize(300),
                                height: getVerticalSize(20),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Card(
                            margin: const EdgeInsets.symmetric(horizontal: 0),
                            color: ColorConstant.primaryLightGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: getHorizontalSize(350),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: getHorizontalSize(20),
                                        right: getHorizontalSize(20),
                                        top: getVerticalSize(20)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Balance",
                                              style: AppStyle.textStyleDMSANS
                                                  .copyWith(
                                                      color: ColorConstant
                                                          .primaryWhite,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize:
                                                          getFontSize(18)),
                                            ),
                                            SvgPicture.asset(
                                              "asset/icons/ic_card_logo.svg",
                                              fit: BoxFit.fill,
                                            ),
                                          ],
                                        ),
                                        Obx(
                                          () => Text(
                                            NumberFormat.currency(name: '\$ ')
                                                .format(int.parse(
                                                    topWithCreditCardScreenController
                                                        .balance.value)),
                                            // "\$26,968.00",
                                            style: AppStyle.textStyleDMSANS
                                                .copyWith(
                                                    color: ColorConstant
                                                        .primaryWhite,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: getFontSize(28)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: getHorizontalSize(15),
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              "asset/icons/ic_chip.svg",
                                              fit: BoxFit.fill,
                                            ),
                                            SizedBox(
                                              width: getHorizontalSize(12),
                                            ),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                            ),
                                            SizedBox(
                                              width: getHorizontalSize(6),
                                            ),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                            ),
                                            SizedBox(
                                              width: getHorizontalSize(6),
                                            ),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                            ),
                                            SizedBox(
                                              width: getHorizontalSize(6),
                                            ),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                            ),
                                            SizedBox(
                                              width: getHorizontalSize(12),
                                            ),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                            ),
                                            SizedBox(
                                              width: getHorizontalSize(6),
                                            ),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                            ),
                                            SizedBox(
                                              width: getHorizontalSize(6),
                                            ),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                            ),
                                            SizedBox(
                                              width: getHorizontalSize(6),
                                            ),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                            ),
                                            SizedBox(
                                              width: getHorizontalSize(12),
                                            ),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                            ),
                                            SizedBox(
                                              width: getHorizontalSize(6),
                                            ),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                            ),
                                            SizedBox(
                                              width: getHorizontalSize(6),
                                            ),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                            ),
                                            SizedBox(
                                              width: getHorizontalSize(6),
                                            ),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                            ),
                                            SizedBox(
                                              width: getHorizontalSize(12),
                                            ),
                                            Text(
                                              '3711',
                                              style: AppStyle.textStyleDMSANS
                                                  .copyWith(
                                                      color: ColorConstant
                                                          .primaryWhite,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize:
                                                          getFontSize(20)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getVerticalSize(20),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Set amount",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.DmSansFont.copyWith(
                          color: ColorConstant.naturalBlack,
                          fontSize: getFontSize(20),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: getVerticalSize(5),
                    ),
                    Text(
                      "How much would you like to top up?",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.DmSansFont.copyWith(
                          color: ColorConstant.grey8F,
                          fontSize: getFontSize(18),
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: getVerticalSize(15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IntrinsicWidth(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "\$",
                                style: AppStyle.textStyleDMSANS.copyWith(
                                    color: ColorConstant.primaryLightGreen,
                                    fontWeight: FontWeight.w500,
                                    fontSize: getFontSize(30)),
                              ),
                              IntrinsicWidth(
                                child: TextFormField(
                                  textAlign: TextAlign.start,
                                  controller:
                                      topWithCreditCardScreenController.amountController,
                                  decoration: InputDecoration(
                                    hintText: 'Amount',
                                    hintStyle: AppStyle.DmSansFont.copyWith(
                                        color: ColorConstant.grey8F,
                                        fontWeight: FontWeight.w400,
                                        fontSize: getFontSize(24)),
                                    border: InputBorder.none
                                    /*enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorConstant.primaryWhite.withOpacity(0.5),
                                          width: 1),
                                    ),*/
                                    /*focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorConstant.grey8F.withOpacity(0.5),
                                          width: 1),
                                    ),*/
                                  ),
                                  keyboardType: TextInputType.phone,
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.naturalBlack,
                                      fontWeight: FontWeight.w700,
                                      fontSize: getFontSize(30)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(height: 1,color: ColorConstant.grey8F.withOpacity(0.5),),
                    SizedBox(
                      height: getVerticalSize(20),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getHorizontalSize(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(()=>
                              GestureDetector(
                                onTap: (){
                                  if(topWithCreditCardScreenController.opt1.value==true){
                                    topWithCreditCardScreenController.opt1.value=false;
                                  }else{
                                    topWithCreditCardScreenController.opt1.value=true;
                                    topWithCreditCardScreenController.opt2.value=false;
                                    topWithCreditCardScreenController.opt3.value=false;
                                    topWithCreditCardScreenController.amountController.text="100";
                                  }

                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color:topWithCreditCardScreenController.opt1.value? ColorConstant.primaryLightGreen:ColorConstant.buttonGreen
                                          .withOpacity(0.15)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: getHorizontalSize(25),
                                        vertical: getVerticalSize(7)),
                                    child: Text(
                                      "\$100.00",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color:topWithCreditCardScreenController.opt1.value?ColorConstant.primaryWhite:ColorConstant.buttonGreen,
                                          fontSize: getFontSize(16),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                          ),
                          Obx(()=> GestureDetector(
                            onTap: (){
                              if(topWithCreditCardScreenController.opt2.value==true){
                                topWithCreditCardScreenController.opt2.value=false;
                              }else{
                                topWithCreditCardScreenController.amountController.text="200";
                                topWithCreditCardScreenController.opt2.value=true;
                                topWithCreditCardScreenController.opt1.value=false;
                                topWithCreditCardScreenController.opt3.value=false;
                              }

                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color:topWithCreditCardScreenController.opt2.value? ColorConstant.primaryLightGreen:ColorConstant.buttonGreen
                                      .withOpacity(0.15)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(25),
                                    vertical: getVerticalSize(7)),
                                child: Text(
                                  "\$200.00",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color:topWithCreditCardScreenController.opt2.value?ColorConstant.primaryWhite:ColorConstant.buttonGreen,
                                      fontSize: getFontSize(16),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          ),
                          Obx(()=> GestureDetector(
                            onTap: (){
                              if(topWithCreditCardScreenController.opt3.value==true){
                                topWithCreditCardScreenController.opt3.value=false;
                              }else{
                                topWithCreditCardScreenController.amountController.text="500";
                                topWithCreditCardScreenController.opt3.value=true;
                                topWithCreditCardScreenController.opt1.value=false;
                                topWithCreditCardScreenController.opt2.value=false;
                              }

                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color:topWithCreditCardScreenController.opt3.value? ColorConstant.primaryLightGreen:ColorConstant.buttonGreen
                                      .withOpacity(0.15)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(25),
                                    vertical: getVerticalSize(7)),
                                child: Text(
                                  "\$500.00",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color:topWithCreditCardScreenController.opt3.value?ColorConstant.primaryWhite:ColorConstant.buttonGreen,
                                      fontSize: getFontSize(16),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(150),
                    ),
                    AppElevatedButton(
                        buttonName: 'Top Up Now',
                        textColor: ColorConstant.primaryWhite,
                        onPressed: () {
                          topWithCreditCardScreenController.onNext(context);

                          // Get.to(
                          //   LoaderScreen("",AppRoutes.creatPasswordScreen),
                          //   transition: Transition.rightToLeft,
                          //   duration: Duration(milliseconds: 400),
                          // );
                        }),
                    SizedBox(
                      height: getVerticalSize(15),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Back to home",
                          style: AppStyle.DmSansFont.copyWith(
                              color: ColorConstant.naturalGrey,
                              fontSize: getFontSize(18),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ):SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getHorizontalSize(26.0),
                          vertical: getVerticalSize(26)),
                      child: SafeArea(
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                      "",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.primaryBlack,
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
                                  height: getVerticalSize(10),
                                ),
                                Center(
                                  child: Text(
                                    "Top Up",
                                    style: AppStyle.DmSansFont
                                        .copyWith(
                                        color: ColorConstant.darkBlue,
                                        fontWeight: FontWeight.w700,
                                        fontSize: getFontSize(32)),
                                  ),
                                ),
                                Spacer(),
                                PrefUtils.getString(StringConstants.IS_KYC_DONE) == "3"? Text(
                                  "Your Kyc is Pending !!! Please Wait Until Approval",
                                  style: AppStyle.DmSansFont
                                      .copyWith(
                                      color: ColorConstant.darkBlue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: getFontSize(20)),
                                ):Text(
                                  "Please Complete your kyc to proceed with your cash out",
                                  style: AppStyle.DmSansFont
                                      .copyWith(
                                      color: ColorConstant.darkBlue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: getFontSize(20)),
                                ),
                                SizedBox(
                                  height: getVerticalSize(50),
                                ),
                                PrefUtils.getString(StringConstants.IS_KYC_DONE) == "3"?Container():AppElevatedButton(
                                    buttonName: 'Proceed to Kyc',
                                    radius: 5,
                                    onPressed: () {
                                      PrefUtils.getString(StringConstants.IS_KYC_DONE)=="0"?
                                      Get.toNamed(AppRoutes.kycEmailScreen):Get.toNamed(AppRoutes.kycSelectStepScreen);
                                    }),
                                SizedBox(
                                  height: getVerticalSize(20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('asset/icons/img_error_404.png',
                              height: MediaQuery.of(context).size.height/2.5,
                              width: MediaQuery.of(context).size.width/1.25,

                            ),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(40),
                        ),
                      ],
                    ),
                  ],
                ))),
      ),
    );
  }
}
