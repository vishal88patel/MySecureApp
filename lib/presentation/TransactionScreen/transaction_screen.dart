import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/account_detail_list_widget.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/presentation/CardDetailListScreen/controller/card_detail_list_screen_controller.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import 'controller/transaction_screen_controller.dart';

class TransactionScreen extends StatelessWidget {
  var transactionController = Get.put(TransactionScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            MainCutomBackGround(
                child: Padding(padding: EdgeInsets.only(
                    left: getHorizontalSize(20.0),
                    right: getHorizontalSize(20.0),
                    top:getVerticalSize(26)),
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row( mainAxisAlignment : MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.arrow_back, color: ColorConstant.primaryWhite,),
                                InkWell(
                                  onTap: (){

                                  },
                                  child: Image.asset('asset/icons/notification_icon.png',
                                    height: getVerticalSize(20),width: getHorizontalSize(16),),
                                )
                              ],
                            ),
                            SizedBox(height: getVerticalSize(25),),
                            Stack(alignment: Alignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset('asset/trans_card_image.png',
                                  fit: BoxFit.cover,),
                                ),
                                Positioned(
                                  top: getVerticalSize(25),
                                  child: SizedBox(width: size.width,
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(50)),
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          SizedBox(height: getVerticalSize(15),),

                                          Row(
                                            children: [
                                              Text('Current Value',
                                                  style: AppStyle.textStylePoppinsRegular
                                                      .copyWith(
                                                      fontWeight: FontWeight.w400,fontSize: getFontSize(12))),
                                            ],
                                          ),
                                          SizedBox(height: getVerticalSize(25),),
                                          Text('\$25,630.00',
                                              style: AppStyle.textStylePoppinsRegular
                                                  .copyWith(
                                                  fontWeight: FontWeight.w700,fontSize: getFontSize(28))),
                                          SizedBox(height: getVerticalSize(5),),
                                          Text('+\$25,60',
                                              style: AppStyle.textStylePoppinsRegular
                                                  .copyWith(
                                                  fontWeight: FontWeight.w500,fontSize: getFontSize(20))),
                                          SizedBox(height: getVerticalSize(10),),
                                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Transactions in this week',
                                                  style: AppStyle.textStylePoppinsRegular
                                                      .copyWith(
                                                      fontWeight: FontWeight.w400,fontSize: getFontSize(12))),
                                              Icon(Icons.arrow_upward_outlined)
                                            ],
                                          ),


                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(height: getVerticalSize(25),),

                            Row(children: [
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    Get.toNamed(AppRoutes.cardListScreen);
                                  },
                                  child: Container(
                                  decoration: BoxDecoration(
                                      color: ColorConstant.blue26,
                                  borderRadius: BorderRadius.circular(10)),
                                  child:  Padding(
                                    padding:  EdgeInsets.symmetric(vertical: getVerticalSize(22)),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Add Cash',
                                            style: AppStyle.textStylePoppinsRegular
                                                .copyWith(color: ColorConstant.primaryWhite,
                                                fontWeight: FontWeight.w500,fontSize: getFontSize(15))),
                                        SizedBox(width: getHorizontalSize(12),),
                                        DottedBorder(
                                          color: ColorConstant.skyE8,
                                          strokeWidth: 1,
                                          borderType: BorderType.Circle,
                                          radius: Radius.circular(100),
                                          child: Container(
                                            height: getVerticalSize(26),
                                            width: getHorizontalSize(26),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Image.asset('asset/Income_image.png'),
                                            ),
                                           )
                                        )

                                      ],
                                    ),
                                  ),
                            ),
                                ),
                              ),
                              SizedBox(width: getHorizontalSize(20),),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: ColorConstant.blue26,
                                      borderRadius: BorderRadius.circular(10)),
                                  child:  Padding(
                                    padding:  EdgeInsets.symmetric(vertical: getVerticalSize(22)),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                        Text('Cash Out',
                                        style: AppStyle.textStylePoppinsRegular
                                            .copyWith(color: ColorConstant.primaryWhite,
                                            fontWeight: FontWeight.w500,fontSize: getFontSize(15))),
                                    SizedBox(width: getHorizontalSize(12),),
                                    DottedBorder(
                                      color: ColorConstant.skyE8,
                                      strokeWidth: 1,
                                      borderType: BorderType.Circle,
                                      radius: Radius.circular(100),
                                      child: Container(
                                        height: getVerticalSize(26),
                                        width: getHorizontalSize(26),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image.asset('asset/camera_image.png'),
                                        ),
                                      ) )],
                                    ),
                                  ),
                                ),
                              )],),
                            SizedBox(height: getVerticalSize(15),),
                            Row(children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: ColorConstant.blue26,
                                      borderRadius: BorderRadius.circular(10)),
                                  child:  Padding(
                                    padding:  EdgeInsets.symmetric(vertical: getVerticalSize(22)),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Scan & Pay',
                                            style: AppStyle.textStylePoppinsRegular
                                                .copyWith(color: ColorConstant.primaryWhite,
                                                fontWeight: FontWeight.w500,fontSize: getFontSize(15))),
                                        SizedBox(width: getHorizontalSize(12),),
                                        DottedBorder(
                                            color: ColorConstant.skyE8,
                                            strokeWidth: 1,
                                            borderType: BorderType.Circle,
                                            radius: Radius.circular(100),
                                            child: Container(
                                              height: getVerticalSize(26),
                                              width: getHorizontalSize(26),
                                              child: Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Image.asset('asset/scan_image.png'),
                                              ),
                                            )
                                        )

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: getHorizontalSize(20),),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: ColorConstant.blue26,
                                      borderRadius: BorderRadius.circular(10)),
                                  child:  Padding(
                                    padding:  EdgeInsets.symmetric(vertical: getVerticalSize(22)),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('View Account\n Details',
                                            style: AppStyle.textStylePoppinsRegular
                                                .copyWith(color: ColorConstant.primaryWhite,
                                                fontWeight: FontWeight.w500,fontSize: getFontSize(15)),textAlign: TextAlign.center,),
                                       ],
                                    ),
                                  ),
                                ),
                              )],),
                            SizedBox(height: getVerticalSize(25),),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Transactions',
                                    style: AppStyle.textStylePoppinsRegular
                                        .copyWith(color: ColorConstant.primaryWhite,
                                        fontWeight: FontWeight.w700,fontSize: getFontSize(15))),
                                Image.asset('asset/icons/Filter_icon.png',
                                  height: getVerticalSize(25),width:getHorizontalSize(25),)
                              ],
                            ),
                            SizedBox(height: getVerticalSize(25),),

                            Expanded(
                              child: ListView.builder(
                                itemCount: 15,
                                physics:const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context,int index) {
                                  return Padding(
                                    padding:  EdgeInsets.symmetric(vertical: getVerticalSize(6.5)),
                                    child:const AccountDetailListWidget(
                                        name: 'Your Bank Name ',
                                        price: '-\$5.00',
                                        time: '2:45 PM  | Oct  13  2019',
                                        image: 'asset/icons/Apple_icon.png'),
                                  );
                                }
                              ),
                            )
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
