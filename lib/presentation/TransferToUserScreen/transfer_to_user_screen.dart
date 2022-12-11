import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_AppBar%20.dart';
import 'package:secure_cash_app/presentation/EnterPersonalDetails/nam_pad.dart';
import 'package:secure_cash_app/presentation/TransferScreen/controller/transfer_screen_controller.dart';
import 'package:secure_cash_app/presentation/TransferToUserScreen/controller/transfer_to_user_screen_controller.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';

class TransferToUserScreen extends StatelessWidget {
  var transferToUserScreenController = Get.find<TransferToUserScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                        "Transfer to",
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
                    height: getVerticalSize(40),
                  ),
                  Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('asset/icons/profile_image.png',
                        height: getVerticalSize(100),)),
                  ),
                  SizedBox(
                    height: getVerticalSize(30),
                  ),
                  Center(
                    child: Text(
                      "Dianna Russell",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: AppStyle.DmSansFont.copyWith(
                          color: ColorConstant.naturalBlack,
                          fontSize: getFontSize(24),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: getVerticalSize(5),
                  ),
                  Center(
                    child: Text(
                      "5150-1094-1012",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: AppStyle.DmSansFont.copyWith(
                          color: ColorConstant.grey8F,
                          fontSize: getFontSize(16),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: getVerticalSize(40),
                  ),
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
                          controller: transferToUserScreenController.amountCtrl,
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
                  Container(height: 1,color: ColorConstant.grey8F.withOpacity(0.5),),
                  SizedBox(
                    height: getVerticalSize(20),
                  ),
                  Align(alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),
                        color: ColorConstant.buttonGreen,),
                      padding: EdgeInsets.all(
                          getHorizontalSize(13)),
                      child: Icon(Icons.send_rounded,color: ColorConstant.primaryWhite,),
                    ),
                  ),
                  SizedBox(
                    height: getVerticalSize(20),
                  ),
                  NumPad(
                    type: '-',
                    controller: transferToUserScreenController.amountCtrl,
                    delete: () {
                      HapticFeedback.lightImpact();

                      if( transferToUserScreenController.amountCtrl.text.isNotEmpty){
                        transferToUserScreenController.amountCtrl.text = transferToUserScreenController.amountCtrl.text
                            .substring(0, transferToUserScreenController.amountCtrl.text.length - 1);

                      }
                    },
                    // do something with the input numbers
                    onSubmit: () {
                      debugPrint('Your code: ${transferToUserScreenController.amountCtrl.text}');
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
