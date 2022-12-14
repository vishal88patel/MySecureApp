
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_AppBar%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/presentation/EnterPersonalDetails/nam_pad.dart';
import 'package:secure_cash_app/presentation/RequestMoneyScreen/controller/request_money_screen_controller.dart';
import 'package:secure_cash_app/presentation/TransferScreen/controller/transfer_screen_controller.dart';
import 'package:secure_cash_app/presentation/TransferToUserScreen/controller/transfer_to_user_screen_controller.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';

class RequestToScreen extends StatelessWidget {
  var requestMoneyScreenController = Get.find<RequestMoneyScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getVerticalSize(10),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                child: Row(
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
                      "Request to",
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
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - getVerticalSize(110),
                    child: Column(mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: getVerticalSize(40),
                        ),
                        Center(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset('asset/icons/profile_image.png',
                                height: getVerticalSize(100),)),
                        ),
                        SizedBox(
                          height: getVerticalSize(20),
                        ),
                        Center(
                          child: Text(
                            "Requesting to Dianna Rushell",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: AppStyle.DmSansFont.copyWith(
                                color: ColorConstant.grey8F,
                                fontSize: getFontSize(20),
                                fontWeight: FontWeight.w400),
                          ),
                        ),


                        SizedBox(
                          height: getVerticalSize(60),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "\$",
                                style: AppStyle.textStyleDMSANS.copyWith(
                                    color: ColorConstant.primaryBlack,
                                    fontWeight: FontWeight.w700,
                                    fontSize: getFontSize(30)),
                              ),
                              SizedBox(
                                width: getHorizontalSize(100),
                                child: TextFormField(
                                  readOnly: true,
                                  textAlign: TextAlign.start,
                                  controller: requestMoneyScreenController.amountCtrl,
                                  decoration: InputDecoration(
                                    hintText: '0',
                                    hintStyle: AppStyle.DmSansFont.copyWith(
                                        color: ColorConstant.grey8F,
                                        fontWeight: FontWeight.w400,
                                        fontSize: getFontSize(30)),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorConstant.primaryWhite.withOpacity(0.5),
                                          width: 1),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorConstant.grey8F.withOpacity(0.5),
                                          width: 1),
                                    ),
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
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                          child: Container(height: 1,color: ColorConstant.grey8F.withOpacity(0.5),),
                        ),
                        SizedBox(
                          height: getVerticalSize(50),
                        ),
                        Center(
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(40)),
                            child: Text(
                              requestMoneyScreenController.forNoteController.text,
                              textAlign: TextAlign.center,
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.grey8F,
                                  fontSize: getFontSize(20),
                                  fontWeight: FontWeight.w400),
                              maxLines: 5,
                            ),
                          ),
                        ),
                     Spacer(),
                        Obx(()=> Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getHorizontalSize(
                                      double.parse(requestMoneyScreenController.containerHeight.value.toString())==150?0:20)),
                              child: InkWell(
                                onTap: (){
                                  requestMoneyScreenController.requestClick();
                                },
                                child: AnimatedContainer(
                                  height: getVerticalSize(double.parse(requestMoneyScreenController.containerHeight.value.toString())),
                                  duration: Duration(milliseconds: 500),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(double.parse( requestMoneyScreenController.containerHeight.value.toString())==150?15:12.0),
                                          topLeft: Radius.circular(double.parse( requestMoneyScreenController.containerHeight.value.toString())==150?15:12.0),
                                          bottomLeft: Radius.circular(double.parse( requestMoneyScreenController.containerHeight.value.toString())==150?0:12.0),
                                          bottomRight: Radius.circular(double.parse( requestMoneyScreenController.containerHeight.value.toString())==150?0:12.0),),
                                      color: ColorConstant.primaryLightGreen),
                                  child: double.parse(
                                      requestMoneyScreenController.containerHeight.value.toString())==150
                                      ? Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20),vertical: getVerticalSize(20)),
                                        child: Text(
                                    'Requesting...',
                                    textAlign: TextAlign.left,
                                    style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontSize: getFontSize(20),
                                          fontWeight: FontWeight.w700),

                                  ),
                                      )
                                      :Center(
                                    child: Text(
                                      'Request',
                                      textAlign: TextAlign.center,
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontSize: getFontSize(20),
                                          fontWeight: FontWeight.w700),

                                    ),
                                  ),
                                ),
                              ),
                              // AppElevatedButton(buttonName: 'Request',
                              //   radius: 10,
                              //   buttonColor: ColorConstant.primaryLightGreen,
                              //   onPressed: () {
                              //     // requestMoneyScreenController.onTapNextButton();
                              //   },),
                            ),
                          ),
                        ),
                        Obx(()=>SizedBox(
                            height: getVerticalSize(double.parse(
                                requestMoneyScreenController.containerHeight.value.toString())==150?0:40),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),
        ));
  }
}
