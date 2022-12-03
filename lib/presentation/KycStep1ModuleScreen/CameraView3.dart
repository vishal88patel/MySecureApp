import 'dart:developer';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/presentation/KycStep1ModuleScreen/controller/kyc_step1_screen_controller.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/utils/HelperFiles/ui_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/math_utils.dart';

class CameraScreen3 extends StatefulWidget {

  const CameraScreen3() : super();

  @override
  CameraScreen3State createState() => CameraScreen3State();
}

class CameraScreen3State extends State<CameraScreen3>
    with AutomaticKeepAliveClientMixin {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var kycStep1Controller = Get.find<KycStep1ScreenController>();
  int width=6;
  XFile? imageFile;
  @override
  void initState() {
    _initCamera();

    super.initState();
  }


  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras![1], ResolutionPreset.veryHigh);
    _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      _controller!.setFlashMode(FlashMode.off);
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_controller != null) {
      if (!_controller!.value.isInitialized) {
        return Container();
      }
    } else {
      return const Center(
        child: SizedBox(
          width: 32,
          height: 32,
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (!_controller!.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      key: _scaffoldKey,
      extendBody: true,
      body: WillPopScope(
        onWillPop: () async =>true,
        child: Stack(
          children: <Widget>[
            CustomPaint(
              foregroundPainter: Paint(),
              child: _buildCameraPreview(),
            ),
            ClipPath(
                clipper: Clip(),
                child:_buildCameraPreview(),),
            Column(
              children: [
                SizedBox(
                  height: getVerticalSize(52),
                ),
                Padding(
                  padding: EdgeInsets.only(left: getHorizontalSize(20),right: getHorizontalSize(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        "asset/icons/ic_back.svg",
                        fit: BoxFit.fill,
                        color: Colors.white,
                      ),
                      Text(
                        "KYC Selfie",
                        style: AppStyle.textStyleDMSANS.copyWith(
                            color: ColorConstant.primaryWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: getFontSize(24)),
                      ),
                      SvgPicture.asset(
                        "asset/icons/ic_back.svg",
                        fit: BoxFit.fill,
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildCameraPreview() {
    final size = MediaQuery.of(context).size;
    return ClipRect(
      child: Container(
        child: Transform.scale(
          scale: 6/4,
          child: Center(
            child: CameraPreview(_controller!),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Padding(
      padding:  EdgeInsets.only(bottom: 36.0),
      child: Container(
        color: Colors.transparent,
        height: 100.0,
        width: double.infinity,
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(height: 40,width: 40,),
            InkWell(
              onTap: (){
              _captureImage();
            },
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                radius: 40.0,
                  child: Center(
                      child: Icon(
                        Icons.camera_alt,
                        size: 50.0,
                        color:Colors.black,
                      ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                _onCameraSwitch();
              },
              child: Center(
                child: Icon(
                  Icons.cameraswitch_outlined,
                  size: 50.0,
                  color:Colors.white,
                ),
              ),
            )

          ],
        ),
      ),
    );
  }


  void _captureImage() async {
    print('_captureImage');
    if (_controller!.value.isInitialized) {
      takePicture().then((XFile? file) {
        if (mounted) {
          setState(() {
            imageFile = file;
          });
          kycStep1Controller.netImage1.value=file!.path;
            Get.toNamed(AppRoutes.kycLoadingScreen);
          if(file.path.isNotEmpty){
          }
          setState(() {});
        }
      });

    }
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = _controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }

    if (cameraController.value.isTakingPicture) {

      return null;
    }

    try {
      final XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {

      return null;
    }
  }
  Future<void> _onCameraSwitch() async {
    final CameraDescription cameraDescription =
    (_controller!.description == _cameras![0]) ? _cameras![1] : _cameras![0];
    if (_controller != null) {
      await _controller!.dispose();
    }
    log('message ');
    _controller = CameraController(cameraDescription, ResolutionPreset.veryHigh);
    _controller!.addListener(() {
      if (mounted) setState(() {});
      if (_controller!.value.hasError) {
        showInSnackBar('Camera error ${_controller!.value.errorDescription}');
      }
    });

    try {
      await _controller?.initialize();
    } on CameraException catch (e) {

    }
    if (mounted) {
      setState(() {});
    }
  }

  void showInSnackBar(String message) {
    UIUtils.showSnakBar(headerText: "",bodyText: message.toString());
  }

  void logError(String code, String message) =>
      print('Error: $code\nError Message: $message');

  @override
  bool get wantKeepAlive => true;
}

class Paint extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(ColorConstant.primaryDarkGreen, BlendMode.srcOver);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}
class Clip extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    print(size);
    Path path = Path()
      ..addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(25, size.height/5.5, size.width-50, size.height/1.75), Radius.circular(100000)));
    return path;
  }

  @override
  bool shouldReclip(oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}