import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import 'package:secure_cash_app/presentation/statistic/statistic.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../theme/app_style.dart';
import '../../webQrCodeScreen.dart';
import '../BitCoinScreen/bitcoinn_screen.dart';
import '../HomeScreen/home_screen.dart';
import '../ScanScreen/scan_screen.dart';
import '../profileScreen/profile_screen.dart';
import 'controller/dashboard_screen_controller.dart';

class DashBoardScreen extends StatelessWidget {
  var dashBoardController = Get.find<DashBoardScreenController>();

  // var scanController = Get.find<ScanScreenController>();
  // var scanController = Get.put(ScanScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(
        () => WillPopScope(
          onWillPop: () => dashBoardController.showLogOutDialouge(),
          child: IndexedStack(
            index: dashBoardController.selectedIndex.value,
            children: [
              HomeScreen(),
              StatisticScreen(),
              ScanScreen(),
              BitCoinnScreen(),
              ProfileScreen(),
              // TransactionScreen(),
              // LinkBankListScreen(),
              // ApplyLoanInfoScreen(),
              // ProfileScreen()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstant.primaryOrange,
        child: Center(
          child: SvgPicture.asset("asset/icons/ic_scan.svg"),
        ),
        onPressed: ()async {
          var res = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WebQrCodeScreen(),
              ));



          // initPermission().then((value) {
          //   dashBoardController.onTapOfBottomnavigation(2);
          // });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 7,
        child: Container(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  // scanController. controller?.pauseCamera();
                  dashBoardController.onTapOfBottomnavigation(0);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: getHorizontalSize(30)),
                  child: Obx(
                    () => dashBoardController.selectedIndex.value == 0
                        ? SvgPicture.asset(
                            "asset/icons/ic_home_selected.svg",
                            height: getVerticalSize(32),
                          )
                        : SvgPicture.asset(
                            "asset/icons/ic_home.svg",
                            color: ColorConstant.primaryDarkGreen,
                            height: getVerticalSize(26),
                          ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // scanController. controller?.pauseCamera();
                  dashBoardController.onTapOfBottomnavigation(1);
                },
                child: Padding(
                  padding: EdgeInsets.only(right: getHorizontalSize(100)),
                  child: Obx(
                    () => dashBoardController.selectedIndex.value == 1
                        ? SvgPicture.asset(
                            "asset/icons/ic_statistic_selected.svg",
                            color: ColorConstant.primaryDarkGreen,
                            height: getVerticalSize(32),
                          )
                        : SvgPicture.asset(
                            "asset/icons/ic_statistic.svg",
                            color: ColorConstant.primaryDarkGreen,
                            height: getVerticalSize(26),
                          ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // scanController. controller?.pauseCamera();
                  dashBoardController.onTapOfBottomnavigation(3);
                },
                child: Obx(
                  () => dashBoardController.selectedIndex.value == 3
                      ? SvgPicture.asset(
                          "asset/icons/ic_bitcoin_checked.svg",
                          color: ColorConstant.primaryDarkGreen,
                          height: getVerticalSize(32),
                        )
                      : SvgPicture.asset(
                          "asset/icons/ic_bitcoin.svg",
                          color: ColorConstant.primaryDarkGreen,
                          height: getVerticalSize(26),
                        ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // scanController. controller?.pauseCamera();
                  dashBoardController.onTapOfBottomnavigation(4);
                },
                child: Padding(
                  padding: EdgeInsets.only(right: getHorizontalSize(30)),
                  child: Obx(
                    () => dashBoardController.selectedIndex.value == 4
                        ? SvgPicture.asset(
                            "asset/icons/ic_profile_selected.svg",
                            color: ColorConstant.primaryDarkGreen,
                            height: getVerticalSize(32),
                          )
                        : SvgPicture.asset(
                            "asset/icons/ic_profile.svg",
                            color: ColorConstant.primaryDarkGreen,
                            height: getVerticalSize(26),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> initPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.microphone,
    ].request();

    if (statuses[Permission.camera] == PermissionStatus.denied ||
        statuses[Permission.microphone] == PermissionStatus.denied) {
      Get.dialog(
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 50.0, vertical: getVerticalSize(325)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: ColorConstant.primaryDarkGreen),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (Get.isDialogOpen == true) Get.back();
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              textAlign: TextAlign.center,
                              "Please Allow Camera And Microphone Permission",
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.primaryWhite,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w300,
                                  fontSize: getFontSize(18)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: AppElevatedButton(
                        buttonName: 'Ok',
                        radius: 5,
                        textColor: Colors.white,
                        onPressed: () {
                          Get.back();
                          openAppSettings();
                          // Get.toNamed(AppRoutes.dashBoardScreen);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        barrierDismissible: false,
      );
    }
    else if (statuses[Permission.camera] ==
            PermissionStatus.permanentlyDenied ||
        statuses[Permission.microphone] == PermissionStatus.permanentlyDenied) {
      Get.dialog(
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 50.0, vertical: getVerticalSize(325)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: ColorConstant.primaryDarkGreen),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (Get.isDialogOpen == true) Get.back();
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              textAlign: TextAlign.center,
                              "Please Allow Camera And Microphone Permission",
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.primaryWhite,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w300,
                                  fontSize: getFontSize(18)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: AppElevatedButton(
                        buttonName: 'Ok',
                        radius: 5,
                        textColor: Colors.white,
                        onPressed: () {
                          if (Get.isDialogOpen == true) Get.back();
                          openAppSettings();
                          // Get.toNamed(AppRoutes.dashBoardScreen);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        barrierDismissible: false,
      );
    }
    else if (statuses.length==0) {
      Get.dialog(
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 50.0, vertical: getVerticalSize(325)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: ColorConstant.primaryDarkGreen),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (Get.isDialogOpen == true) Get.back();
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              textAlign: TextAlign.center,
                              "Please Allow Camera And Microphone Permission",
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.primaryWhite,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w300,
                                  fontSize: getFontSize(18)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: AppElevatedButton(
                        buttonName: 'Ok',
                        radius: 5,
                        textColor: Colors.white,
                        onPressed: () {
                          if (Get.isDialogOpen == true) Get.back();
                          openAppSettings();
                          // Get.toNamed(AppRoutes.dashBoardScreen);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        barrierDismissible: false,
      );
    }
    else if (statuses[Permission.camera] == PermissionStatus.granted &&
        statuses[Permission.microphone] == PermissionStatus.granted) {}
  }
}



class PictureDecode extends StatefulWidget {


  const PictureDecode({Key? key}) : super(key: key);

  @override
  State<PictureDecode> createState() => _PictureDecodeState();
}

class _PictureDecodeState extends State<PictureDecode> {
  Result? currentResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRCodeDartScanView(
        scanInvertedQRCode: true,
        typeScan: TypeScan.takePicture,
        onCapture: (Result result) {
          setState(() {
            currentResult = result;
          });
        },
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 200),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Text: ${currentResult?.text ?? 'Not found'}'),
                Text('Format: ${currentResult?.barcodeFormat ?? 'Not found'}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}