import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_textField.dart';
import 'package:secure_cash_app/presentation/EnterPersonalDetails/controller/enter_personal_detail_screen_controller.dart';
import 'package:secure_cash_app/presentation/EnterPersonalDetails/nam_pad.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

class EnterSNNDetailScreen extends StatelessWidget {
  var enterPersonalDetailController = Get.find<EnterBirthDateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: size.height,
              color: ColorConstant.buttonGreen.withOpacity(0.3),
              child: Padding(
                  padding: EdgeInsets.only(
                      top: getVerticalSize(20)),
                  child: Stack(
                    children: [
                      Column( crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                  "Enter Your SNN Code",
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
                            height: getVerticalSize(120),
                          ),


                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),
                                  color:  ColorConstant.primaryWhite
                              ),

                              child: Expanded(
                                child:SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: getVerticalSize(130),
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                      child: Text(
                                        "Enter the verification code we just\n sent on your phone number.",
                                        style: AppStyle.DmSansFont.copyWith(
                                            color: ColorConstant.grey8F,
                                            fontWeight: FontWeight.w400,
                                            fontSize: getFontSize(20),letterSpacing: 0.5),
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                      child: TextFormField(
                                        readOnly: true,
                                        style: TextStyle(color: ColorConstant.grey8F,),
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(9),
                                        ],
                                        decoration: InputDecoration(
                                          hintText: 'Enter SNN code',
                                          hintStyle: AppStyle.DmSansFont.copyWith(
                                              color: ColorConstant.grey8F,
                                              fontWeight: FontWeight.w400,
                                              fontSize: getFontSize(16)),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: ColorConstant.grey8F),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: ColorConstant.grey8F),
                                          ),
                                        ),
                                        // var date = parts.sublist(1).join(':').trim(); // date: "'2019:04:01'"

                                        controller:
                                        enterPersonalDetailController.ssnController,
                                      ),
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(60),
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                      child: AppElevatedButton(
                                        buttonName: 'Next',

                                        onPressed: () {
                                          debugPrint('Your code: ${enterPersonalDetailController.ssnController.text}');
                                          enterPersonalDetailController.onTapOfNextSnnButton();

                                        },
                                      ),
                                    ),
                                    SizedBox(height: getVerticalSize(10),),
                                    Column(
                                      children: [
                                        NumPad(
                                          type: 'SNN',
                                          controller: enterPersonalDetailController.ssnController,
                                          delete: () {
                                            HapticFeedback.lightImpact();

                                            if( enterPersonalDetailController.ssnController.text.isNotEmpty){
                                              enterPersonalDetailController.ssnController.text = enterPersonalDetailController.ssnController.text
                                                  .substring(0, enterPersonalDetailController.ssnController.text.length - 1);

                                            }
                                          },
                                          // do something with the input numbers
                                          onSubmit: () {
                                            debugPrint('Your code: ${enterPersonalDetailController.ssnController.text}');
                                            enterPersonalDetailController.onTapOfNextSnnButton();
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                              ),
                            ),
                          ),

                        ],
                      ),


                      Positioned(right: 10,
                        top: getVerticalSize(60),
                        child: Center(
                            child: Image.asset('asset/icons/snn_image.png',
                              height: getVerticalSize(220),)
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          ),
        ));
    



  }
}
