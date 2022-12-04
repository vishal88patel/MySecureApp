import 'dart:developer';
import 'dart:io';

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
import '../../Custom Widgets/app_AppBar .dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/math_utils.dart';
import 'licence_scan_screen.dart';


class FrontBackLicenceCameraScreen extends StatefulWidget {
  final int? image;
  final String title;
  const FrontBackLicenceCameraScreen({required this.image,
    required this.title}) : super();

  @override
  FrontBackLicenceCameraScreenState createState() => FrontBackLicenceCameraScreenState();
}

class FrontBackLicenceCameraScreenState extends State<FrontBackLicenceCameraScreen> with AutomaticKeepAliveClientMixin {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var kycStep1Controller = Get.find<KycStep1ScreenController>();

  XFile? imageFile;
  @override
  void initState() {
    _initCamera();

    super.initState();
  }


  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras![0], ResolutionPreset.veryHigh);
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
        onWillPop: () async => true,
        child: Stack(
          children: [
            _buildCameraPreview(),
            cameraOverlay(padding: 2,image: widget.image!, aspectRatio:1, color: ColorConstant.primaryDarkGreen),
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
                          Get.back();
                        },
                        child: SvgPicture.asset(
                          "asset/icons/ic_back.svg",
                          fit: BoxFit.fill,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Driving Licence",
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
                SizedBox(
                  height: getVerticalSize(16),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        "asset/icons/splash_image.svg",
                        height: getVerticalSize(100),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.title,
                          style: AppStyle.textStyleDMSANS.copyWith(
                              color: ColorConstant.primaryWhite,
                              fontWeight: FontWeight.w500,
                              fontSize: getFontSize(24)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget cameraOverlay({required double padding,required int image, required double aspectRatio, required Color color}) {
    return LayoutBuilder(builder: (context, constraints) {
      double parentAspectRatio = constraints.maxWidth / constraints.maxHeight;
      double horizontalPadding;
      double verticalPadding;

      if (parentAspectRatio < aspectRatio) {
        horizontalPadding = padding;
        verticalPadding = (constraints.maxHeight -
            ((constraints.maxWidth - 60 * padding) / aspectRatio)) /
            2;
      } else {
        verticalPadding = padding;
        horizontalPadding = (constraints.maxWidth -
            ((constraints.maxHeight - 2 * padding) * aspectRatio)) /
            2;
      }
      return Stack(fit: StackFit.expand, children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Container(width: horizontalPadding, color: color)),
        Align(
            alignment: Alignment.centerRight,
            child: Container(width: horizontalPadding, color: color)),
        Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: EdgeInsets.only(
                    left: horizontalPadding, right: horizontalPadding),
                height: verticalPadding,
                color: color)),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.only(
                    left: horizontalPadding, right: horizontalPadding),
                height: verticalPadding,
                color: color)),
        Container(

          margin: EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding),
          decoration: BoxDecoration(border: Border.all(color: ColorConstant.primaryDarkGreen),
              ),
        )
      ]);
    });
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

  Future<void> showWelcomeDialouge() async {
    await Future.delayed(Duration.zero);
    Get.dialog(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0,
              vertical: getVerticalSize(250)),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [ColorConstant.skyE8, ColorConstant.lightSky]),
              border: Border.all(
                // color: kHintColor,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: ColorConstant.primaryBlack),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getVerticalSize(30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                             Get.back();
                             Get.back();
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
                    SizedBox(height: getVerticalSize(50),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child:Text(
                              textAlign: TextAlign.center,
                              "The app is requesting camera permission",
                              style: AppStyle.textStyleDMSANS.copyWith(
                                  color: ColorConstant.primaryWhite,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w300,
                                  fontSize: getFontSize(18)),
                            ),

                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: getVerticalSize(50),),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: AppElevatedButton(
                        buttonName: 'Turn on camera',
                        radius: 5,
                        textColor: Color(0xFF08CDA1),
                        onPressed: () {
                          Get.back();
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
            Container(height: 40,width: 40,),

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
           if(widget.image==2){
            kycStep1Controller.netImage2.value=file!.path;
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const FrontBackLicenceCameraScreen(image: 3,title: 'Scan the back  image of Driving Licence',)),
            );

          }else if(widget.image==3){
            kycStep1Controller.netImage3.value=file!.path;
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LicenceScanScreen()),
            );
          }else{

          }
          if(file!.path.isNotEmpty){
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
      // A capture is already pending, do nothing.
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