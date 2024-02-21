import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_AppBar .dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../theme/app_style.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/ui_utils.dart';
import '../KycStep1ModuleScreen/front_back_licence_screen.dart';
import '../KycStep1ModuleScreen/front_passport_screen.dart';
import '../instructionScreen/controller/instruction_screen_controller.dart';
import 'controller/gif_screen_controller.dart';

class GifScreen extends StatefulWidget {
  @override
  State<GifScreen> createState() => _GifScreenState();
}

class _GifScreenState extends State<GifScreen> with TickerProviderStateMixin {
  var gifController = Get.put(GifScreenController);
  var onBoardingController = Get.find<InstructionScreenController>();
  late FlutterGifController controller;

  @override
  void initState() {

    controller= FlutterGifController(vsync: this);
    moveFiles();
    super.initState();
  }


  @override
  dispose() {
    controller.dispose(); // you need this
    super.dispose();
  }

  moveFiles() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      controller.repeat(min:0, max:300, period:const Duration(milliseconds:10000));
    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryBlack,
        body: SingleChildScrollView(
          child: Container(
              height: size.height,
              child:  Center(
                child:  Image.asset("asset/animations/fast.gif",repeat: ImageRepeat.repeat,),
              )
          ),
        ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding:  EdgeInsets.all(16.0),
        child: AppElevatedButton(
          buttonName: "Scan Documents",
          textColor: Colors.white,
          buttonColor:
          ColorConstant.primaryLightGreen,
          radius: 16,
          onPressed: () {
            if(onBoardingController.isFrom.value=="0"){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    const FrontBackLicenceCameraScreen(
                      image: 2,
                      title:"Scan the front image of\n Driving Licence",
                    )),
              );
            }else{
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        FrontPassportCameraScreen(
                          title: 'Passport',
                          image: 4,
                        )),
              );
            }
          },
        ),
      ),
    );

  }
}

