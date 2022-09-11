import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/presentation/PersonalDetails/controller/personal_detail_screen_controller.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

class PersonalDetailScreen extends StatelessWidget {
  var personalDetailController = Get.find<PersonalScreenController>();
List<String> payment=[ 'Personal Loan','Payday Loan','Auto Loan',
                                 'Mortage Loan','Emergency Loan',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            MainCutomBackGround(
                child: Padding(padding: EdgeInsets.symmetric(
                    horizontal: getHorizontalSize(36.0),vertical:getVerticalSize( 26)),
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row( mainAxisAlignment : MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.arrow_back, color: ColorConstant.primaryWhite,),
                                Text("4/4",style: AppStyle.textStylePoppinsRegular
                                    .copyWith(color: ColorConstant.primaryWhite),),
                              ],
                            ),
                            SizedBox(height: getVerticalSize(57),),
                            Text("Personal Details ",style: AppStyle.textStylePoppinsRegular
                                .copyWith(color: ColorConstant.primaryWhite,
                                fontWeight: FontWeight.w700,fontSize: getFontSize(32)),),
                            SizedBox(height: getVerticalSize(21),),
                            const AppTextField(hintText: 'Employment name '),
                            SizedBox(height: getVerticalSize(30),),
                            const AppTextField(hintText: 'Job Title',),
                            SizedBox(height: getVerticalSize(30),),
                            const AppTextField(hintText: 'Annual income',),
                            SizedBox(height: getVerticalSize(30),),
                            const AppTextField(hintText: 'Purpouse of opening account ',),
                            SizedBox(height: getVerticalSize(20),),
                            Row(
                              children:  [
                                Container(
                                  decoration: BoxDecoration(
                                      color: ColorConstant.primaryWhite,
                                      border: Border.all(color: ColorConstant.primaryWhite)
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(
                                        horizontal: getHorizontalSize(16),
                                        vertical: getVerticalSize(4)),
                                    child: Text('Borrow Loan',
                                      style: AppStyle.textStylePoppinsRegular
                                          .copyWith(color: ColorConstant.primaryBlack,
                                      fontWeight: FontWeight.w400,fontSize: getFontSize(14))),
                                  ),),
                                SizedBox(width: getHorizontalSize(11),),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(color: ColorConstant.primaryAppTextF1)
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(
                                        horizontal: getHorizontalSize(16),
                                        vertical: getVerticalSize(4)),
                                    child: Text('Using Wallet Service',
                                        style: AppStyle.textStylePoppinsRegular
                                            .copyWith(color: ColorConstant.primaryAppTextF1,
                                            fontWeight: FontWeight.w400,fontSize: getFontSize(14))),
                                  ),),
                              ],
                            ),
                            SizedBox(height: getVerticalSize(22),),
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
                            Wrap(
                              alignment: WrapAlignment.start,
                              children: payment.map((i) => Padding(
                                padding:  EdgeInsets.symmetric(vertical: getVerticalSize(8)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(  width: getHorizontalSize(9),
                                     height: getVerticalSize(9),
                                     decoration: BoxDecoration( color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(color: ColorConstant.primaryAppTextF1)
                                      ),),
                                    SizedBox(width: getHorizontalSize(7),),
                                    Text(i,style: AppStyle.textStylePoppinsRegular
                                        .copyWith(color: ColorConstant.primaryAppTextF1,fontSize: getFontSize(12)),),
                                    SizedBox(width: getHorizontalSize(10),),
                                  ],
                                ),
                              )).toList(),
                            ),
                            Spacer(),
                            AppElevatedButton(buttonName: 'Next', onPressed: () {
                              Get.toNamed(AppRoutes.dashBoardScreen);
                            },),
                            SizedBox(height: getVerticalSize(40),),

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
