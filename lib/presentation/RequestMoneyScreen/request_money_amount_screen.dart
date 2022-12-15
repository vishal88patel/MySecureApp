
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

class RequestMoneyAmountScreen extends StatelessWidget {
  var requestMoneyScreenController = Get.find<RequestMoneyScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: size.height*0.95,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getVerticalSize(16),
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
                  ),

                      SizedBox(
                        height: getVerticalSize(20),
                      ),
                      Obx(()=>
                         Center(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                requestMoneyScreenController.image.value,
                                height: getVerticalSize(100),)),
                        ),
                      ),
                      SizedBox(
                        height: getVerticalSize(20),
                      ),
                      Center(
                        child:Obx(()=> Text(
                            "Requesting to "+requestMoneyScreenController.name.value,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: AppStyle.DmSansFont.copyWith(
                                color: ColorConstant.grey8F,
                                fontSize: getFontSize(20),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),


                      SizedBox(
                        height: getVerticalSize(40),
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

                      const Spacer(),
                      NumPad(
                        type: '-',
                        controller: requestMoneyScreenController.amountCtrl,
                        delete: () {
                          HapticFeedback.lightImpact();

                          if( requestMoneyScreenController.amountCtrl.text.isNotEmpty){
                            requestMoneyScreenController.amountCtrl.text = requestMoneyScreenController.amountCtrl.text
                                .substring(0, requestMoneyScreenController.amountCtrl.text.length - 1);

                          }
                        },
                        // do something with the input numbers
                        onSubmit: () {
                          debugPrint('Your code: ${requestMoneyScreenController.amountCtrl.text}');
                        },
                      ),
                      SizedBox(
                        height: getVerticalSize(20),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                        child: Row(
                          children: [
                            Expanded(
                              child: AppElevatedButton(buttonName: 'Request',
                                radius: 10,
                                buttonColor: ColorConstant.primaryLightGreen,
                                onPressed: () {
                                   requestMoneyScreenController.onTapReqButton();
                                },),
                            ),
                            SizedBox(width: getHorizontalSize(10),),
                            Expanded(
                              child: AppElevatedButton(buttonName: 'Pay',
                                radius: 10,
                                buttonColor: ColorConstant.primaryLightGreen,
                                onPressed: () {
                                  requestMoneyScreenController.onTapPayButton();

                                },),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getVerticalSize(20),
                      ),
                    ],
                  ),

            ),
          ),
        ));
  }
}
