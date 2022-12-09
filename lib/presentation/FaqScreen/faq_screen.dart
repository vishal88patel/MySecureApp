import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_AppBar%20.dart';
import 'package:secure_cash_app/presentation/widget/select_mode_widget.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import 'controller/faq_screen_controller.dart';

class FaqScreen extends StatelessWidget {
  var faqController = Get.find<FaqScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
                  children: [
                    Image.asset('asset/icons/background_image.png',
                        fit: BoxFit.cover,width: double.infinity),
                    SafeArea(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column( crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              AppAppBar(
                                title: "FAQs",
                                icon1: "asset/icons/ic_back.svg",
                                icon2: "asset/icons/ic_notification.svg",
                                onPressedIcon1: () {
                                  Get.back();
                                },
                                onPressedIcon2: () {
                                  Get.toNamed(AppRoutes.notificationScreen);
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: getVerticalSize(100)),
                            child: Container(
                              height:double.infinity ,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ColorConstant.primaryWhite,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(32),
                                    topRight: Radius.circular(32),
                                  )
                              ),
                              child:SingleChildScrollView(
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SizedBox(height: getVerticalSize(20),),
                                    Container(
                                      height: getVerticalSize(7),
                                      width: getHorizontalSize(60),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.greyBD,
                                          borderRadius: BorderRadius.circular(50)
                                      ),
                                    ),
                                    SizedBox(height: getVerticalSize(20),),

                                    faqController.faqModel.value.data!=null?
                                    faqController.isApiCall.value?
                                      ListView.builder(
                                        physics:const NeverScrollableScrollPhysics(),
                                          itemCount: faqController.faqModel.value.data!.length,
                                          shrinkWrap: true,
                                          itemBuilder: (BuildContext context, int index) {
                                            return  Obx(()
                                            => ExpandableNotifier(
                                                child: Card(
                                                  color: ColorConstant.greyF9,
                                                  clipBehavior: Clip.antiAlias,
                                                  child: Column(
                                                    children: <Widget>[
                                                      ScrollOnExpand(
                                                        scrollOnExpand: true,
                                                        scrollOnCollapse: false,
                                                        child: ExpandablePanel(
                                                          theme: const ExpandableThemeData(
                                                            headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                            tapBodyToCollapse: true,
                                                          ),
                                                          header: Padding(
                                                              padding: EdgeInsets.all(10),
                                                              child: Text('${index+1}. '
                                                                  ' ${faqController.faqModel.value.data![index].question??''} ?',
                                                                style: AppStyle.textStyleDMSANS.copyWith(
                                                                    color: ColorConstant.primaryBlack,
                                                                    fontWeight: FontWeight.w600,
                                                                    fontSize: getFontSize(16)),),),
                                                          collapsed: Text(faqController.faqModel.value.data![index].answer??'',
                                                            style: AppStyle.textStyleDMSANS.copyWith(
                                                                color: ColorConstant.primaryBlack,
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: getFontSize(16)),maxLines: 1,
                                                            ),
                                                          expanded: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                                Padding(
                                                                    padding: EdgeInsets.only(bottom: 10),
                                                                    child:Text(faqController.faqModel.value.data![index].answer??'',
                                                                      style: AppStyle.textStyleDMSANS.copyWith(
                                                                          color: ColorConstant.primaryBlack,
                                                                          fontWeight: FontWeight.w400,
                                                                          fontSize: getFontSize(16)), softWrap: true,
                                                                      overflow: TextOverflow.fade,),),
                                                            ],
                                                          ),
                                                          builder: (_, collapsed, expanded) {
                                                            return Padding(
                                                              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                                              child: Expandable(
                                                                collapsed: collapsed,
                                                                expanded: expanded,
                                                                theme: const ExpandableThemeData(crossFadePoint: 0),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ))
                                              /*  InkWell(
                                                onTap: (){
                                                  faqController.expandWidget(index);
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(vertical: getVerticalSize(10)),
                                                  child: Container(

                                                    decoration: BoxDecoration(
                                                        color: ColorConstant.greyF9,
                                                        borderRadius: BorderRadius.circular(10),
                                                        border: Border.all(
                                                            color: ColorConstant.primaryLightGreen.withOpacity(0.2)
                                                        )
                                                    ),
                                                    child: Padding(
                                                      padding:  EdgeInsets.symmetric(
                                                          horizontal: getHorizontalSize(15),
                                                          vertical: getVerticalSize(12)),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text('${index+1}. '
                                                                  ' ${faqController.faqModel.value.data![index].question??''} ?',
                                                                style: AppStyle.textStyleDMSANS.copyWith(
                                                                    color: ColorConstant.primaryBlack,
                                                                    fontWeight: FontWeight.w600,
                                                                    fontSize: getFontSize(16)),),
                                                              Icon(Icons.arrow_forward_ios_outlined,   size: getSize(20),
                                                                color: ColorConstant.primaryBlack.withOpacity(0.20),),
                                                            ],
                                                          ),
                                                          if(faqController.isExpand.value == index)
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                SizedBox(height: getVerticalSize(10),),
                                                                Divider(),
                                                                SizedBox(height: getVerticalSize(10),),
                                                                Text(faqController.faqModel.value.data![index].answer??'',
                                                                  style: AppStyle.textStyleDMSANS.copyWith(
                                                                      color: ColorConstant.primaryBlack,
                                                                      fontWeight: FontWeight.w400,
                                                                      fontSize: getFontSize(16)),),
                                                              ],
                                                            ),
                                                        ],
                                                      ),
                                                    ),),
                                                ),
                                              ),*/
                                            );
                                          }):Container():Container(),

                                  ],
                            ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}
