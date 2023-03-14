
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/utils/HelperFiles/ui_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../utils/HelperFiles/math_utils.dart';
import 'controller/cc_card_detail_controller.dart';



class CCCardCameraScreen extends StatefulWidget {
  final int? image;
  final String? title;
  const CCCardCameraScreen({required this.image,required this.title}) : super();

  @override
  CCCardCameraScreenState createState() => CCCardCameraScreenState();
}

class CCCardCameraScreenState extends State<CCCardCameraScreen>
    with AutomaticKeepAliveClientMixin {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var ccCardDetailController = Get.find<CCCardDetailController>();
  int width=6;
  XFile? imageFile;
  @override
  void initState() {
    _initCamera();

    super.initState();
  }

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
      return Center(
        child: SizedBox(
          width: 32,
          height: 32,
          child: CircularProgressIndicator(color:ColorConstant.primaryDarkGreen),
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
            _buildCameraPreview(),
            cameraOverlay(padding: 2, aspectRatio:1, color: ColorConstant.primaryDarkGreen),
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
                          fit: BoxFit.fill,
                          color: Colors.white,
                          height: getVerticalSize(42),
                        ),
                      ),
                      Text(
                        "Card",
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
                    SizedBox(
                      height: getVerticalSize(100),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.title.toString(),
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
                              if(widget.image==1){
                                Get.back();
                                Get.back();
                              }else if(widget.image==2){
                                Get.back();
                                Get.back();
                                Get.back();
                              }
                              else{
                                Get.back();
                              }
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
  Widget cameraOverlay({required double padding, required double aspectRatio, required Color color}) {
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
          decoration: BoxDecoration(border: Border.all(color:  ColorConstant.buttonGreen)),
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
                backgroundColor:  ColorConstant.buttonGreen.withOpacity(0.2),
                radius: 40.0,
                child: Center(
                  child: Icon(
                    Icons.camera_alt,
                    size: 50.0,
                    color: ColorConstant.buttonGreen,
                  ),
                ),
              ),
            ),
            widget.image==1?InkWell(
              onTap: (){
                _onCameraSwitch();
              },
              child: Center(
                child: Icon(
                  Icons.cameraswitch_outlined,
                  size: 50.0,
                  color: ColorConstant.buttonGreen,
                ),
              ),
            ):Container(height: 40,width: 40,),

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
            ccCardDetailController.netImage1.value=file!.path;
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CCCardCameraScreen(
                    image: 2,title: 'Scan the back of your card',
                  )),
            );
          }else if(widget.image==2){
            ccCardDetailController.netImage2.value=file!.path;
            ccCardDetailController.callAddCardApi();


          }else{

          }

          if(file!.path.isNotEmpty){
            // Navigator.pop(context);
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