import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/account_detail_list_widget.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/presentation/CardDetailListScreen/controller/card_detail_list_screen_controller.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/ui_utils.dart';
import '../DashboardScreen/controller/dashboard_screen_controller.dart';
import '../HomeScreen/controller/home_screen_controller.dart';
import '../QrView2.dart';
import 'controller/transaction_screen_controller.dart';

class TransactionScreen extends StatelessWidget {
  var transactionController = Get.put(TransactionScreenController());
  var dashBoardController = Get.find<DashBoarScreenController>();

  var homeController = Get.put(HomeScreenController());

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#000000', 'Cancel', false, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    transactionController.qrCodeResult.value = barcodeScanRes;
    print("qrCodeResult:" + transactionController.qrCodeResult.value);
    if (transactionController.qrCodeResult.value != null &&
        transactionController.qrCodeResult.value.isNotEmpty) {
      transactionController.callGetUuidApi();
    }
  }

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
                      top: getVerticalSize(26)),
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                dashBoardController.selectedIndex.value != 1
                                    ? InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: ColorConstant.primaryWhite,
                                    ))
                                    : Container(),
                                SizedBox(width: 12,),
                                Text("My Wallet",
                                    style: AppStyle.textStylePoppinsRegular
                                        .copyWith(
                                        color: ColorConstant.primaryWhite,
                                        fontWeight: FontWeight.w600,
                                        fontSize: getFontSize(18))),
                                /*InkWell(
                                  onTap: (){ Get.toNamed(AppRoutes.homeScreen);
                                  },
                                  child: Image.asset('asset/icons/notification_icon.png',
                                    height: getVerticalSize(20),width: getHorizontalSize(16),),
                                )*/
                              ],
                            ),
                            SizedBox(
                              height: getVerticalSize(25),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'asset/trans_card_image.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: getVerticalSize(25),
                                  child: SizedBox(
                                    width: size.width,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: getHorizontalSize(50)),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          SizedBox(
                                            height: getVerticalSize(15),
                                          ),
                                          Row(
                                            children: [
                                              Text('Current Value',
                                                  style: AppStyle
                                                      .textStylePoppinsRegular
                                                      .copyWith(
                                                      fontWeight: FontWeight
                                                          .w400,
                                                      fontSize: getFontSize(
                                                          12))),
                                            ],
                                          ),
                                          SizedBox(
                                            height: getVerticalSize(25),
                                          ),
                                          Obx(
                                                () =>
                                                Text(
                                                    '\$${transactionController
                                                        .balance.value}',
                                                    style: AppStyle
                                                        .textStylePoppinsRegular
                                                        .copyWith(
                                                        fontWeight: FontWeight
                                                            .w700,
                                                        fontSize: getFontSize(
                                                            28))),
                                          ),
                                          SizedBox(
                                            height: getVerticalSize(5),
                                          ),
                                          Text('+\$0.0',
                                              style: AppStyle
                                                  .textStylePoppinsRegular
                                                  .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: getFontSize(20))),
                                          SizedBox(
                                            height: getVerticalSize(10),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Transactions in this week',
                                                  style: AppStyle
                                                      .textStylePoppinsRegular
                                                      .copyWith(
                                                      fontWeight: FontWeight
                                                          .w400,
                                                      fontSize: getFontSize(
                                                          12))),
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
                            SizedBox(
                              height: getVerticalSize(25),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      if (homeController
                                          .getLinkedBankModel.value.data!
                                          .length >
                                          0) {
                                        Get.toNamed(AppRoutes.cardListScreen);
                                      } else {
                                        UIUtils.showSnakBar(
                                          headerText: StringConstants.ERROR,
                                          bodyText: "Please Link Bank & Card First",
                                        );
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: ColorConstant.blue26,
                                          borderRadius: BorderRadius.circular(
                                              10)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: getVerticalSize(22)),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text('Add Cash',
                                                style: AppStyle
                                                    .textStylePoppinsRegular
                                                    .copyWith(
                                                    color:
                                                    ColorConstant.primaryWhite,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: getFontSize(15))),
                                            SizedBox(
                                              width: getHorizontalSize(12),
                                            ),
                                            DottedBorder(
                                                color: ColorConstant.skyE8,
                                                strokeWidth: 1,
                                                borderType: BorderType.Circle,
                                                radius: Radius.circular(100),
                                                child: Container(
                                                  height: getVerticalSize(26),
                                                  width: getHorizontalSize(26),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .all(4.0),
                                                    child: Image.asset(
                                                        'asset/Income_image.png'),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: getHorizontalSize(20),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                        AppRoutes.cashOutAmountNumPadScreen,
                                          arguments: {
                                            'WALLET_BALANCE': transactionController.balance
                                                .value,
                                          });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: ColorConstant.blue26,
                                          borderRadius: BorderRadius.circular(
                                              10)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: getVerticalSize(22)),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text('Cash Out',
                                                style: AppStyle
                                                    .textStylePoppinsRegular
                                                    .copyWith(
                                                    color:
                                                    ColorConstant.primaryWhite,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: getFontSize(15))),
                                            SizedBox(
                                              width: getHorizontalSize(12),
                                            ),
                                            DottedBorder(
                                                color: ColorConstant.skyE8,
                                                strokeWidth: 1,
                                                borderType: BorderType.Circle,
                                                radius: Radius.circular(100),
                                                child: Container(
                                                  height: getVerticalSize(26),
                                                  width: getHorizontalSize(26),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .all(4.0),
                                                    child: Image.asset(
                                                        'asset/Income_image.png'),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getVerticalSize(15),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (
                                                context) =>  QRViewExample2(
                                                )),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: ColorConstant.blue26,
                                          borderRadius: BorderRadius.circular(
                                              10)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: getVerticalSize(22)),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text('Scan & Pay',
                                                style: AppStyle
                                                    .textStylePoppinsRegular
                                                    .copyWith(
                                                    color:
                                                    ColorConstant.primaryWhite,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: getFontSize(15))),
                                            SizedBox(
                                              width: getHorizontalSize(12),
                                            ),
                                            DottedBorder(
                                                color: ColorConstant.skyE8,
                                                strokeWidth: 1,
                                                borderType: BorderType.Circle,
                                                radius: Radius.circular(100),
                                                child: Container(
                                                  height: getVerticalSize(26),
                                                  width: getHorizontalSize(26),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .all(4.0),
                                                    child: Image.asset(
                                                        'asset/scan_image.png'),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: getHorizontalSize(20),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                          AppRoutes.qrCodeScreen, arguments: {
                                        'UUID_ID': transactionController.uuid
                                            .value,
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: ColorConstant.blue26,
                                          borderRadius: BorderRadius.circular(
                                              10)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: getVerticalSize(22)),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text('My QrCode',
                                                style: AppStyle
                                                    .textStylePoppinsRegular
                                                    .copyWith(
                                                    color: ColorConstant
                                                        .primaryWhite,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: getFontSize(15))),
                                            SizedBox(
                                              width: getHorizontalSize(12),
                                            ),
                                            DottedBorder(
                                                color: ColorConstant.skyE8,
                                                strokeWidth: 1,
                                                borderType: BorderType.Circle,
                                                radius: Radius.circular(100),
                                                child: Container(
                                                  height: getVerticalSize(26),
                                                  width: getHorizontalSize(26),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .all(5.0),
                                                    child: Image.asset(
                                                        'asset/camera_image.png'),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                /* Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorConstant.blue26,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: getVerticalSize(22)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'View Account\n Details',
                                    style: AppStyle.textStylePoppinsRegular
                                        .copyWith(
                                            color: ColorConstant.primaryWhite,
                                            fontWeight: FontWeight.w500,
                                            fontSize: getFontSize(15)),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )*/
                              ],
                            ),
                            SizedBox(
                              height: getVerticalSize(25),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Transactions',
                                    style: AppStyle.textStylePoppinsRegular
                                        .copyWith(
                                        color: ColorConstant.primaryWhite,
                                        fontWeight: FontWeight.w700,
                                        fontSize: getFontSize(15))),
                                Image.asset(
                                  'asset/icons/Filter_icon.png',
                                  height: getVerticalSize(25),
                                  width: getHorizontalSize(25),
                                )
                              ],
                            ),
                            SizedBox(
                              height: getVerticalSize(25),
                            ),
                            Expanded(
                              child: Obx(() =>
                              transactionController
                                  .walletModel.value.data !=
                                  null
                                  ? ListView.builder(
                                  itemCount: transactionController
                                      .transactionList.value.length +
                                      1,
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  //controller: transactionController.controller,
                                  itemBuilder: (BuildContext context,
                                      int index) {
                                    if (index ==
                                        transactionController
                                            .transactionList.value.length) {
                                      if (transactionController.pageNumber
                                          .value >=
                                          transactionController.lastPage
                                              .value) {
                                        return Container();
                                      } else {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                              child: CircularProgressIndicator(
                                                color: ColorConstant.skyE8,
                                              )),
                                        );
                                      }
                                    } else {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: getVerticalSize(6.5)),
                                        child: AccountDetailListWidget(
                                            name: transactionController
                                                .transactionList.value[index]
                                                .notes,
                                            price: transactionController
                                                .transactionList.value[index]
                                                .amount,
                                            time: transactionController
                                                .transactionList.value[index]
                                                .createdAt ?? "",
                                            image: 'asset/icons/Apple_icon.png'),
                                      );
                                    }
                                  })
                                  : Container()),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ));
  }
}
