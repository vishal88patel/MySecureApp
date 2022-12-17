import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../App Configurations/color_constants.dart';
import '../../../Custom Widgets/app_AppBar .dart';
import '../../../theme/app_style.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/math_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';

class BankScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
        body: SingleChildScrollView(
          child: Container(
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getVerticalSize(52),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: ColorConstant.backBorder)),
                            padding: EdgeInsets.all(6),
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 22,
                            ),
                          ),
                        ),
                        Text(
                          "Link Bank",
                          style: AppStyle.DmSansFont.copyWith(
                              color: ColorConstant.primaryBlack,
                              fontWeight: FontWeight.w700,
                              fontSize: getFontSize(20)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.transparent)),
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getVerticalSize(40),
                  ),
                  Center(
                      child: Image.asset(
                        'asset/icons/img_comingsoon.png',
                        height: getVerticalSize(300),
                      )),
                  SizedBox(
                    height: getVerticalSize(30),
                  ),
                  Center(
                    child: Text(
                      "Service Coming Soon",
                      style: AppStyle.DmSansFont.copyWith(
                          color: ColorConstant.primaryDarkGreen,
                          fontWeight: FontWeight.w700,
                          fontSize: getFontSize(24)),
                    ),
                  ),
                  SizedBox(
                    height: getVerticalSize(30),
                  ),
                  Center(
                      child: Image.asset('asset/icons/img_comingsoon_card.png',
                          width: size.width / 1.15)),
                ],
              )),
        ));
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//       backgroundColor: ColorConstant.primaryDarkGreen,
//       body: Column(
//         children: [
//           SizedBox(
//             height: getVerticalSize(16),
//           ),
//           AppAppBar(
//             title:"Notification",
//             icon1: "asset/icons/ic_back.svg",
//             icon2: "asset/icons/ic_setting.svg",
//             onPressedIcon1: (){
//               Get.back();
//             },
//             onPressedIcon2: (){},
//           ),
//           Expanded(
//             child: Card(
//               margin: const EdgeInsets.symmetric(horizontal: 0),
//               color: ColorConstant.primaryWhite,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(36),
//                     topRight: Radius.circular(36)),
//               ),
//               child: Container(
//                   width:MediaQuery.of(context).size.width,
//                   child:ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: 15,
//                       physics: const BouncingScrollPhysics(),
//                       itemBuilder:
//                           (BuildContext context, int index) {
//                         return InkWell(
//                           onTap: () {
//
//                           },
//                           child: Padding(
//                             padding: EdgeInsets.only(left: getHorizontalSize(20),right: getHorizontalSize(20),top:getVerticalSize(12),bottom: getVerticalSize(12) ),
//                             child: Row(
//                               children: [
//                                 SvgPicture.asset(
//                                   "asset/icons/ic_row_notification.svg",
//                                   fit: BoxFit.fill,
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(left:getHorizontalSize(18)),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         "Notification write here",
//                                         style: AppStyle.textStyleDMSANS.copyWith(
//                                             color: ColorConstant.naturalBlack,
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: getFontSize(20)),
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                       SizedBox(height: getVerticalSize(4),),
//                                       Text(
//                                         "10:00 AM",
//                                         style: AppStyle.textStyleDMSANS.copyWith(
//                                             color: ColorConstant.naturalGrey,
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: getFontSize(16)),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Padding(
//                                   padding: EdgeInsets.only(right:getHorizontalSize(10)),
//                                   child: Text(
//                                     "Info",
//                                     style: AppStyle.textStyleDMSANS.copyWith(
//                                         color: ColorConstant.primaryLightGreen,
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: getFontSize(16)),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       })
//               ),
//             ),
//           ),
//         ],
//       ));
// }
