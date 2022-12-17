
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:secure_cash_app/presentation/ScanScreen/scan_success_screen.dart';
import 'package:secure_cash_app/presentation/ScanScreen/scan_summary_screen.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_AppBar .dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/ui_utils.dart';
import 'controller/scan_screen_controller.dart';

class ScanScreen extends StatefulWidget {
  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  var scanController = Get.put(ScanScreenController());
  // var scanController = Get.find<ScanScreenController>();


  Barcode? result;



  int? counter=0;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Future<void> _initCamera() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.microphone,
    ].request();

    if (statuses[Permission.camera]==PermissionStatus.denied || statuses[Permission.microphone]==PermissionStatus.denied) {
      Navigator.pop(context);
      Get.dialog(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: getVerticalSize(325)),
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
                    SizedBox(height: 22,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child:Text(
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
                          Navigator.pop(context);
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
    else if(statuses[Permission.camera]==PermissionStatus.permanentlyDenied || statuses[Permission.microphone]==PermissionStatus.permanentlyDenied){
      Navigator.pop(context);
      Get.dialog(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: getVerticalSize(325)),
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
                    SizedBox(height: 22,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child:Text(
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
    else if (statuses[Permission.camera]==PermissionStatus.granted && statuses[Permission.microphone]==PermissionStatus.granted) {

    }
  }
  @override
  void dispose() {
    counter=0;
    // controller?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryDarkGreen,
        body: Column(
          children: [
            SizedBox(
              height: getVerticalSize(52),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Scan to Pay",
                  style: AppStyle.textStyleDMSANS.copyWith(
                      color: ColorConstant.primaryWhite,
                      fontWeight: FontWeight.w700,
                      fontSize: getFontSize(24)),
                ),
              ],
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
      this.scanController.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        scanController.qrCodeResult.value=scanData.code.toString();
        print("UdId"+scanData.code.toString());
        if(scanController.qrCodeResult.value.isNotEmpty){

          if(scanController.qrCodeResult.value!=null && scanController.qrCodeResult.value.isNotEmpty){
            //UIUtils.showSnakBar(headerText: "Success",bodyText: "Qr Code Scan Successfully");
            scanController.controller?.pauseCamera();
            scanController.uuid.value=scanController.qrCodeResult.value;
             scanController.callGetUuidApi();
           // Get.to(ScanSummaryScreen());
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
