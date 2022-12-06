// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:my_secure_app/theme/app_style.dart';
// import 'package:my_secure_app/utils/ConstantsFiles/string_constants.dart';
// import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
// import 'package:my_secure_app/utils/HelperFiles/ui_utils.dart';
//
// import '../../App Configurations/color_constants.dart';
// import 'controller/cash_out_amount_num_pad_screen_controller.dart';
//
// class CashOutAmountNumPadScreen extends StatelessWidget {
//   var amountNumPadController = Get.find<CashOutAmountNumPadScreenController>();
//
//   final String _userPrefix = "\$";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: ColorConstant.primaryBlack,
//         body: SafeArea(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(right: 24.0, top: 20),
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: SvgPicture.asset(
//                         // you can replace this with Image.asset
//                         'asset/close_image.svg',
//                         fit: BoxFit.cover,
//                         height: 18,
//                         width: 18,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 20.0, right: 20.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Container(
//                     child: Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Cash Out",
//                               style: AppStyle.textStyleSFPRO.copyWith(
//                                   color: ColorConstant.skyE8,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: getFontSize(20)),
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Obx(() => Text(
//                                       "\$" +
//                                           amountNumPadController
//                                               .walletBalance.value +
//                                           " " +
//                                           "AVAILABLE",
//                                       style: AppStyle.textStyleSFPRO.copyWith(
//                                           color: ColorConstant.skyE8,
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: getFontSize(18)),
//                                     )),
//                               ],
//                             )
//                           ]),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width / 2,
//                 height: getVerticalSize(70),
//                 child: Obx(
//                   () => TextFormField(
//                     inputFormatters: [
//                       FilteringTextInputFormatter.allow(
//                           RegExp(r'^\d+\.?\d{0,2}'))
//                     ],
//                     controller: amountNumPadController.amountController,
//                     maxLines: 1,
//                     onChanged: (value) {},
//                     focusNode: AlwaysDisabledFocusNode(),
//                     style: AppStyle.textStyleSFPRO.copyWith(
//                         color: amountNumPadController.isAmountAvailable.value
//                             ? ColorConstant.skyE8
//                             : ColorConstant.grey77,
//                         fontWeight: FontWeight.w400,
//                         fontSize: getFontSize(45)),
//                     decoration: InputDecoration(
//                       hintText: "\$ 0",
//                       errorStyle: TextStyle(height: 0),
//                       hintStyle: AppStyle.textStyleSFPRO.copyWith(
//                           color: ColorConstant.skyE8,
//                           fontWeight: FontWeight.w400,
//                           fontSize: getFontSize(40)),
//                       prefix: Text(
//                         "\$",
//                         style: AppStyle.textStyleSFPRO.copyWith(
//                             color:
//                                 amountNumPadController.isAmountAvailable.value
//                                     ? ColorConstant.skyE8
//                                     : ColorConstant.grey77,
//                             fontWeight: FontWeight.w400,
//                             fontSize: getFontSize(40)),
//                       ),
//                       contentPadding: EdgeInsets.zero,
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(
//                             color: ColorConstant.underLine, width: 3),
//                       ),
//                     ),
//                     cursorColor: ColorConstant.primaryAppTextF1,
//                   ),
//                 ),
//               ),
//               Column(
//                 children: [
//                   KeyPad(
//                     pinController: amountNumPadController.amountController,
//                     onChange: (String pin) {
//                       // amountNumPadController.amountController.text = pin;
//                       // print(
//                       //     '${amountNumPadController.amountController.text}');
//                     },
//                     onNext: () {
//                       if (amountNumPadController.isAmountAvailable.value) {
//                         if (amountNumPadController.amountController.text ==
//                             "") {
//                           UIUtils.showSnakBar(
//                               bodyText: "Please Enter Amount",
//                               headerText: StringConstants.ERROR);
//                         } else {
//                           amountNumPadController
//                               .showaccountSelectTypeBottomsheet();
//                         }
//                       }
//                       // amountNumPadController.goNextScreen();
//                     },
//                   ),
//                   SizedBox(height: getVerticalSize(36),)
//                 ],
//               ),
//
//             ],
//           ),
//         ));
//   }
// }
//
// class AlwaysDisabledFocusNode extends FocusNode {
//   @override
//   bool get hasFocus => false;
// }
