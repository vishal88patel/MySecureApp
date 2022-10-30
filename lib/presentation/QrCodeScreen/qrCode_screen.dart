import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_secure_app/App%20Configurations/image_constants.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/main_custom_background.dart';
import '../../utils/HelperFiles/math_utils.dart';
import 'controller/qrCode_screen_controller.dart';

class QrCodeScreen extends StatelessWidget {
  var qrController = Get.find<QrCodeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: MainCutomBackGround(
        child: Container(
          color: Colors.white,
          child: QrImage(
            data: qrController.uuid.value,
            version: QrVersions.auto,
            size: 200.0,
          ),
        ),
      ),
    ));
  }
}
