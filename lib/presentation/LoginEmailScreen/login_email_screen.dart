// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:my_secure_app/App%20Configurations/image_constants.dart';
// import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
// import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
// import 'package:my_secure_app/routes/app_routes.dart';
// import 'package:my_secure_app/theme/app_style.dart';
// import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
//
// import '../../App Configurations/color_constants.dart';
// import 'controller/login_email_screen_controller.dart';
//
// class LoginEmilScreen extends StatelessWidget {
//   var loginEmailnController = Get.find<LoginEmailScreenController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(
//           children: [
//             MainCutomBackGround(
//              child: Padding(padding: EdgeInsets.symmetric(
//                  horizontal: getHorizontalSize(36.0),vertical:getVerticalSize( 26)),
//               child: SafeArea(
//                child: Stack(
//                  children: [
//                    Column(crossAxisAlignment: CrossAxisAlignment.start,
//                      children: [
//                        Row( mainAxisAlignment : MainAxisAlignment.spaceBetween,
//                         children: [
//                          Icon(Icons.arrow_back, color: ColorConstant.primaryWhite,),
//                          Text("1/9",style: AppStyle.textStylePoppinsRegular
//                              .copyWith(color: ColorConstant.primaryWhite),),
//                             ],
//                           ),
//                        SizedBox(height: getVerticalSize(57),),
//                        Text("Give us your \nPhone Number",style: AppStyle.textStylePoppinsRegular
//                            .copyWith(color: ColorConstant.primaryWhite,
//                            fontWeight: FontWeight.w700,fontSize: getFontSize(32)),),
//                        SizedBox(height: getVerticalSize(5),),
//                        Text("To apply, we need your Phone Number linked to \nyour app",
//                          style: AppStyle.textStylePoppinsRegular
//                            .copyWith(color: ColorConstant.primaryAppTextF1,
//                            fontWeight: FontWeight.w400,fontSize: getFontSize(16)),),
//                        SizedBox(height: getVerticalSize(54),),
//                        AppTextField(keyBordType: TextInputType.number,maxLength:11,hintText: "Phone Number",controller:loginEmailnController.phoneController,),
//                        Spacer(),
//                        AppElevatedButton(radius: 5,
//                            buttonName: 'Next',
//                            onPressed: () {
//                              loginEmailnController.onTapOfButton();
//                              // Get.toNamed(AppRoutes.loginEmailScreen);
//                            }),
//                        Padding(
//                          padding: const EdgeInsets.symmetric(vertical: 8.0),
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: [
//                              Text(
//                                "OR",
//                                style: AppStyle.textStylePoppinsRegular
//                                    .copyWith(color: ColorConstant.primaryWhite),
//                              ),
//                            ],
//                          ),
//                        ),
//                        AppElevatedButton(radius: 5,
//                            buttonName: 'Continue with Email',
//                            onPressed: () {
//                              Navigator.pop(context);
//                            }),
//                        SizedBox(
//                          height: getVerticalSize(36),
//                        ),
//                      ],
//                    ),
//                  ],
//                ),
//               ),
//             ) ),
//           ],
//         ));
//   }
// }
