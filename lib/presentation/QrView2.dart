import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_secure_app/utils/HelperFiles/ui_utils.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../App Configurations/color_constants.dart';
import '../theme/app_style.dart';
import '../utils/HelperFiles/math_utils.dart';
import 'TransactionScreen/controller/transaction_screen_controller.dart';
import 'UploadDocumentScreen/controller/uplod_document_screen_controller.dart';

class QRViewExample2 extends StatefulWidget {
  const QRViewExample2({Key? key, }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExample2State();
}

class _QRViewExample2State extends State<QRViewExample2> {
  Barcode? result;
  QRViewController? controller;
  int? counter=0;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var transactionController = Get.find<TransactionScreenController>();


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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(child: _buildQrView(context)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: getVerticalSize(60)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Scan Qr Code",
                      style: AppStyle.textStylePoppinsRegular.copyWith(
                          color: ColorConstant.primaryWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: getFontSize(30)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: getVerticalSize(50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){Navigator.pop(context);},
                      child: Icon(
                        Icons.cancel,
                        color: Colors.white,
                        size: getVerticalSize(80),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = MediaQuery.of(context).size.width/1.2;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutHeight:MediaQuery.of(context).size.width/1.2,
          cutOutWidth: MediaQuery.of(context).size.width/1.2,
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
        transactionController.qrCodeResult.value=scanData.code.toString();
        print(scanData.code.toString());
        if(transactionController.qrCodeResult.value.isNotEmpty && counter==0){
          counter=1;
          if(transactionController.qrCodeResult.value!=null && transactionController.qrCodeResult.value.isNotEmpty){
            UIUtils.showSnakBar(headerText: "Success",bodyText: "Qr Code Scan Successfully");
            transactionController.callGetUuidApi();
          }else{
            UIUtils.showSnakBar(headerText: "Error",bodyText: "Qr Code not valid please scan with valid document");
          }
        }
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }


}
