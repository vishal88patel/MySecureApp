import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/utils/ConstantsFiles/string_constants.dart';
import 'package:my_secure_app/utils/HelperFiles/pref_utils.dart';


class InitialBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp();
    PrefUtils.init();
    Get.put(PrefUtils());
    StringConstants.PLATFORM_STRING=Platform.isIOS?"ios":"android";
    // await NativeMethodChannel.platformForMoEngage.invokeMethod('InitilizeMoEngage');
    // final MoEngageFlutter _moengagePlugin = MoEngageFlutter();
    // _moengagePlugin.initialise();
    // _moengagePlugin.showInApp();
  }
}
