import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_secure_app/utils/HelperFiles/ui_utils.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../App Configurations/color_constants.dart';
import '../theme/app_style.dart';
import '../utils/HelperFiles/math_utils.dart';
import 'CardDetailScreen/controller/card_detail_screen_controller.dart';
import 'UploadDocumentScreen/controller/uplod_document_screen_controller.dart';

class CameraScreen2 extends StatefulWidget {
  final int? image;
  const CameraScreen2({required this.image}) : super();

  @override
  CameraScreen2State createState() => CameraScreen2State();
}

class CameraScreen2State extends State<CameraScreen2>
    with AutomaticKeepAliveClientMixin {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var cardDetailController = Get.find<CardScreenController>();
  int width=6;
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
      body: Stack(
        children: <Widget>[
          _buildCameraPreview(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: getVerticalSize(60)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Take A Picture",
                      style: AppStyle.textStylePoppinsRegular.copyWith(
                          color: ColorConstant.primaryWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: getFontSize(30)),
                    ),
                  ],
                ),
              ),

            ],
          ),
          cameraOverlay(
              padding: 20, aspectRatio: 1, color: Color(0x90000000))
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
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
            ((constraints.maxWidth - width * padding) / aspectRatio)) /
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
          decoration: BoxDecoration(border: Border.all(color: Colors.cyan)),
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
            widget.image==1?InkWell(
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
            cardDetailController.netImage1.value=file!.path;
          }else if(widget.image==2){
            cardDetailController.netImage2.value=file!.path;
          }else{

          }
          if(file!.path.isNotEmpty){
            Navigator.pop(context);
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