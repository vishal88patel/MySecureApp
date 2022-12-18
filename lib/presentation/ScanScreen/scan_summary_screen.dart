import 'package:accordion/accordion.dart';
import 'package:accordion/accordion_section.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_AppBar .dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/common_utils.dart';
import 'controller/scan_screen_controller.dart';

class ScanSummaryScreen extends StatelessWidget {
  var scanController = Get.find<ScanScreenController>();

  var items = [
    'Cash Card',
    'Bank',
    'Credit Card',
    'Wallet',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.primaryDarkGreen,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SizedBox(
                    height: getVerticalSize(20),
                  ),
                  AppAppBar(
                    title: "Summary Transaction",
                    icon1: "asset/icons/ic_back.svg",
                    icon2: "asset/icons/ic_help.svg",
                    onPressedIcon1: () {
                      Get.back();
                    },
                    onPressedIcon2: () {},
                  ),
                  SizedBox(
                    height: getVerticalSize(40),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: ColorConstant.primaryWhite,
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                        child: Obx(
                          () => ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              scanController.image.value,
                              height: getVerticalSize(80),
                              width: getVerticalSize(80),
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getVerticalSize(20),
                      ),
                      Obx(
                        () => Text(
                          scanController.name.value,
                          style: AppStyle.textStyleDMSANS.copyWith(
                              color: ColorConstant.primaryWhite,
                              fontWeight: FontWeight.w700,
                              fontSize: getFontSize(28)),
                        ),
                      ),
                      SizedBox(
                        height: getVerticalSize(12),
                      ),
                      Obx(
                        () => Text(
                          scanController.date.value,
                          style: AppStyle.textStyleDMSANS.copyWith(
                              color: ColorConstant.brandYellow,
                              fontWeight: FontWeight.w500,
                              fontSize: getFontSize(18)),
                        ),
                      ),
                      SizedBox(
                        height: getVerticalSize(44),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IntrinsicWidth(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\$",
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: ColorConstant.primaryLightGreen,
                                      fontWeight: FontWeight.w500,
                                      fontSize: getFontSize(30)),
                                ),
                                IntrinsicWidth(
                                  child: TextFormField(
                                    textAlign: TextAlign.start,
                                    controller:
                                    scanController.amountController,
                                    decoration: InputDecoration(
                                        hintText: 'Amount',
                                        hintStyle: AppStyle.DmSansFont.copyWith(
                                            color: ColorConstant.primaryWhite.withOpacity(0.5),
                                            fontWeight: FontWeight.w400,
                                            fontSize: getFontSize(24)),
                                        border: InputBorder.none
                                      /*enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorConstant.primaryWhite.withOpacity(0.5),
                                          width: 1),
                                    ),*/
                                      /*focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorConstant.grey8F.withOpacity(0.5),
                                          width: 1),
                                    ),*/
                                    ),
                                    keyboardType: TextInputType.phone,
                                    style: AppStyle.DmSansFont.copyWith(
                                        color: ColorConstant.primaryWhite,
                                        fontWeight: FontWeight.w700,
                                        fontSize: getFontSize(30)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          height: 1,
                          color: ColorConstant.grey8F.withOpacity(0.5),
                        ),
                      ),
                      SizedBox(
                        height: getVerticalSize(24),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: getHorizontalSize(20),
                            right: getHorizontalSize(20)),
                        child: Container(
                          height: getVerticalSize(80),
                          decoration: BoxDecoration(
                            color: ColorConstant.thirdDarkGreen,
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: getHorizontalSize(25),
                                right: getHorizontalSize(25)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    "asset/icons/ic_i_icon.svg",
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                        "Payment fee \$2 has been applied",
                                        style: AppStyle.textStyleDMSANS
                                            .copyWith(
                                                color:
                                                    ColorConstant.primaryWhite,
                                                fontWeight: FontWeight.w500,
                                                fontSize: getFontSize(18))),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Obx(
              () => AnimatedContainer(
                height: scanController.dropHeight.value,
                width: MediaQuery.of(context).size.width,
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: ColorConstant.primaryWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: getHorizontalSize(20),
                      right: getHorizontalSize(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Choose Method",
                        style: AppStyle.textStyleDMSANS.copyWith(
                            color: ColorConstant.naturalBlack,
                            fontWeight: FontWeight.w700,
                            fontSize: getFontSize(22)),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: scanController.animContainerHeighr.value,
                        child: Accordion(
                          paddingListBottom: 0,
                          paddingBetweenClosedSections: 0,
                          contentVerticalPadding: 0,
                          headerPadding: EdgeInsets.zero,
                          paddingListHorizontal: 0,
                          paddingListTop: 0,
                          contentHorizontalPadding: 0,
                          paddingBetweenOpenSections: 0,
                          headerBorderRadius: 20,
                          headerBackgroundColorOpened: Colors.black54,
                          scaleWhenAnimating: false,
                          openAndCloseAnimation: true,
                          sectionOpeningHapticFeedback:
                              SectionHapticFeedback.heavy,
                          sectionClosingHapticFeedback:
                              SectionHapticFeedback.light,

                          children: [
                           /* AccordionSection(
                              contentBackgroundColor: ColorConstant.primaryWhite,
                              contentVerticalPadding: 12,
                              headerPadding: EdgeInsets.zero,
                              contentBorderRadius: 12,
                              contentBorderColor: Colors.white,
                              isOpen: true,
                              leftIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 12),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    height: 55,
                                    width: 80,
                                    child: Image.asset(
                                      "asset/Logo.png",
                                    )),
                              ),
                              rightIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(CupertinoIcons.chevron_up),
                              ),
                              flipRightIconIfOpen: true,
                              headerBackgroundColor:
                                  ColorConstant.primaryAppTextF1,
                              headerBackgroundColorOpened:
                                  ColorConstant.primaryAppTextF1,
                              header: Container(
                                  child: Text(scanController.selectedMethod.value,
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.primaryBlack,
                                          fontSize: getFontSize(16),
                                          fontWeight: FontWeight.bold))),
                              content: Column(
                                children: [
                                  Obx(
                                    () => scanController.isFirstOpen.value
                                        ? AccordionSection(
                                      onOpenSection: (){
                                        scanController.onTaoOfItem("Wallet");
                                      },
                                      headerPadding: EdgeInsets.zero,
                                      contentVerticalPadding: 0,
                                      headerBorderRadius: 0,
                                            contentBorderRadius: 40,
                                            isOpen: false,
                                            leftIcon: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 12),
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  12))),
                                                  height: 55,
                                                  width: 80,
                                                  child: Image.asset(
                                                    "asset/Logo.png",
                                                  )),
                                            ),
                                            header: Container(
                                                child: Text('Wallet',
                                                    style: AppStyle.DmSansFont
                                                        .copyWith(
                                                            color: ColorConstant
                                                                .primaryBlack,
                                                            fontSize:
                                                                getFontSize(16),
                                                            fontWeight: FontWeight
                                                                .bold))),
                                        headerBackgroundColor:
                                        ColorConstant.primaryAppTextF1,
                                        headerBackgroundColorOpened:
                                        ColorConstant.primaryAppTextF1,
                                            content: SizedBox())
                                        : AccordionSection(
                                            isOpen: false,
                                            header: Text(''),
                                            contentBorderColor:
                                                const Color(0xffffffff),
                                            headerBackgroundColorOpened:
                                                Colors.white,
                                        headerBackgroundColor:
                                        ColorConstant.primaryWhite,
                                            content: SizedBox()),
                                  ),

                                  Obx(
                                        () => scanController.isFirstOpen.value
                                        ? AccordionSection(
                                            onOpenSection: (){
                                              scanController.onTaoOfItem("Card");
                                            },
                                        headerPadding: EdgeInsets.zero,
                                        contentVerticalPadding: 0,
                                        headerBorderRadius: 0,
                                        contentBorderRadius: 40,
                                            isOpen: false,
                                        leftIcon: Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              vertical: 8.0,
                                              horizontal: 12),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          12))),
                                              height: 55,
                                              width: 80,
                                              child: Image.asset(
                                                "asset/Logo.png",
                                              )),
                                        ),
                                        header: Container(
                                            child: Text('Card',
                                                style: AppStyle.DmSansFont
                                                    .copyWith(
                                                    color: ColorConstant
                                                        .primaryBlack,
                                                    fontSize:
                                                    getFontSize(16),
                                                    fontWeight: FontWeight
                                                        .bold))),
                                        headerBackgroundColor:
                                        ColorConstant.primaryAppTextF1,
                                        headerBackgroundColorOpened:
                                        ColorConstant.primaryAppTextF1,
                                        content: Container())
                                        : AccordionSection(
                                            isOpen: false,
                                            header: Text(''),
                                            contentBorderColor:
                                            const Color(0xffffffff),
                                            headerBackgroundColorOpened:
                                            Colors.white,
                                            headerBackgroundColor:
                                            ColorConstant.primaryWhite,
                                            content: SizedBox()),
                                  ),

                                  Obx(
                                        () => scanController.isFirstOpen.value
                                        ? AccordionSection(
                                            onOpenSection: (){
                                              scanController.onTaoOfItem("Bank");
                                            },
                                        headerPadding: EdgeInsets.zero,
                                        contentVerticalPadding: 0,
                                        headerBorderRadius: 0,
                                        contentBorderRadius: 40,
                                            isOpen: false,
                                        leftIcon: Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              vertical: 8.0,
                                              horizontal: 12),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          12))),
                                              height: 55,
                                              width: 80,
                                              child: Image.asset(
                                                "asset/Logo.png",
                                              )),
                                        ),
                                        header: Container(
                                            child: Text('Bank',
                                                style: AppStyle.DmSansFont
                                                    .copyWith(
                                                    color: ColorConstant
                                                        .primaryBlack,
                                                    fontSize:
                                                    getFontSize(16),
                                                    fontWeight: FontWeight
                                                        .bold))),
                                        headerBackgroundColor:
                                        ColorConstant.primaryAppTextF1,
                                        headerBackgroundColorOpened:
                                        ColorConstant.primaryAppTextF1,
                                        content: Container())
                                        : AccordionSection(
                                            isOpen: false,
                                            header: Text(''),
                                            contentBorderColor:
                                            const Color(0xffffffff),
                                            headerBackgroundColorOpened:
                                            Colors.white,
                                            headerBackgroundColor:
                                            ColorConstant.primaryWhite,
                                            content: SizedBox()),
                                  ),

                                  Obx(
                                        () => scanController.isFirstOpen.value
                                        ? AccordionSection(
                                            onOpenSection: (){
                                              scanController.onTaoOfItem("Cash Card");
                                            },
                                        headerPadding: EdgeInsets.zero,
                                        contentVerticalPadding: 0,
                                        headerBorderRadius: 0,
                                        contentBorderRadius: 40,
                                            isOpen: false,
                                        leftIcon: Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              vertical: 8.0,
                                              horizontal: 12),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          12))),
                                              height: 55,
                                              width: 80,
                                              child: Image.asset(
                                                "asset/Logo.png",
                                              )),
                                        ),
                                        header: Container(
                                            child: Text('Cash Card',
                                                style: AppStyle.DmSansFont
                                                    .copyWith(
                                                    color: ColorConstant
                                                        .primaryBlack,
                                                    fontSize:
                                                    getFontSize(16),
                                                    fontWeight: FontWeight
                                                        .bold))),
                                        headerBackgroundColor:
                                        ColorConstant.primaryAppTextF1,
                                        headerBackgroundColorOpened:
                                        ColorConstant.primaryAppTextF1,
                                        content: Container())
                                        : AccordionSection(
                                            isOpen: false,
                                            header: Text(''),
                                            contentBorderColor:
                                            const Color(0xffffffff),
                                            headerBackgroundColorOpened:
                                            Colors.white,
                                            headerBackgroundColor:
                                            ColorConstant.primaryWhite,
                                            content: SizedBox()),
                                  ),
                                ],
                              ),
                              contentHorizontalPadding: 0,
                              contentBorderWidth: 1,
                              onOpenSection: () {
                                scanController.onChangeOfExpansonTile();
                              },
                              onCloseSection: () {
                                scanController.onChangeOfExpansonTile();
                              },
                            ),*/

                            AccordionSection(
                              contentBackgroundColor: ColorConstant.primaryWhite,
                              contentVerticalPadding: 12,
                              headerPadding: EdgeInsets.zero,
                              contentBorderRadius: 12,
                              contentBorderColor: Colors.white,
                              isOpen:  scanController.isFirstOpen.value,
                              leftIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 8),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: ColorConstant.primaryWhite,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    height: 55,
                                    width: 70,
                                    padding: EdgeInsets.all(8),
                                    child: Image.asset(
                                      "asset/icons/ic_main_card.png",
                                    )),
                              ),
                              rightIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(CupertinoIcons.chevron_down,color: ColorConstant.primaryDarkGreen,),
                              ),
                              flipRightIconIfOpen: false,
                              headerBackgroundColor:
                              ColorConstant.primaryAppTextF1,
                              headerBackgroundColorOpened:
                              ColorConstant.primaryAppTextF1,
                              header: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Secure Cash Card",
                                          style: AppStyle.DmSansFont.copyWith(
                                              color: ColorConstant.primaryBlack,
                                              fontSize: getFontSize(18),
                                              fontWeight: FontWeight.w600)),
                                      Text(
                                          CommonUtils.FormatCardNumber(
                                              scanController.loginResponseModel.value.data!.cardNumber.toString()),
                                          style: AppStyle.DmSansFont.copyWith(
                                              color: ColorConstant.primaryBlack,
                                              fontSize: getFontSize(18),
                                              fontWeight: FontWeight.normal)),
                                    ],
                                  )),
                              content: Column(
                                children: [
                                  // AccordionSection(
                                  //   contentBackgroundColor: ColorConstant.primaryWhite,
                                  //   contentVerticalPadding: 0,
                                  //   headerPadding: EdgeInsets.zero,
                                  //   contentBorderRadius: 12,
                                  //   contentBorderColor: Colors.white,
                                  //   isOpen: false,
                                  //   leftIcon: Padding(
                                  //     padding: const EdgeInsets.symmetric(
                                  //         vertical: 8.0, horizontal: 12),
                                  //     child: Container(
                                  //         decoration: BoxDecoration(
                                  //             color: Colors.white,
                                  //             borderRadius: BorderRadius.all(
                                  //                 Radius.circular(12))),
                                  //         height: 55,
                                  //         width: 80,
                                  //         child: Image.asset(
                                  //           "asset/Logo.png",
                                  //         )),
                                  //   ),
                                  //   flipRightIconIfOpen: true,
                                  //   headerBackgroundColor:
                                  //   ColorConstant.primaryAppTextF1,
                                  //   headerBackgroundColorOpened:
                                  //   ColorConstant.primaryAppTextF1,
                                  //   header: Container(
                                  //       child: Text("Wallet",
                                  //           style: AppStyle.DmSansFont.copyWith(
                                  //               color: ColorConstant.primaryBlack,
                                  //               fontSize: getFontSize(16),
                                  //               fontWeight: FontWeight.bold))),
                                  //   content: SizedBox(),
                                  //   contentHorizontalPadding: 0,
                                  //   contentBorderWidth: 1,
                                  //   onOpenSection: () {
                                  //     scanController.onTaoOfItem("Wallet");
                                  //   },
                                  //   onCloseSection: () {
                                  //     scanController.onTaoOfItem("Wallet");
                                  //   },
                                  // ),
                                  // AccordionSection(
                                  //   contentBackgroundColor: ColorConstant.primaryWhite,
                                  //   contentVerticalPadding: 0,
                                  //   headerPadding: EdgeInsets.zero,
                                  //   contentBorderRadius: 12,
                                  //   contentBorderColor: Colors.white,
                                  //   isOpen: false,
                                  //   leftIcon: Padding(
                                  //     padding: const EdgeInsets.symmetric(
                                  //         vertical: 8.0, horizontal: 12),
                                  //     child: Container(
                                  //         decoration: BoxDecoration(
                                  //             color: Colors.white,
                                  //             borderRadius: BorderRadius.all(
                                  //                 Radius.circular(12))),
                                  //         height: 55,
                                  //         width: 80,
                                  //         child: Image.asset(
                                  //           "asset/Logo.png",
                                  //         )),
                                  //   ),
                                  //   flipRightIconIfOpen: true,
                                  //   headerBackgroundColor:
                                  //   ColorConstant.primaryAppTextF1,
                                  //   headerBackgroundColorOpened:
                                  //   ColorConstant.primaryAppTextF1,
                                  //   header: Container(
                                  //       child: Text("Cash Card",
                                  //           style: AppStyle.DmSansFont.copyWith(
                                  //               color: ColorConstant.primaryBlack,
                                  //               fontSize: getFontSize(16),
                                  //               fontWeight: FontWeight.bold))),
                                  //   content: SizedBox(),
                                  //   contentHorizontalPadding: 0,
                                  //   contentBorderWidth: 1,
                                  //   onOpenSection: () {
                                  //     scanController.onTaoOfItem("Cash Card");
                                  //   },
                                  //   onCloseSection: () {
                                  //     scanController.onTaoOfItem("Cash Card");                                    },
                                  // ),
                                ],
                              ),
                              contentHorizontalPadding: 0,
                              contentBorderWidth: 1,
                              onOpenSection: () {
                                // scanController.onChangeOfExpansonTile();
                              },
                              onCloseSection: () {
                                // scanController.onChangeOfExpansonTile();
                              },
                            ),
                          ],
                        ),
                      ),

                      AppElevatedButton(
                        buttonName: "Proceed to Pay",
                        textColor: Colors.white,
                        buttonColor: ColorConstant.primaryLightGreen,
                        radius: 16,
                        onPressed: () {
                          scanController.processToPay();
                        },
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class AccordionPage extends StatelessWidget
{
  const AccordionPage({Key? key}) : super(key: key);

  final _headerStyle = const TextStyle(
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  final _contentStyleHeader = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  final _contentStyle = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
  final _loremIpsum =
      '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';

  @override
  build(context) => Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: const Text('Accordion'),
        ),
        body: Accordion(
          maxOpenSections: 2,
          headerBackgroundColorOpened: Colors.black54,
          scaleWhenAnimating: false,
          openAndCloseAnimation: true,
          headerPadding:
              const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
          sectionClosingHapticFeedback: SectionHapticFeedback.light,
          children: [
            AccordionSection(
              isOpen: true,
              leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
              headerBackgroundColor: Colors.black,
              headerBackgroundColorOpened: Colors.red,
              header: Text('Introduction', style: _headerStyle),
              content: Column(
                children: [
                  AccordionSection(
                    isOpen: true,
                    leftIcon:
                        const Icon(Icons.compare_rounded, color: Colors.white),
                    header: Text('Nested Accordion', style: _headerStyle),
                    contentBorderColor: const Color(0xffffffff),
                    headerBackgroundColorOpened: Colors.amber,
                    content: Accordion(
                      maxOpenSections: 1,
                      headerBackgroundColorOpened: Colors.black54,
                      headerPadding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 15),
                      children: [
                        AccordionSection(
                          isOpen: false,
                          leftIcon: const Icon(Icons.insights_rounded,
                              color: Colors.white),
                          headerBackgroundColor: Colors.black38,
                          headerBackgroundColorOpened: Colors.black54,
                          header:
                              Text('Nested Section #1', style: _headerStyle),
                          content: Text(_loremIpsum, style: _contentStyle),
                          contentHorizontalPadding: 20,
                          contentBorderColor: Colors.black54,
                        ),
                        AccordionSection(
                          isOpen: true,
                          leftIcon: const Icon(Icons.compare_rounded,
                              color: Colors.white),
                          header:
                              Text('Nested Section #2', style: _headerStyle),
                          headerBackgroundColor: Colors.black38,
                          headerBackgroundColorOpened: Colors.black54,
                          contentBorderColor: Colors.black54,
                          content: Row(
                            children: [
                              const Icon(Icons.compare_rounded,
                                  size: 120, color: Colors.orangeAccent),
                              Flexible(
                                  flex: 1,
                                  child:
                                      Text(_loremIpsum, style: _contentStyle)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  AccordionSection(
                    isOpen: false,
                    leftIcon: const Icon(Icons.food_bank, color: Colors.white),
                    header: Text('Company Info', style: _headerStyle),
                    content: DataTable(
                      sortAscending: true,
                      sortColumnIndex: 1,
                      dataRowHeight: 40,
                      showBottomBorder: false,
                      columns: [
                        DataColumn(
                            label: Text('ID', style: _contentStyleHeader),
                            numeric: true),
                        DataColumn(
                            label: Text('Description',
                                style: _contentStyleHeader)),
                        DataColumn(
                            label: Text('Price', style: _contentStyleHeader),
                            numeric: true),
                      ],
                      rows: [
                        DataRow(
                          cells: [
                            DataCell(Text('1',
                                style: _contentStyle,
                                textAlign: TextAlign.right)),
                            DataCell(
                                Text('Fancy Product', style: _contentStyle)),
                            DataCell(Text(r'$ 199.99',
                                style: _contentStyle,
                                textAlign: TextAlign.right))
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text('2',
                                style: _contentStyle,
                                textAlign: TextAlign.right)),
                            DataCell(
                                Text('Another Product', style: _contentStyle)),
                            DataCell(Text(r'$ 79.00',
                                style: _contentStyle,
                                textAlign: TextAlign.right))
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text('3',
                                style: _contentStyle,
                                textAlign: TextAlign.right)),
                            DataCell(Text('Really Cool Stuff',
                                style: _contentStyle)),
                            DataCell(Text(r'$ 9.99',
                                style: _contentStyle,
                                textAlign: TextAlign.right))
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text('4',
                                style: _contentStyle,
                                textAlign: TextAlign.right)),
                            DataCell(Text('Last Product goes here',
                                style: _contentStyle)),
                            DataCell(Text(r'$ 19.99',
                                style: _contentStyle,
                                textAlign: TextAlign.right))
                          ],
                        ),
                      ],
                    ),
                  ),
                  AccordionSection(
                    isOpen: false,
                    leftIcon:
                        const Icon(Icons.contact_page, color: Colors.white),
                    header: Text('Contact', style: _headerStyle),
                    content: Wrap(
                      children: List.generate(
                          30,
                          (index) => const Icon(Icons.contact_page,
                              size: 30, color: Color(0xff999999))),
                    ),
                  ),
                ],
              ),
              contentHorizontalPadding: 20,
              contentBorderWidth: 1,
              // onOpenSection: () => print('onOpenSection ...'),
              // onCloseSection: () => print('onCloseSection ...'),
            ),
          ],
        ),
      );
}
