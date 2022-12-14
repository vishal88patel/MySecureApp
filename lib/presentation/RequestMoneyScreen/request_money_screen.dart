import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/presentation/RequestMoneyScreen/controller/request_money_screen_controller.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';

class RequestMoneyScreen extends StatelessWidget {
  var requestMoneyScreenController = Get.find<RequestMoneyScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getVerticalSize(10), ),
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
                      "Request Money",
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
                child: ListView(
                  children: [
                    SizedBox(
                      height: getVerticalSize(40),
                    ),
                    Container(
                      width: double.infinity,
                      height: getVerticalSize(230),
                      margin: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                         color: ColorConstant.primaryAppTextF1),
                      child: requestMoneyScreenController.imageList.isNotEmpty
                          ?Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: getVerticalSize(20),),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                            child: Text(
                              "Recent",
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.primaryBlack,
                                  fontWeight: FontWeight.w700,
                                  fontSize: getFontSize(20)),
                            ),
                          ),
                          SizedBox(height: getVerticalSize(20),),
                          Expanded(
                            child: ListView.builder(
                                itemCount:requestMoneyScreenController.imageList.length ,
                                shrinkWrap: true,
                                scrollDirection:Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:BorderRadius.circular(100),
                                          child: Image.asset(requestMoneyScreenController.imageList[index],
                                            height: getVerticalSize(80),width: getHorizontalSize(80),),
                                        ),
                                        SizedBox(height: getVerticalSize(5),),
                                        SizedBox(
                                          width:getHorizontalSize(60),
                                          child: Text(
                                            "Dianna",
                                            style: AppStyle.DmSansFont.copyWith(
                                                color: ColorConstant.primaryBlack,
                                                fontWeight: FontWeight.w500,
                                                fontSize: getFontSize(16)),
                                            maxLines: 2,
                                          ),
                                        ),
                                        SizedBox(height: getVerticalSize(5),),
                                        Text(
                                          "\$Dianna_",
                                          style: AppStyle.DmSansFont.copyWith(
                                              color: ColorConstant.grey8F,
                                              fontWeight: FontWeight.w500,
                                              fontSize: getFontSize(14)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ],
                      )
                          : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('asset/icons/stupid_image.png',
                                height: getVerticalSize(80),width: getHorizontalSize(80),),
                          SizedBox(
                            height: getVerticalSize(10),
                          ),
                          Text(
                            "No Recent Found",
                            style: AppStyle.DmSansFont.copyWith(
                                color: ColorConstant.grey8F,
                                fontWeight: FontWeight.w700,
                                fontSize: getFontSize(18)),
                          ),
                        ],
                      ),

                    ),
                    SizedBox(
                      height: getVerticalSize(40),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                      child: Row(
                        children: [
                          Text(
                            "To",
                            style: AppStyle.DmSansFont.copyWith(
                                color: ColorConstant.primaryBlack,
                                fontWeight: FontWeight.w500,
                                fontSize: getFontSize(20)),
                          ),
                          SizedBox(width: getHorizontalSize(30),),
                          Expanded(
                            child: TextFormField(
                              controller: requestMoneyScreenController.toController,
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.grey8F,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getFontSize(18)),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Name, \$Cashtag, Email',

                                hintStyle:  AppStyle.DmSansFont.copyWith(
                                    color: ColorConstant.grey8F,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(18)),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Divider(color: ColorConstant.grey8F),
                    SizedBox(
                      height: getVerticalSize(20),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                      child: Row(
                        children: [
                          Text(
                            "For",
                            style: AppStyle.DmSansFont.copyWith(
                                color: ColorConstant.primaryBlack,
                                fontWeight: FontWeight.w500,
                                fontSize: getFontSize(20)),
                          ),
                          SizedBox(width: getHorizontalSize(30),),
                          Expanded(
                            child: TextFormField(
                              controller: requestMoneyScreenController.forNoteController,
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.grey8F,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getFontSize(18)),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Add a note',
                                hintStyle:  AppStyle.DmSansFont.copyWith(
                                    color: ColorConstant.grey8F,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(18)),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Divider(color: ColorConstant.grey8F),
                    SizedBox(
                      height: getVerticalSize(100),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                      child: AppElevatedButton(buttonName: 'Next',
                        radius: 10,
                        buttonColor: ColorConstant.primaryLightGreen,
                        onPressed: () {
                          requestMoneyScreenController.onTapNextButton();
                        },),
                    ),
                    SizedBox(
                      height: getVerticalSize(40),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ));
  }
}
