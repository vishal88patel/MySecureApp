import 'dart:ffi';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_secure_app/presentation/ScanScreen/scan_password_screen.dart';
import 'package:my_secure_app/presentation/ScanScreen/scan_success_screen.dart';
import 'package:my_secure_app/presentation/ScanScreen/scan_summary_screen.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_AppBar .dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/ui_utils.dart';
import 'controller/scan_screen_controller.dart';

class ScanScreen extends StatefulWidget {
  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  var scanController = Get.put(ScanScreenController());

  Barcode? result;

  QRViewController? controller;

  int? counter=0;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void initState() {
    super.initState();
    cameraStart();
  }
  Future<void> cameraStart() async {
    Future.delayed(Duration(milliseconds: 100), () {
      controller?.resumeCamera();
    });
  }
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryDarkGreen,
        body: Column(
          children: [
            SizedBox(
              height: getVerticalSize(26),
            ),
            AppAppBar(
              title: "Scan to Pay",
              icon1: "asset/icons/ic_back.svg",
              icon2: "asset/icons/ic_help.svg",
              onPressedIcon1: () {
                Get.back();
              },
              onPressedIcon2: () {},
            ),
            Expanded(child: _buildQrView(context)),

            Card(
              margin: const EdgeInsets.symmetric(horizontal: 0),
              color: ColorConstant.primaryWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36)),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: getHorizontalSize(20),
                      right: getHorizontalSize(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 16,
                      ),
                      Text(
                          "Payment with QR Code",
                          style: AppStyle.textStyleDMSANS.copyWith(
                              color: ColorConstant.naturalBlack,
                              fontWeight: FontWeight.w700,
                              fontSize: getFontSize(22)),
                        ),

                      SizedBox(
                        height: getVerticalSize(8),
                      ),
                     Text(
                          "Hold the code inside the frame, it will be scanned automatically",
                          textAlign: TextAlign.start,
                          style: AppStyle.textStyleDMSANS.copyWith(
                              color: ColorConstant.naturalGrey,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(18)),
                        ),

                      SizedBox(
                        height: getVerticalSize(32),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildQrView(BuildContext context) {

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        overlayColor:ColorConstant.primaryDarkGreen ,
        borderColor:ColorConstant.primaryLightGreen,
        borderRadius: 10,
        borderLength: MediaQuery.of(context).size.width/5,
        borderWidth: 10,
        cutOutHeight:MediaQuery.of(context).size.width/1.25,
        cutOutWidth: MediaQuery.of(context).size.width/1.25,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        scanController.qrCodeResult.value=scanData.code.toString();
        print(scanData.code.toString());
        if(scanController.qrCodeResult.value.isNotEmpty && counter==0){
          counter=1;
          if(scanController.qrCodeResult.value!=null && scanController.qrCodeResult.value.isNotEmpty){
            UIUtils.showSnakBar(headerText: "Success",bodyText: "Qr Code Scan Successfully");
            // scanController.callGetUuidApi();
            Get.to(ScanSummaryScreen());
          }else{
            UIUtils.showSnakBar(headerText: "Error",bodyText: "Qr Code not valid please scan with valid document");
          }
        }
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {

    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}
