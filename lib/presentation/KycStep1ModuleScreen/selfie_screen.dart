import 'dart:developer';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/presentation/KycStep1ModuleScreen/controller/kyc_step1_screen_controller.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/utils/HelperFiles/ui_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/math_utils.dart';

class SelfieScreen extends StatefulWidget {
  final int? image;
  const SelfieScreen({required this.image}) : super();

  @override
  SelfieScreenState createState() => SelfieScreenState();
}

class SelfieScreenState extends State<SelfieScreen>
    with AutomaticKeepAliveClientMixin {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var kycStep1Controller = Get.put(KycStep1ScreenController());
  int width=6;
  XFile? imageFile;
  @override
  void initState() {
    _initCamera();

    super.initState();
  }


  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras![1], ResolutionPreset.veryHigh,imageFormatGroup: ImageFormatGroup.yuv420,);
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
        onWillPop: () => showBackDialog(),
        child: Stack(
          children: <Widget>[
            CustomPaint(
              foregroundPainter: Paint(),
              child: _buildCameraPreview(),
            ),
            ClipPath(
                clipper: Clip(),
                child:_buildCameraPreview(),),
            widget.image==1?Center(child: Padding(
              padding: EdgeInsets.only(bottom:getVerticalSize(150),right: getHorizontalSize(8)),
              child: Image.asset("asset/icons/img_face.png",height: getVerticalSize(500),color: ColorConstant.primaryDarkGreen,),
            )):Container(),
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
                      InkWell(
                        onTap:(){
                          showBackDialog();
                        },
                        child: SvgPicture.asset(
                          "asset/icons/ic_back.svg",
                          height: getVerticalSize(40),
                          fit: BoxFit.fill,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.image==1?"KYC Selfie":"Selfie with Document",
                        style: AppStyle.textStyleDMSANS.copyWith(
                            color: ColorConstant.primaryWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: getFontSize(22)),
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
  Future<bool> showBackDialog() async {
    return await Get.dialog(
      Padding(
        padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(40)),
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Wrap(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: ColorConstant.primaryWhite,
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 15, bottom: 20),
                  constraints: const BoxConstraints(minWidth: 200),
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            "Are you sure,\n you want to cancel this process?",
                            textAlign: TextAlign.center,
                            style: AppStyle.DmSansFont
                                .copyWith(fontSize: 18,color: ColorConstant.darkBlue),

                          )),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: AppElevatedButton(buttonName: 'NO',
                              radius: 5,
                              buttonColor: ColorConstant.primaryDarkGreen,
                              onPressed: () {
                                Get.back();
                              },),
                          ),

                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: AppElevatedButton(buttonName: 'YES',
                              buttonColor: ColorConstant.primaryDarkGreen,
                              radius: 5,
                              onPressed: () {
                                Get.back();
                                Get.back();
                                Get.back();
                                Get.back();
                                Get.back();
                              },),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: true,
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
          if(widget.image==1){
            kycStep1Controller.netImage1.value=file!.path;
            Get.toNamed(AppRoutes.kycLoadingScreen,arguments: {
              "API_TYPE": 1
            });

          }else if(widget.image==5){
            kycStep1Controller.netImage5.value=file!.path;
            Get.toNamed(AppRoutes.kycselfieLoadingScreen,arguments: {
              "API_TYPE": 3
            });
          }
          else{

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
      ..addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(25, size.height/5.5, size.width-50, size.height/1.9), Radius.circular(100000)));
    return path;
  }

  @override
  bool shouldReclip(oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}