import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textFormField_fill.dart';
import 'package:my_secure_app/Custom%20Widgets/bank_list_widget.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import 'controller/loan_step_screen_controller.dart';

class LoanStepScreen extends StatelessWidget {
  var loanStepController = Get.find<LoanStepScreenController>();

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
                    top:getVerticalSize( 26)),
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row( mainAxisAlignment : MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap:(){Get.toNamed(AppRoutes.bankDetailScreen);},
                                    child: Icon(Icons.arrow_back, color: ColorConstant.primaryWhite,)),
                                InkWell(
                                  onTap: (){ Get.toNamed(AppRoutes.accountDetailListScreen);
                                  },
                                  child: Image.asset('asset/icons/notification_icon.png',
                                    height: getVerticalSize(20),width: getHorizontalSize(16),),
                                )
                              ],
                            ),
                            SizedBox(height: getVerticalSize(20),),
                            Text("Loan setp before you withdraw",
                              style: AppStyle.textStylePoppinsRegular
                                  .copyWith(color: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w700,fontSize: getFontSize(18)),),
                            SizedBox(height: getVerticalSize(30),),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Loan Amount",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                                Text("\$ 45,000",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                              ],
                            ),
                            SizedBox(height: getVerticalSize(5),),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Extra Charges ",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                                Text("\$ 45",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                              ],
                            ),
                            SizedBox(height: getVerticalSize(5),),
                            Divider(color: Colors.grey,),
                            SizedBox(height: getVerticalSize(5),),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total Amount",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                                Text("\$ 45,000",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                              ],
                            ),

                            SizedBox(height: getVerticalSize(35),),
                            Text("Interest ",
                              style: AppStyle.textStylePoppinsRegular
                                  .copyWith(color: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                            SizedBox(height: getVerticalSize(10),),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Tenure ",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                                Text("36 Month ",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                              ],
                            ),
                            SizedBox(height: getVerticalSize(5),),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Interest Rate ",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                                Text("8% ",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                              ],
                            ),
                            SizedBox(height: getVerticalSize(5),),
                            Divider(color: Colors.grey,),
                            SizedBox(height: getVerticalSize(5),),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Payble Amount ",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                                Text("\$ 54,198",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                              ],
                            ),

                            SizedBox(height: getVerticalSize(40),),
                            Text("Repayment  ",
                              style: AppStyle.textStylePoppinsRegular
                                  .copyWith(color: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                            SizedBox(height: getVerticalSize(10),),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("EMI ",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                                Text("\$ 1505",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                              ],
                            ),
                            SizedBox(height: getVerticalSize(5),),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("01 outof 36",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                                Text("01 outof 36",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                              ],
                            ),
                            SizedBox(height: getVerticalSize(5),),

                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("EMI Number ",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                                Text("AWE123CV",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                              ],
                            ),

                            Spacer(),

                            AppElevatedButton(buttonName: 'Next',
                                onPressed: (){
                                  Get.toNamed(AppRoutes.bankProceedScreen);
                                }),
                            SizedBox(height: getVerticalSize(40),)
                          ],
                        ),
                      ],
                    ),
                  ),
                ) ),
          ],
        ));
  }
}
